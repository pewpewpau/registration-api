# registration-api
interview task

# README.md

````md
# Registration API

A basic REST API built with Node.js, Express, TypeScript, and PostgreSQL for storing registration information.

The system captures:
- Personal Information
- Residential Address
- Postal Address

---

# Tech Stack

## Backend
- Node.js
- Express.js
- TypeScript
- PostgreSQL

## Frontend
- HTML
- TypeScript
- Vite

---

# Project Structure

```bash
registration-api/
├── backend/
│   ├── src/
│   │   ├── db.ts
│   │   ├── index.ts
│   │   ├── types.ts
│   │   └── routes/
│   │       └── registrations.ts
│   ├── package.json
│   ├── tsconfig.json
│   └── .env
│
└── frontend/
    ├── src/
    │   └── client.ts
    ├── index.html
    └── package.json
````

---

# Features

* Create registrations
* View all registrations
* View registration by ID
* PostgreSQL database integration
* REST API endpoints
* Frontend registration form

---

# Prerequisites

Before running the project, install:

* Node.js
* PostgreSQL
* Git

Recommended:

* Visual Studio Code
* Postman

---

# 1. Clone the Repository

```bash
git clone https://github.com/pewpewpau/registration-api.git
cd registration-api
```

---

# 2. Database Setup

Open PostgreSQL terminal:

```bash
psql -U postgres
```

Create database:

```sql
CREATE DATABASE registration_db;
```

Connect to database:

```sql
\c registration_db
```

Create the table:

```sql
CREATE TABLE registrations (
  id SERIAL PRIMARY KEY,
  created_at TIMESTAMPTZ DEFAULT NOW(),

  -- Personal Info
  first_name     VARCHAR(100) NOT NULL,
  last_name      VARCHAR(100) NOT NULL,
  email          VARCHAR(255) UNIQUE NOT NULL,
  phone          VARCHAR(20),
  date_of_birth  DATE,

  -- Residential Address
  res_city       VARCHAR(255),
  res_street     VARCHAR(100),
  res_erf        VARCHAR(100),

  -- Postal Address
  post_address   VARCHAR(255),
  post_city      VARCHAR(100),
  post_country   VARCHAR(100)
);
```

---

# 3. Backend Setup

Navigate to backend folder:

```bash
cd backend
```

Install dependencies:

```bash
npm install
```

---

# 4. Configure Environment Variables

Create a `.env` file inside the `backend` folder.

Example:

```env
DB_HOST=localhost
DB_PORT=5432
DB_USER=postgres
DB_PASSWORD=your_password
DB_NAME=registration_db
PORT=3000
```

Replace:

* `your_password` with your PostgreSQL password

---

# 5. Run the Backend API

Start the development server:

```bash
npm run dev
```

If successful, you should see:

```bash
 API running on http://localhost:3000
```

---

# 6. Frontend Setup

Open a new terminal.

Navigate to frontend folder:

```bash
cd registration-api
cd frontend
```

Install dependencies:

```bash
npm install
```

Start frontend server:

```bash
npx vite
```

Open browser:

```text
http://localhost:5173
```

---

# API Endpoints

## Create Registration

### POST `/registrations`

```bash
curl -X POST http://localhost:3000/registrations \
  -H "Content-Type: application/json" \
  -d '{
    "first_name": "paul",
    "last_name": "kashim",
    "email": "paul@example.com",
    "phone": "+264811234567",
    "date_of_birth": "2000-01-01",

    "res_city": "Windhoek",
    "res_street": "123 Independence Ave",
    "res_erf": "456",
    "res_country": "Namibia",

    "post_street": "P.O.Box_1234",
    "post_city": "Windhoek",
    "post_country": "Namibia"
  }'
```

---

## Get All Registrations

### GET `/registrations`

```bash
curl http://localhost:3000/registrations
```

---

## Get Registration By ID

### GET `/registrations/:id`

Example:

```bash
curl http://localhost:3000/registrations/1
```

---

# Common Issues

## Port Already In Use

Change the port in `.env`:

```env
PORT=4000
```

---

## PostgreSQL Password Errors

Ensure:

* PostgreSQL is running
* `.env` values are correct
* `DB_PASSWORD` matches PostgreSQL password

---

## Cannot Connect To Database

Check:

* PostgreSQL service is running
* Database name is correct
* Port is `5432`

---

# Author

Paulus Kashimbode.

---

# License

This project is for internship assessment purposes.

