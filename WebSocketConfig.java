package com.examseating.websocket;

import jakarta.websocket.*;
import jakarta.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.concurrent.ConcurrentHashMap;
import java.util.logging.Logger;
import java.util.logging.Level;

@ServerEndpoint("/websocket")
public class WebSocketConfig {
    private static final Logger LOGGER = Logger.getLogger(WebSocketConfig.class.getName());
    private static final ConcurrentHashMap<String, Session> sessions = new ConcurrentHashMap<>();

    @OnOpen
    public void onOpen(Session session) {
        sessions.put(session.getId(), session);
        LOGGER.log(Level.INFO, "New WebSocket connection established: {0}", session.getId());
    }

    @OnMessage
    public void onMessage(String message, Session session) {
        LOGGER.log(Level.INFO, "Received message from {0}: {1}", new Object[]{session.getId(), message});
        try {
            session.getBasicRemote().sendText("Server received: " + message);
        } catch (IOException e) {
            LOGGER.log(Level.SEVERE, "Error sending message to client: " + session.getId(), e);
        }
    }

    @OnClose
    public void onClose(Session session) {
        sessions.remove(session.getId());
        LOGGER.log(Level.INFO, "WebSocket connection closed: {0}", session.getId());
    }

    @OnError
    public void onError(Session session, Throwable throwable) {
        LOGGER.log(Level.SEVERE, "WebSocket error for session " + session.getId(), throwable);
    }

    // Utility method to broadcast messages to all connected clients
    public static void broadcastMessage(String message) {
        sessions.values().forEach(session -> {
            try {
                session.getBasicRemote().sendText(message);
            } catch (IOException e) {
                LOGGER.log(Level.SEVERE, "Error broadcasting message to client: " + session.getId(), e);
            }
        });
    }

    // Get the number of active connections
    public static int getActiveConnections() {
        return sessions.size();
    }

    // Check if a specific session is still active
    public static boolean isSessionActive(String sessionId) {
        return sessions.containsKey(sessionId);
    }
}