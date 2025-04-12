# Authentication API

A Node.js API with authentication features including:
- User registration (signup)
- User login
- Forgot password functionality

## Features

- User registration with email and password
- User login with JWT token authentication
- Password reset via email
- MongoDB database integration
- Express.js REST API

## Tech Stack

- Node.js
- Express.js
- MongoDB (with Mongoose)
- JWT for authentication
- bcrypt for password hashing
- Nodemailer for sending emails

## Getting Started

### Prerequisites

- Node.js (14+ recommended)
- MongoDB (local or Atlas)
- npm

### Installation

1. Clone the repository
```
git clone <repository-url>
```

2. Install dependencies
```
npm install
```

3. Create a `.env` file in the root directory with the following variables:
```
PORT=5000
MONGO_URI=mongodb://localhost:27017/auth_api
JWT_SECRET=your_jwt_secret_key_change_this_in_production
EMAIL_SERVICE=gmail
EMAIL_USERNAME=your_email@gmail.com
EMAIL_PASSWORD=your_email_password
EMAIL_FROM=noreply@yourapp.com
EMAIL_FROM_NAME=Your App
```

4. Start the server
```
npm run dev
```

## API Endpoints

### Authentication

- `POST /api/auth/register` - Register a new user
- `POST /api/auth/login` - Login a user
- `POST /api/auth/forgot-password` - Request password reset
- `POST /api/auth/reset-password/:token` - Reset password with token

## Usage Examples

### Register a new user

```
POST /api/auth/register
Content-Type: application/json

{
  "name": "Test User",
  "email": "user@example.com",
  "password": "password123"
}
```

### Login

```
POST /api/auth/login
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "password123"
}
```

### Forgot Password

```
POST /api/auth/forgot-password
Content-Type: application/json

{
  "email": "user@example.com"
}
```

### Reset Password

```
POST /api/auth/reset-password/:token
Content-Type: application/json

{
  "password": "newpassword123"
}
``` 