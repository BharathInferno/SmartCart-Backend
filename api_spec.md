# SmartCart Backend API Specification
 
> API contract for the SmartCart frontend. All endpoints use JSON. Auth via Bearer token in `Authorization` header.
 
**Base URL:** `{VITE_API_BASE_URL}` (e.g., `https://api.smartcart.albertsons.com/v1`)
 
---
 
## 1. Authentication
 
### `POST /auth/login`
**Request:**
```json
{ "email": "string", "password": "string" }
```
**Response:**
```json
{
  "user": { "id": "string", "firstName": "string", "lastName": "string", "email": "string", "loyaltyPoints": 0, "tier": "string", "preferredStore": "string" },
  "token": "jwt_string"
}
```
 
### `POST /auth/register`
**Request:**
```json
{ "firstName": "string", "lastName": "string", "email": "string", "password": "string" }
```
**Response:** Same as login.
 
### `POST /auth/logout`
🔒 Authenticated
**Response:** `{ "success": true }`
 
### `GET /auth/me`
🔒 Authenticated
**Response:** User object.
 
### `PUT /auth/me`
🔒 Authenticated
**Request:** Partial user fields.
**Response:** Updated user object.
 
---
 
## 2. Products
 
### `GET /products`
**Query Params:**
| Param     | Type    | Description                        |
|-----------|---------|------------------------------------|
| category  | string  | Filter by category ID              |
| search    | string  | Full-text search query             |
| sortBy    | string  | `price-asc`, `price-desc`, `rating`, `name` |
| organic   | boolean | Filter organic only                |
| page      | number  | Pagination page (default 1)        |
| limit     | number  | Items per page (default 20)        |
 
**Response:**
```json
{
  "products": [
    {
      "id": "string",
      "name": "string",
      "category": "string",
      "price": 0.00,
      "unit": "string",
      "image": "url",
      "rating": 4.5,
      "reviews": 100,
      "inStock": true,
      "isOrganic": false,
      "description": "string"
    }
  ],
  "total": 52,
  "page": 1,
  "totalPages": 3
}
```
 
### `GET /products/:id`
**Response:** Single product object.
 
### `GET /products/trending`
**Response:** Array of top 8 products by review count/popularity.
 
---
 
## 3. Categories
 
### `GET /categories`
**Response:**
```json
[
  {
    "id": "string",
    "name": "string",
    "image": "url",
    "description": "string",
    "itemCount": 48
  }
]
```
 
---
 
## 4. SmartCart (AI-Predicted Cart)
 
### `GET /smartcart`
🔒 Authenticated
> Returns the user's predicted shopping cart based on purchase history.
 
**Response:**
```json
{
  "lastUpdated": "2026-03-26",
  "basedOnMonths": 3,
  "confidence": 0.87,
  "items": [
    {
      "productId": "string",
      "quantity": 2,
      "frequency": "weekly|bi-weekly|monthly",
      "lastPurchased": "2026-03-22",
      "predictedNeed": "2026-03-29",
      "product": { /* full product object */ },
      "sponsoredAlternative": {
        "id": "string",
        "name": "string",
        "price": 0.00,
        "unit": "string",
        "image": "url",
        "sponsor": "string",
        "tagline": "string",
        "relatedCategories": ["string"]
      }
    }
  ]
}
```
 
### `PUT /smartcart/items/:productId`
🔒 Authenticated
**Request:** `{ "quantity": 3 }`
**Response:** `{ "productId": "string", "quantity": 3, "updated": true }`
 
### `DELETE /smartcart/items/:productId`
🔒 Authenticated
**Response:** `{ "productId": "string", "removed": true }`
 
### `POST /smartcart/add-to-cart`
🔒 Authenticated
> Copies all SmartCart items into the user's active cart.
**Response:** `{ "success": true, "message": "All items added to cart" }`
 
### `POST /smartcart/dismiss-sponsored`
🔒 Authenticated
**Request:** `{ "sponsoredId": "string" }`
**Response:** `{ "sponsoredId": "string", "dismissed": true }`
 
---
 
## 5. Cart
 
