# Flutter Tutorial - Backend API

Backend API สำหรับ Flutter Material Design Tutorial สร้างด้วย NestJS และ MongoDB

## 🚀 เริ่มต้นใช้งาน

### ข้อกำหนดเบื้องต้น

- Node.js 18 หรือสูงกว่า
- MongoDB 6.0 หรือสูงกว่า
- npm หรือ yarn

### การติดตั้ง

1. ติดตั้ง dependencies:
```bash
npm install
```

2. สร้างไฟล์ `.env` จาก `.env.example`:
```bash
cp .env.example .env
```

3. แก้ไขค่าใน `.env`:
```env
MONGODB_URI=mongodb://localhost:27017/flutter-tutorial
JWT_SECRET=your-secret-key-change-this-in-production
JWT_EXPIRES_IN=7d
PORT=3000
NODE_ENV=development
```

4. รัน MongoDB (ถ้ายังไม่ได้รัน):
```bash
# ใช้ Docker
docker run -d -p 27017:27017 --name mongodb mongo:latest

# หรือติดตั้งและรันบนเครื่อง
mongod
```

### การรัน

#### Development mode
```bash
npm run start:dev
```

#### Production mode
```bash
npm run build
npm run start:prod
```

Server จะรันที่ `http://localhost:3000`

## 📚 API Endpoints

### Authentication

#### สมัครสมาชิก
```http
POST /api/auth/register
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "password123",
  "name": "John Doe"
}
```

Response:
```json
{
  "user": {
    "_id": "507f1f77bcf86cd799439011",
    "email": "user@example.com",
    "name": "John Doe",
    "isActive": true,
    "role": "user",
    "createdAt": "2024-01-01T00:00:00.000Z"
  },
  "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9..."
}
```

#### เข้าสู่ระบบ
```http
POST /api/auth/login
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "password123"
}
```

### Users Management

#### ดึงรายการผู้ใช้ทั้งหมด
```http
GET /api/users
Authorization: Bearer {token}
```

#### ดึงข้อมูลผู้ใช้
```http
GET /api/users/:id
Authorization: Bearer {token}
```

#### สร้างผู้ใช้
```http
POST /api/users
Content-Type: application/json

{
  "email": "user@example.com",
  "password": "password123",
  "name": "John Doe",
  "phone": "0812345678"
}
```

#### แก้ไขข้อมูลผู้ใช้
```http
PATCH /api/users/:id
Authorization: Bearer {token}
Content-Type: application/json

{
  "name": "Jane Doe",
  "phone": "0887654321"
}
```

#### ลบผู้ใช้
```http
DELETE /api/users/:id
Authorization: Bearer {token}
```

### Bookings Management

#### ดึงรายการจองทั้งหมด
```http
GET /api/bookings
```

#### กรองตามสถานะ
```http
GET /api/bookings?status=pending
GET /api/bookings?status=confirmed
GET /api/bookings?status=cancelled
GET /api/bookings?status=completed
```

#### กรองตามวันที่
```http
GET /api/bookings?date=2024-12-25
```

#### ดึงข้อมูลการจอง
```http
GET /api/bookings/:id
```

#### สร้างการจอง
```http
POST /api/bookings
Content-Type: application/json

{
  "customerName": "สมชาย ใจดี",
  "email": "somchai@example.com",
  "phone": "081-234-5678",
  "service": "Haircut",
  "bookingDate": "2024-12-25",
  "bookingTime": "14:00",
  "notes": "ต้องการตัดผมสั้น"
}
```

#### แก้ไขการจอง
```http
PATCH /api/bookings/:id
Content-Type: application/json

{
  "status": "confirmed"
}
```

#### ลบการจอง
```http
DELETE /api/bookings/:id
```

## 🏗 โครงสร้างโปรเจค

```
backend/
├── src/
│   ├── auth/                  # Authentication module
│   │   ├── dto/              # Data Transfer Objects
│   │   ├── guards/           # Auth guards
│   │   ├── strategies/       # Passport strategies
│   │   ├── auth.controller.ts
│   │   ├── auth.service.ts
│   │   └── auth.module.ts
│   ├── users/                # Users module
│   │   ├── dto/              # Data Transfer Objects
│   │   ├── schemas/          # MongoDB schemas
│   │   ├── users.controller.ts
│   │   ├── users.service.ts
│   │   └── users.module.ts
│   ├── bookings/             # Bookings module
│   │   ├── dto/              # Data Transfer Objects
│   │   ├── schemas/          # MongoDB schemas
│   │   ├── bookings.controller.ts
│   │   ├── bookings.service.ts
│   │   └── bookings.module.ts
│   ├── app.module.ts         # Root module
│   └── main.ts               # Entry point
├── .env.example              # Environment variables example
├── .gitignore
├── nest-cli.json
├── package.json
├── tsconfig.json
├── TESTING.md                # API testing guide
└── README.md
```

## 🔒 Authentication

API ใช้ JWT (JSON Web Tokens) สำหรับการยืนยันตัวตน

1. ลงทะเบียนหรือเข้าสู่ระบบเพื่อรับ `access_token`
2. ส่ง token ใน Header ของ request:
   ```
   Authorization: Bearer {your_token}
   ```
3. Token จะหมดอายุตามที่ตั้งค่าใน `JWT_EXPIRES_IN` (default: 7 วัน)

## 🧪 ทดสอบ API

### ใช้ cURL

```bash
# Register
curl -X POST http://localhost:3000/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{"email":"test@example.com","password":"password123","name":"Test User"}'

# Login
curl -X POST http://localhost:3000/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{"email":"test@example.com","password":"password123"}'

# Get users (ต้องใส่ token)
curl -X GET http://localhost:3000/api/users \
  -H "Authorization: Bearer {your_token}"
```

### ใช้ Postman หรือ Insomnia

Import collection หรือสร้าง requests ตาม endpoints ข้างต้น

## 🛠 เทคโนโลยีที่ใช้

- **NestJS** - Node.js framework
- **MongoDB** - NoSQL database
- **Mongoose** - MongoDB ODM
- **Passport** - Authentication middleware
- **JWT** - JSON Web Tokens
- **bcrypt** - Password hashing
- **class-validator** - Validation
- **class-transformer** - Transformation

## 📝 License

MIT
