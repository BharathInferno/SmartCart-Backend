# 🛒 SmartCart — Backend API

> AI-powered shopping cart backend for Albertsons, built with **Spring Boot 4**, **Spring AI (Gemini)**, **Spring Security + JWT**, and **PostgreSQL**.

---

## Table of Contents

1. [Prerequisites](#prerequisites)
2. [PostgreSQL Setup (on another device / remote server)](#postgresql-setup-on-another-device--remote-server)
3. [Application Setup (developer machine)](#application-setup-developer-machine)
4. [Configuration Reference](#configuration-reference)
5. [Running the Application](#running-the-application)
6. [Seed Data & Test User](#seed-data--test-user)
7. [API Endpoints](#api-endpoints)
8. [Testing with cURL](#testing-with-curl)
9. [Swagger UI](#swagger-ui)
10. [Project Structure](#project-structure)
11. [Troubleshooting](#troubleshooting)

---

## Prerequisites

| Tool        | Version   | Notes                          |
|-------------|-----------|--------------------------------|
| Java JDK    | 17+       | `java -version` to verify      |
| Maven       | 3.9+      | Bundled via `./mvnw` wrapper    |
| PostgreSQL  | 14+       | Can run on a separate machine   |
| Git         | any       | To clone the repository         |

---

## PostgreSQL Setup (on another device / remote server)

> Follow these steps on the **machine where PostgreSQL will run** (e.g. a Linux server, a cloud VM, or another Mac/PC).

### 1. Install PostgreSQL

**macOS (Homebrew):**
```bash
brew install postgresql@18
brew services start postgresql@18
```

**Ubuntu / Debian:**
```bash
sudo apt update
sudo apt install postgresql postgresql-contrib
sudo systemctl start postgresql
sudo systemctl enable postgresql
```

**Windows:**
Download the installer from https://www.postgresql.org/download/windows/ and follow the wizard.

### 2. Create the database and user

Connect as the superuser:
```bash
# macOS (default superuser is your OS username)
psql -U $(whoami) -d postgres

# Linux
sudo -u postgres psql
```

Run the following SQL:
```sql
-- Create a dedicated user
CREATE ROLE shopper_user WITH LOGIN PASSWORD 'shopper_pass';

-- Create the database
CREATE DATABASE shopper_db OWNER shopper_user;

-- Grant privileges
GRANT ALL PRIVILEGES ON DATABASE shopper_db TO shopper_user;

-- Connect to the new database
\c shopper_db

-- Grant schema permissions
GRANT ALL ON SCHEMA public TO shopper_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO shopper_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO shopper_user;
```

### 3. Allow remote connections

> **Skip this step** if the app and PostgreSQL run on the same machine.

#### a) Edit `postgresql.conf`

Find the file:
```bash
# macOS (Homebrew)
ls /opt/homebrew/var/postgresql@18/postgresql.conf

# Linux
ls /etc/postgresql/*/main/postgresql.conf
```

Change the listen address:
```
listen_addresses = '*'          # or the specific IP of this server
port = 5432
```

#### b) Edit `pg_hba.conf`

Add a line to allow the developer machine's IP (replace `192.168.1.100` with the actual IP):
```
# TYPE  DATABASE        USER            ADDRESS              METHOD
host    shopper_db      shopper_user    192.168.1.100/32     scram-sha-256
```

Or allow an entire subnet:
```
host    shopper_db      shopper_user    192.168.1.0/24       scram-sha-256
```

#### c) Restart PostgreSQL
```bash
# macOS
brew services restart postgresql@18

# Linux
sudo systemctl restart postgresql
```

#### d) Open firewall (if applicable)
```bash
# Linux (ufw)
sudo ufw allow 5432/tcp

# Linux (firewalld)
sudo firewall-cmd --permanent --add-port=5432/tcp
sudo firewall-cmd --reload
```

### 4. Verify remote connectivity

From the **developer machine**, test the connection:
```bash
psql -h <POSTGRES_SERVER_IP> -p 5432 -U shopper_user -d shopper_db
# Enter password: shopper_pass
```

You should see the `shopper_db=>` prompt. Type `\q` to exit.

---

## Application Setup (developer machine)

### 1. Clone the repository

```bash
git clone <repo-url> shopper
cd shopper
```

### 2. Configure the datasource

Edit `src/main/resources/application.properties` and update the PostgreSQL connection to point to the remote server:

```properties
# PostgreSQL datasource — point to the remote server
spring.datasource.url=jdbc:postgresql://<POSTGRES_SERVER_IP>:5432/shopper_db
spring.datasource.username=shopper_user
spring.datasource.password=shopper_pass
spring.datasource.driver-class-name=org.postgresql.Driver
```

| Property | Example | Description |
|---|---|---|
| `spring.datasource.url` | `jdbc:postgresql://192.168.1.50:5432/shopper_db` | JDBC URL (host, port, db) |
| `spring.datasource.username` | `shopper_user` | DB user |
| `spring.datasource.password` | `shopper_pass` | DB password |

### 3. Configure Google Vertex AI (optional)

If you want the AI chat/analytics features, place your GCP service account JSON at:
```
src/main/resources/gcp-service-account.json
```

And update `src/main/resources/application.yaml`:
```yaml
spring:
  ai:
    vertex:
      ai:
        gemini:
          project-id: <YOUR_GCP_PROJECT_ID>
          location: us-central1
          credentials-uri: classpath:gcp-service-account.json
```

---

## Configuration Reference

All configuration lives in `src/main/resources/application.properties`:

```properties
# Server
server.port=9191

# PostgreSQL
spring.datasource.url=jdbc:postgresql://<HOST>:<PORT>/shopper_db
spring.datasource.username=shopper_user
spring.datasource.password=shopper_pass

# JPA
spring.jpa.hibernate.ddl-auto=create        # Use 'update' in production
spring.jpa.defer-datasource-initialization=true
spring.sql.init.mode=always                  # Loads data.sql on startup

# JWT
app.jwt.secret=<CHANGE_ME_TO_A_SECURE_SECRET>
app.jwt.expiration-ms=86400000               # 24 hours
```

| `ddl-auto` value | Behavior |
|---|---|
| `create` | Drops & recreates tables on every startup. Good for dev. |
| `update` | Only adds new columns/tables. **Use in production.** |
| `none` | Does nothing. You manage the schema yourself. |

---

## Running the Application

### Build & run
```bash
./mvnw clean package -DskipTests
./mvnw spring-boot:run -DskipTests
```

Or run the JAR directly:
```bash
java -jar target/shopper-0.0.1-SNAPSHOT.jar
```

The server starts on **http://localhost:9191**.

### Verify
```bash
curl http://localhost:9191/products
```
You should get a JSON response with 72 products.

---

## Seed Data & Test User

On startup (with `ddl-auto=create`), the file `src/main/resources/data.sql` automatically seeds:

| Data | Count |
|---|---|
| Products | 72 |
| Categories | 10 |
| Sponsored Products | 10 |
| Banners | 3 |
| Deals | 8 |
| SmartCart Items | 15 |
| Orders (with items) | 3 |
| Test User | 1 |

### Test user credentials

| Field | Value |
|---|---|
| **Email** | `sarah.johnson@email.com` |
| **Password** | `password123` |
| **Tier** | Gold |
| **Loyalty Points** | 2,450 |
| **Preferred Store** | Albertsons #1234 - Downtown |

---

## API Endpoints

### Authentication (public)

| Method | Endpoint | Description |
|--------|----------|-------------|
| `POST` | `/auth/register` | Register a new user |
| `POST` | `/auth/login` | Login, returns JWT |

### Authentication (🔒 Bearer token required)

| Method | Endpoint | Description |
|--------|----------|-------------|
| `POST` | `/auth/logout` | Logout |
| `GET`  | `/auth/me` | Get current user profile |
| `PUT`  | `/auth/me` | Update user profile |

### Products (public)

| Method | Endpoint | Description |
|--------|----------|-------------|
| `GET` | `/products` | List products (paginated, filterable) |
| `GET` | `/products/{id}` | Get single product |
| `GET` | `/products/trending` | Top 8 by review count |
| `GET` | `/products/sponsored` | Sponsored product listings |

**Query params for `GET /products`:**

| Param | Type | Example |
|---|---|---|
| `category` | string | `fruits-vegetables` |
| `search` | string | `chicken` |
| `sortBy` | string | `price-asc`, `price-desc`, `rating`, `name` |
| `organic` | boolean | `true` |
| `page` | int | `1` (default) |
| `limit` | int | `20` (default) |

### Categories (public)

| Method | Endpoint | Description |
|--------|----------|-------------|
| `GET` | `/categories` | List all categories |

### SmartCart (🔒 authenticated)

| Method | Endpoint | Description |
|--------|----------|-------------|
| `GET` | `/smartcart` | Get AI-predicted cart |
| `PUT` | `/smartcart/items/{productId}` | Update item quantity |
| `DELETE` | `/smartcart/items/{productId}` | Remove item |
| `POST` | `/smartcart/add-to-cart` | Copy all to active cart |
| `POST` | `/smartcart/dismiss-sponsored` | Dismiss a sponsored alternative |

### Cart (🔒 authenticated)

| Method | Endpoint | Description |
|--------|----------|-------------|
| `GET` | `/cart` | Get current cart |
| `POST` | `/cart/items` | Add item to cart |
| `PUT` | `/cart/items/{productId}` | Update item quantity |
| `DELETE` | `/cart/items/{productId}` | Remove item |

### Orders (🔒 authenticated)

| Method | Endpoint | Description |
|--------|----------|-------------|
| `POST` | `/orders` | Place order from cart |
| `GET` | `/orders` | Get order history |

### Banners & Deals (public)

| Method | Endpoint | Description |
|--------|----------|-------------|
| `GET` | `/banners` | Get promotional banners |
| `GET` | `/deals` | Get current deals |

### AI Chat (public)

| Method | Endpoint | Description |
|--------|----------|-------------|
| `POST` | `/api/ai/chat` | General AI chat |
| `GET` | `/api/ai/ask?q=...` | AI order analytics Q&A |

---

## Testing with cURL

### Register
```bash
curl -X POST http://localhost:9191/auth/register \
  -H "Content-Type: application/json" \
  -d '{"firstName":"John","lastName":"Doe","email":"john@test.com","password":"pass123"}'
```

### Login
```bash
curl -X POST http://localhost:9191/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"sarah.johnson@email.com","password":"password123"}'
```

Save the `token` from the response for authenticated requests.

### Authenticated request example
```bash
TOKEN="<paste_token_here>"

# Get SmartCart
curl http://localhost:9191/smartcart \
  -H "Authorization: Bearer $TOKEN"

# Add to Cart
curl -X POST http://localhost:9191/cart/items \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"productId":"1","quantity":3}'

# Place Order
curl -X POST http://localhost:9191/orders \
  -H "Authorization: Bearer $TOKEN"
```

### Search & filter products
```bash
# Search
curl "http://localhost:9191/products?search=chicken"

# Filter organic, sort by price
curl "http://localhost:9191/products?organic=true&sortBy=price-asc&page=1&limit=10"
```

---

## Swagger UI

Interactive API documentation is available at:

```
http://localhost:9191/swagger-ui/index.html
```

OpenAPI spec JSON:
```
http://localhost:9191/v3/api-docs
```

---

## Project Structure

```
src/main/java/com/albertsons/shopper/
├── ShopperApplication.java          # Entry point
├── ai/                              # AI tool integrations
│   ├── OrderAnalyticsTools.java
│   └── OrderApiTools.java
├── config/
│   ├── AiConfig.java                # Spring AI ChatClient config
│   └── SecurityConfig.java          # Spring Security + JWT filter chain
├── controller/
│   ├── AuthController.java          # /auth/*
│   ├── ProductController.java       # /products/*
│   ├── CategoryController.java      # /categories
│   ├── CartController.java          # /cart/*
│   ├── SmartCartController.java     # /smartcart/*
│   ├── NewOrderController.java      # /orders
│   ├── BannerController.java        # /banners
│   ├── DealController.java          # /deals
│   ├── AiController.java            # /api/ai/chat
│   ├── AiOrderController.java       # /api/ai/ask
│   └── OrderAnalyticsController.java
├── dto/                             # Request/Response DTOs
├── model/                           # JPA Entities
│   ├── User.java
│   ├── Product.java
│   ├── Category.java
│   ├── Cart.java / CartItem.java
│   ├── SmartCartItem.java
│   ├── CustomerOrder.java / OrderItem.java
│   ├── Banner.java
│   ├── Deal.java
│   └── SponsoredProduct.java
├── repository/                      # Spring Data JPA repositories
├── security/
│   ├── JwtUtil.java                 # JWT token generation & validation
│   ├── JwtAuthFilter.java           # OncePerRequestFilter for JWT
│   └── CustomUserDetailsService.java
└── services/                        # Business logic

src/main/resources/
├── application.properties           # Main config
├── application.yaml                 # AI / Vertex AI config
├── data.sql                         # Seed data (72 products, users, etc.)
└── gcp-service-account.json         # GCP credentials (not committed)
```

---

## Troubleshooting

### Connection refused to PostgreSQL

```
Connection to <host>:5432 refused
```
- Verify PostgreSQL is running: `sudo systemctl status postgresql`
- Check `listen_addresses` in `postgresql.conf` is set to `'*'` or the server IP
- Check `pg_hba.conf` has a `host` entry for your client IP
- Check firewall is open on port `5432`
- Verify with: `psql -h <HOST> -p 5432 -U shopper_user -d shopper_db`

### Role does not exist

```
FATAL: role "shopper_user" does not exist
```
- Connect as superuser and run: `CREATE ROLE shopper_user WITH LOGIN PASSWORD 'shopper_pass';`

### Port already in use

```
Port 9191 was already in use
```
- Kill the existing process: `lsof -ti:9191 | xargs kill -9`

### `lower(bytea)` does not exist

This means a `VARCHAR` column was created as `bytea`. Drop all tables and let Hibernate recreate them:
```sql
-- Connect to shopper_db as superuser
DROP SCHEMA public CASCADE;
CREATE SCHEMA public;
GRANT ALL ON SCHEMA public TO shopper_user;
```
Then restart the app (with `ddl-auto=create`).

### Hibernate dialect warning

```
HHH90000025: PostgreSQLDialect does not need to be specified explicitly
```
This is safe to ignore. Hibernate auto-detects the dialect from the JDBC driver.

---

## Tech Stack

| Layer | Technology |
|---|---|
| Framework | Spring Boot 4.0.5 |
| Language | Java 17 |
| Database | PostgreSQL 14+ |
| ORM | Hibernate 7 / Spring Data JPA |
| Security | Spring Security 7 + JWT (jjwt 0.12.6) |
| AI | Spring AI 2.0.0-M3 + Google Vertex AI Gemini |
| API Docs | SpringDoc OpenAPI (Swagger UI) |
| Build | Maven (with wrapper) |

---

## License

Internal — Albertsons Companies, Inc.

