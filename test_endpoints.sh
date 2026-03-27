#!/bin/bash
# SmartCart Endpoint Test Script
# Output goes to /tmp/smartcart_test_results.txt

RESULTS="/tmp/smartcart_test_results.txt"
BASE="http://localhost:9191"

echo "========================================" > "$RESULTS"
echo "SmartCart Endpoint Test Results" >> "$RESULTS"
echo "Date: $(date)" >> "$RESULTS"
echo "========================================" >> "$RESULTS"

# Kill existing process on 9191
lsof -ti:9191 | xargs kill -9 2>/dev/null
sleep 2

# Start app
echo "Starting application..." >> "$RESULTS"
cd /Users/ssin192/Documents/GitHub/SmartCart
java -jar target/shopper-0.0.1-SNAPSHOT.jar > /tmp/smartcart_app.log 2>&1 &
APP_PID=$!
echo "App PID: $APP_PID" >> "$RESULTS"

# Wait for app to be ready (max 60 seconds)
echo "Waiting for app to start..." >> "$RESULTS"
for i in $(seq 1 60); do
    if curl -s -o /dev/null -w "" http://localhost:9191/products 2>/dev/null; then
        HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" http://localhost:9191/products)
        if [ "$HTTP_CODE" != "000" ]; then
            echo "App started after ${i}s" >> "$RESULTS"
            break
        fi
    fi
    if [ $i -eq 60 ]; then
        echo "TIMEOUT: App did not start in 60s" >> "$RESULTS"
        echo "=== APP LOG ===" >> "$RESULTS"
        tail -50 /tmp/smartcart_app.log >> "$RESULTS"
        exit 1
    fi
    sleep 1
done

echo "" >> "$RESULTS"
echo "========================================" >> "$RESULTS"
echo "TESTING PUBLIC ENDPOINTS" >> "$RESULTS"
echo "========================================" >> "$RESULTS"

# Function to test an endpoint
test_endpoint() {
    local METHOD=$1
    local URL=$2
    local DATA=$3
    local DESC=$4

    echo "" >> "$RESULTS"
    echo "--- $DESC ---" >> "$RESULTS"
    echo "$METHOD $URL" >> "$RESULTS"

    if [ "$METHOD" = "GET" ]; then
        HTTP_CODE=$(curl -s -o /tmp/curl_body.txt -w "%{http_code}" "$URL")
    elif [ "$METHOD" = "POST" ]; then
        HTTP_CODE=$(curl -s -o /tmp/curl_body.txt -w "%{http_code}" -X POST "$URL" -H "Content-Type: application/json" -d "$DATA")
    elif [ "$METHOD" = "PUT" ]; then
        HTTP_CODE=$(curl -s -o /tmp/curl_body.txt -w "%{http_code}" -X PUT "$URL" -H "Content-Type: application/json" -d "$DATA")
    elif [ "$METHOD" = "DELETE" ]; then
        HTTP_CODE=$(curl -s -o /tmp/curl_body.txt -w "%{http_code}" -X DELETE "$URL")
    fi

    BODY=$(head -c 500 /tmp/curl_body.txt)

    if [ "$HTTP_CODE" -ge 200 ] && [ "$HTTP_CODE" -lt 300 ]; then
        echo "✅ STATUS: $HTTP_CODE" >> "$RESULTS"
    elif [ "$HTTP_CODE" -eq 401 ] || [ "$HTTP_CODE" -eq 403 ]; then
        echo "🔒 STATUS: $HTTP_CODE (Auth required - expected for protected endpoints)" >> "$RESULTS"
    else
        echo "❌ STATUS: $HTTP_CODE" >> "$RESULTS"
    fi
    echo "RESPONSE (first 500 chars): $BODY" >> "$RESULTS"
}

