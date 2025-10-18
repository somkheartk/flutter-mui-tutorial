# Backend Testing Guide

## API Testing with cURL

### Prerequisites
1. Start MongoDB:
```bash
# Using Docker
docker run -d -p 27017:27017 --name mongodb mongo:6

# Or local installation
mongod
```

2. Start Backend:
```bash
cd backend
npm install
npm run start:dev
```

The backend will run at `http://localhost:3000`

## Booking API Tests

### 1. Create a Booking
```bash
curl -X POST http://localhost:3000/api/bookings \
  -H "Content-Type: application/json" \
  -d '{
    "customerName": "สมชาย ใจดี",
    "email": "somchai@example.com",
    "phone": "081-234-5678",
    "service": "Haircut",
    "bookingDate": "2024-12-25",
    "bookingTime": "14:00",
    "notes": "ต้องการตัดผมสั้น"
  }'
```

### 2. Get All Bookings
```bash
curl http://localhost:3000/api/bookings
```

### 3. Get Bookings by Status
```bash
# Pending bookings
curl http://localhost:3000/api/bookings?status=pending

# Confirmed bookings
curl http://localhost:3000/api/bookings?status=confirmed
```

### 4. Get Bookings by Date
```bash
curl http://localhost:3000/api/bookings?date=2024-12-25
```

### 5. Get Single Booking
```bash
# Replace {id} with actual booking ID
curl http://localhost:3000/api/bookings/{id}
```

### 6. Update Booking
```bash
# Replace {id} with actual booking ID
curl -X PATCH http://localhost:3000/api/bookings/{id} \
  -H "Content-Type: application/json" \
  -d '{
    "status": "confirmed"
  }'
```

### 7. Delete Booking
```bash
# Replace {id} with actual booking ID
curl -X DELETE http://localhost:3000/api/bookings/{id}
```

## Testing with Postman

Import the following collection:

```json
{
  "info": {
    "name": "Booking API",
    "schema": "https://schema.getpostman.com/json/collection/v2.1.0/collection.json"
  },
  "item": [
    {
      "name": "Create Booking",
      "request": {
        "method": "POST",
        "header": [
          {
            "key": "Content-Type",
            "value": "application/json"
          }
        ],
        "body": {
          "mode": "raw",
          "raw": "{\n  \"customerName\": \"สมชาย ใจดี\",\n  \"email\": \"somchai@example.com\",\n  \"phone\": \"081-234-5678\",\n  \"service\": \"Haircut\",\n  \"bookingDate\": \"2024-12-25\",\n  \"bookingTime\": \"14:00\",\n  \"notes\": \"ต้องการตัดผมสั้น\"\n}"
        },
        "url": {
          "raw": "http://localhost:3000/api/bookings",
          "protocol": "http",
          "host": ["localhost"],
          "port": "3000",
          "path": ["api", "bookings"]
        }
      }
    },
    {
      "name": "Get All Bookings",
      "request": {
        "method": "GET",
        "url": {
          "raw": "http://localhost:3000/api/bookings",
          "protocol": "http",
          "host": ["localhost"],
          "port": "3000",
          "path": ["api", "bookings"]
        }
      }
    }
  ]
}
```

## Expected Responses

### Successful Create Response (201)
```json
{
  "_id": "507f1f77bcf86cd799439011",
  "customerName": "สมชาย ใจดี",
  "email": "somchai@example.com",
  "phone": "081-234-5678",
  "service": "Haircut",
  "bookingDate": "2024-12-25T00:00:00.000Z",
  "bookingTime": "14:00",
  "status": "pending",
  "notes": "ต้องการตัดผมสั้น",
  "createdAt": "2024-10-18T10:30:00.000Z",
  "updatedAt": "2024-10-18T10:30:00.000Z"
}
```

### Successful Get All Response (200)
```json
[
  {
    "_id": "507f1f77bcf86cd799439011",
    "customerName": "สมชาย ใจดี",
    "email": "somchai@example.com",
    "phone": "081-234-5678",
    "service": "Haircut",
    "bookingDate": "2024-12-25T00:00:00.000Z",
    "bookingTime": "14:00",
    "status": "pending",
    "notes": "ต้องการตัดผมสั้น",
    "createdAt": "2024-10-18T10:30:00.000Z",
    "updatedAt": "2024-10-18T10:30:00.000Z"
  }
]
```

### Error Response (404)
```json
{
  "statusCode": 404,
  "message": "Booking with ID 507f1f77bcf86cd799439011 not found",
  "error": "Not Found"
}
```

### Validation Error (400)
```json
{
  "statusCode": 400,
  "message": [
    "email must be an email",
    "customerName should not be empty"
  ],
  "error": "Bad Request"
}
```

## Troubleshooting

### MongoDB Connection Error
```
Error: MongooseServerSelectionError: connect ECONNREFUSED 127.0.0.1:27017
```
**Solution**: Make sure MongoDB is running on port 27017

### Port Already in Use
```
Error: listen EADDRINUSE: address already in use :::3000
```
**Solution**: Change PORT in .env or kill the process using port 3000

### Module Not Found
```
Error: Cannot find module '@nestjs/mapped-types'
```
**Solution**: Run `npm install @nestjs/mapped-types`
