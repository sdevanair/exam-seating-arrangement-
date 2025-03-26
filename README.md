# Exam Seating Arrangement System

A modern web application for managing exam seating arrangements with advanced features and security measures.

## Features

- **Smart Seating Algorithm**
  - Automatic seat allocation based on multiple parameters
  - Conflict detection and resolution
  - Real-time seat updates

- **User Management**
  - Role-based access control (Admin, Staff, Student)
  - JWT-based authentication
  - Secure password hashing

- **Modern UI/UX**
  - Responsive design using Bootstrap 5
  - Dark/Light mode support
  - Interactive seat layout visualization

- **Advanced Features**
  - PDF report generation
  - Email notifications
  - Real-time updates using WebSocket
  - RESTful API endpoints

## Technical Stack

- **Backend**
  - Java Servlets & JSP
  - Hibernate ORM
  - MySQL Database
  - JWT Authentication

- **Frontend**
  - HTML5, CSS3, JavaScript
  - Bootstrap 5
  - jQuery
  - WebSocket for real-time updates

- **Tools & Libraries**
  - Maven for dependency management
  - iText7 for PDF generation
  - Jackson for JSON processing
  - JUnit for testing

## Getting Started

### Prerequisites

- JDK 11 or higher
- Maven 3.6+
- MySQL 8.0+
- Tomcat 9.0+

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/exam-seating-arrangement.git
```

2. Configure database:
```bash
mysql -u root -p < database/schema.sql
```

3. Update database configuration in `src/main/resources/hibernate.cfg.xml`

4. Build the project:
```bash
mvn clean package
```

5. Deploy the WAR file to Tomcat

### Configuration

1. Update email settings in `src/main/resources/email.properties`
2. Configure JWT secret in `src/main/resources/jwt.properties`
3. Set up WebSocket endpoint in `src/main/java/com/examseating/websocket/WebSocketConfig.java`

## Security Features

- JWT-based authentication
- Password hashing using BCrypt
- CSRF protection
- XSS prevention
- SQL injection protection
- Rate limiting

## API Documentation

The application provides RESTful APIs for:

- User management
- Seat allocation
- Report generation
- Real-time updates

API documentation is available at `/api-docs` after deployment.

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a new Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Bootstrap team for the UI framework
- Hibernate team for the ORM
- All contributors who helped improve this project 