# Function to test authenticated endpoint
test_auth_endpoint() {
    local METHOD=$1
    local URL=$2
    local DATA=$3
    local DESC=$4
    local TOKEN=$5

    echo "" >> "$RESULTS"
    echo "--- $DESC ---" >> "$RESULTS"
    echo "$METHOD $URL (🔒 authenticated)" >> "$RESULTS"

    if [ "$METHOD" = "GET" ]; then
        HTTP_CODE=$(curl -s -o /tmp/curl_body.txt -w "%{http_code}" "$URL" -H "Authorization: Bearer $TOKEN")
    elif [ "$METHOD" = "POST" ]; then
        HTTP_CODE=$(curl -s -o /tmp/curl_body.txt -w "%{http_code}" -X POST "$URL" -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json" -d "$DATA")
    elif [ "$METHOD" = "PUT" ]; then
        HTTP_CODE=$(curl -s -o /tmp/curl_body.txt -w "%{http_code}" -X PUT "$URL" -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json" -d "$DATA")
    elif [ "$METHOD" = "DELETE" ]; then
        HTTP_CODE=$(curl -s -o /tmp/curl_body.txt -w "%{http_code}" -X DELETE "$URL" -H "Authorization: Bearer $TOKEN")
    fi

    BODY=$(head -c 500 /tmp/curl_body.txt)

    if [ "$HTTP_CODE" -ge 200 ] && [ "$HTTP_CODE" -lt 300 ]; then
        echo "✅ STATUS: $HTTP_CODE" >> "$RESULTS"
    elif [ "$HTTP_CODE" -eq 401 ] || [ "$HTTP_CODE" -eq 403 ]; then
        echo "🔒 STATUS: $HTTP_CODE (Auth failed)" >> "$RESULTS"
    else
        echo "❌ STATUS: $HTTP_CODE" >> "$RESULTS"
    fi
    echo "RESPONSE (first 500 chars): $BODY" >> "$RESULTS"
}

# =====================
# PUBLIC ENDPOINTS
# =====================

# Products
test_endpoint "GET" "$BASE/products" "" "GET /products - List all products"
test_endpoint "GET" "$BASE/products/1" "" "GET /products/1 - Get single product"
test_endpoint "GET" "$BASE/products/trending" "" "GET /products/trending - Trending products"
test_endpoint "GET" "$BASE/products/sponsored" "" "GET /products/sponsored - Sponsored products"
test_endpoint "GET" "$BASE/products?search=chicken" "" "GET /products?search=chicken - Search products"
test_endpoint "GET" "$BASE/products?category=fruits-vegetables" "" "GET /products?category=fruits-vegetables - Filter by category"
test_endpoint "GET" "$BASE/products?organic=true&sortBy=price-asc&page=1&limit=10" "" "GET /products?organic=true&sortBy=price-asc - Filter organic"

# Categories
test_endpoint "GET" "$BASE/categories" "" "GET /categories - List all categories"

# Banners & Deals
test_endpoint "GET" "$BASE/banners" "" "GET /banners - Get promotional banners"
test_endpoint "GET" "$BASE/deals" "" "GET /deals - Get current deals"

# =====================
# AUTHENTICATION
# =====================
echo "" >> "$RESULTS"
echo "========================================" >> "$RESULTS"
echo "TESTING AUTHENTICATION" >> "$RESULTS"
echo "========================================" >> "$RESULTS"

# Register a new user
test_endpoint "POST" "$BASE/auth/register" '{"firstName":"John","lastName":"Doe","email":"john_test_'$$'@test.com","password":"pass123"}' "POST /auth/register - Register new user"

# Login with test user
echo "" >> "$RESULTS"
echo "--- LOGIN: POST /auth/login ---" >> "$RESULTS"
LOGIN_RESPONSE=$(curl -s -X POST "$BASE/auth/login" -H "Content-Type: application/json" -d '{"email":"sarah.johnson@email.com","password":"password123"}')
echo "Login Response: $(echo $LOGIN_RESPONSE | head -c 300)" >> "$RESULTS"

# Extract token
TOKEN=$(echo "$LOGIN_RESPONSE" | python3 -c "import sys,json; print(json.load(sys.stdin).get('token',''))" 2>/dev/null)

if [ -z "$TOKEN" ]; then
    echo "⚠️  Could not extract token. Trying alternate parsing..." >> "$RESULTS"
    TOKEN=$(echo "$LOGIN_RESPONSE" | grep -o '"token":"[^"]*"' | cut -d'"' -f4)
fi

if [ -n "$TOKEN" ]; then
    echo "✅ Token obtained: ${TOKEN:0:30}..." >> "$RESULTS"
else
    echo "❌ Failed to get token. Skipping authenticated endpoints." >> "$RESULTS"
fi

# =====================
# AUTHENTICATED ENDPOINTS
# =====================
if [ -n "$TOKEN" ]; then
    echo "" >> "$RESULTS"
    echo "========================================" >> "$RESULTS"
    echo "TESTING AUTHENTICATED ENDPOINTS" >> "$RESULTS"
    echo "========================================" >> "$RESULTS"

    # Auth - Profile
    test_auth_endpoint "GET" "$BASE/auth/me" "" "GET /auth/me - Get current user profile" "$TOKEN"

    # SmartCart
    test_auth_endpoint "GET" "$BASE/smartcart" "" "GET /smartcart - Get AI-predicted cart" "$TOKEN"

    # Cart
    test_auth_endpoint "GET" "$BASE/cart" "" "GET /cart - Get current cart" "$TOKEN"
    test_auth_endpoint "POST" "$BASE/cart/items" '{"productId":"1","quantity":3}' "POST /cart/items - Add item to cart" "$TOKEN"
    test_auth_endpoint "GET" "$BASE/cart" "" "GET /cart - Get cart after adding item" "$TOKEN"
    test_auth_endpoint "PUT" "$BASE/cart/items/1" '{"quantity":5}' "PUT /cart/items/1 - Update item quantity" "$TOKEN"
    test_auth_endpoint "DELETE" "$BASE/cart/items/1" "" "DELETE /cart/items/1 - Remove item from cart" "$TOKEN"

    # SmartCart operations
    test_auth_endpoint "PUT" "$BASE/smartcart/items/1" '{"quantity":2}' "PUT /smartcart/items/1 - Update smartcart item" "$TOKEN"
    test_auth_endpoint "DELETE" "$BASE/smartcart/items/1" "" "DELETE /smartcart/items/1 - Remove smartcart item" "$TOKEN"
    test_auth_endpoint "POST" "$BASE/smartcart/add-to-cart" "" "POST /smartcart/add-to-cart - Copy smartcart to cart" "$TOKEN"

    # Orders
    # First add something to cart so we can place an order
    test_auth_endpoint "POST" "$BASE/cart/items" '{"productId":"2","quantity":1}' "POST /cart/items - Add item for order" "$TOKEN"
    test_auth_endpoint "POST" "$BASE/orders" "" "POST /orders - Place order from cart" "$TOKEN"
    test_auth_endpoint "GET" "$BASE/orders" "" "GET /orders - Get order history" "$TOKEN"

    # Logout
    test_auth_endpoint "POST" "$BASE/auth/logout" "" "POST /auth/logout - Logout" "$TOKEN"
fi

# =====================
# AI ENDPOINTS (may fail if Vertex AI not configured)
# =====================
echo "" >> "$RESULTS"
echo "========================================" >> "$RESULTS"
echo "TESTING AI ENDPOINTS (may fail without GCP config)" >> "$RESULTS"
echo "========================================" >> "$RESULTS"

test_endpoint "POST" "$BASE/api/ai/chat" '{"message":"What are good fruits?"}' "POST /api/ai/chat - AI Chat"
test_endpoint "GET" "$BASE/api/ai/ask?q=What+are+the+top+products" "" "GET /api/ai/ask - AI Order Analytics"

# =====================
# SWAGGER
# =====================
echo "" >> "$RESULTS"
echo "========================================" >> "$RESULTS"
echo "TESTING SWAGGER/OPENAPI" >> "$RESULTS"
echo "========================================" >> "$RESULTS"

test_endpoint "GET" "$BASE/swagger-ui/index.html" "" "GET /swagger-ui/index.html - Swagger UI"
test_endpoint "GET" "$BASE/v3/api-docs" "" "GET /v3/api-docs - OpenAPI spec"

# =====================
# SUMMARY
# =====================
echo "" >> "$RESULTS"
echo "========================================" >> "$RESULTS"
echo "SUMMARY" >> "$RESULTS"
echo "========================================" >> "$RESULTS"

PASS=$(grep -c "✅" "$RESULTS")
FAIL=$(grep -c "❌" "$RESULTS")
AUTH_REQUIRED=$(grep -c "🔒" "$RESULTS")

echo "✅ Passed: $PASS" >> "$RESULTS"
echo "❌ Failed: $FAIL" >> "$RESULTS"
echo "🔒 Auth issues: $AUTH_REQUIRED" >> "$RESULTS"
echo "" >> "$RESULTS"

# Cleanup - kill app
kill $APP_PID 2>/dev/null

echo "========================================" >> "$RESULTS"
echo "TEST COMPLETE" >> "$RESULTS"
echo "========================================" >> "$RESULTS"

echo "Results written to $RESULTS"

