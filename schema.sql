-- Create database
CREATE DATABASE IF NOT EXISTS exam_seating;
USE exam_seating;

-- Create users table
CREATE TABLE IF NOT EXISTS users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    full_name VARCHAR(100) NOT NULL,
    role VARCHAR(20) NOT NULL,
    created_at DATETIME NOT NULL,
    last_login DATETIME,
    is_active BOOLEAN DEFAULT TRUE
);

-- Create exams table
CREATE TABLE IF NOT EXISTS exams (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    subject VARCHAR(100) NOT NULL,
    exam_date DATETIME NOT NULL,
    duration_minutes INT NOT NULL,
    total_students INT,
    created_at DATETIME NOT NULL,
    created_by_user_id BIGINT NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (created_by_user_id) REFERENCES users(id)
);

-- Create rooms table
CREATE TABLE IF NOT EXISTS rooms (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    room_number VARCHAR(20) NOT NULL UNIQUE,
    building VARCHAR(50) NOT NULL,
    floor_number INT,
    total_seats INT NOT NULL,
    is_active BOOLEAN DEFAULT TRUE
);

-- Create seats table
CREATE TABLE IF NOT EXISTS seats (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    seat_number VARCHAR(20) NOT NULL,
    room_id BIGINT NOT NULL,
    row_number INT,
    column_number INT,
    is_active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (room_id) REFERENCES rooms(id)
);

-- Create students table
CREATE TABLE IF NOT EXISTS students (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    student_id VARCHAR(20) NOT NULL UNIQUE,
    full_name VARCHAR(100) NOT NULL,
    course VARCHAR(50) NOT NULL,
    semester INT,
    section VARCHAR(10),
    is_active BOOLEAN DEFAULT TRUE
);

-- Create allocations table
CREATE TABLE IF NOT EXISTS allocations (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    exam_id BIGINT NOT NULL,
    student_id BIGINT NOT NULL,
    room_id BIGINT NOT NULL,
    seat_id BIGINT NOT NULL,
    created_at DATETIME NOT NULL,
    created_by_user_id BIGINT NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (exam_id) REFERENCES exams(id),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (room_id) REFERENCES rooms(id),
    FOREIGN KEY (seat_id) REFERENCES seats(id),
    FOREIGN KEY (created_by_user_id) REFERENCES users(id)
);

-- Insert default admin user
INSERT INTO users (username, password, email, full_name, role, created_at)
VALUES ('admin', '$2a$10$rDkPvvAFV6GgJkKqX3.3/.KqX3.3/KqX3.3/KqX3.3/KqX3.3/KqX3.3', 'admin@example.com', 'System Administrator', 'ADMIN', NOW()); 