### `GET /cart`
🔒 Authenticated
**Response:**
```json
{
  "items": [
    { "product": { /* product object */ }, "quantity": 2 }
  ],
  "total": 45.99
}
```
 
### `POST /cart/items`
🔒 Authenticated
**Request:** `{ "productId": "string", "quantity": 1 }`
 
### `PUT /cart/items/:productId`
🔒 Authenticated
**Request:** `{ "quantity": 3 }`
 
### `DELETE /cart/items/:productId`
🔒 Authenticated
 
---
 
## 6. Orders
 
### `POST /orders`
🔒 Authenticated
> Places an order with all items currently in the cart. No payment gateway needed — the act of ordering = purchased.
 
**Response:**
```json
{
  "orderId": "string",
  "status": "completed",
  "items": [ { "productId": "string", "quantity": 2, "priceAtPurchase": 4.99 } ],
  "total": 45.99,
  "date": "2026-03-26T10:30:00Z"
}
```
 
### `GET /orders`
🔒 Authenticated
**Response:**
```json
[
  {
    "id": "string",
    "date": "2026-03-22",
    "items": [ { "productId": "string", "quantity": 2, "priceAtPurchase": 4.99 } ],
    "total": 31.31,
    "status": "completed"
  }
]
```
 
---
 
## 7. Sponsored Products
 
### `GET /products/sponsored`
**Query Params:**
| Param    | Type   | Description                          |
|----------|--------|--------------------------------------|
| category | string | Filter by related category ID        |
 
**Response:** Array of sponsored product objects.
 
---
 
## 8. Banners / Promotions
 
### `GET /banners`
**Response:**
```json
[
  {
    "id": "string",
    "title": "string",
    "subtitle": "string",
    "ctaText": "string",
    "ctaLink": "/category/fruits-vegetables",
    "bgColor": "linear-gradient(...)",
    "image": "url"
  }
]
```
 
---
 
## 9. Deals
 
### `GET /deals`
**Response:**
```json
[
  {
    "productId": "string",
    "product": { /* full product object */ },
    "originalPrice": 9.99,
    "salePrice": 7.99,
    "discount": 20,
    "endsAt": "2026-03-27T00:00:00"
  }
]
```
 
---
 
## Summary of Required APIs
 
| #  | Method | Endpoint                        | Auth | Priority |
|----|--------|---------------------------------|------|----------|
| 1  | POST   | `/auth/login`                   | No   | P0       |
| 2  | POST   | `/auth/register`                | No   | P0       |
| 3  | POST   | `/auth/logout`                  | Yes  | P1       |
| 4  | GET    | `/auth/me`                      | Yes  | P1       |
| 5  | PUT    | `/auth/me`                      | Yes  | P2       |
| 6  | GET    | `/products`                     | No   | P0       |
| 7  | GET    | `/products/:id`                 | No   | P1       |
| 8  | GET    | `/products/trending`            | No   | P1       |
| 9  | GET    | `/products/sponsored`           | No   | P1       |
| 10 | GET    | `/categories`                   | No   | P0       |
| 11 | GET    | `/smartcart`                    | Yes  | P0       |
| 12 | PUT    | `/smartcart/items/:productId`   | Yes  | P0       |
| 13 | DELETE | `/smartcart/items/:productId`   | Yes  | P1       |
| 14 | POST   | `/smartcart/add-to-cart`         | Yes  | P0       |
| 15 | POST   | `/smartcart/dismiss-sponsored`  | Yes  | P2       |
| 16 | GET    | `/cart`                         | Yes  | P0       |
| 17 | POST   | `/cart/items`                   | Yes  | P0       |
| 18 | PUT    | `/cart/items/:productId`        | Yes  | P0       |
| 19 | DELETE | `/cart/items/:productId`        | Yes  | P0       |
| 20 | POST   | `/orders`                       | Yes  | P0       |
| 21 | GET    | `/orders`                       | Yes  | P1       |
| 22 | GET    | `/banners`                      | No   | P2       |
| 23 | GET    | `/deals`                        | No   | P1       |
 
**Priority Legend:** P0 = Must Have, P1 = Should Have, P2 = Nice to Have
