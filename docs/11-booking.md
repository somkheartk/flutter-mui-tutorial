# 11 - Booking App with API Integration

## ภาพรวม

แอพจองคิวอย่างง่าย (Simple Booking App) พร้อมการเชื่อมต่อ Backend API ใช้ NestJS และ MongoDB เป็น Backend พร้อมด้วย Flutter เป็น Frontend

## เทคโนโลยีที่ใช้

### Backend
- **NestJS** - Node.js Framework
- **MongoDB** - NoSQL Database
- **Mongoose** - MongoDB ODM
- **TypeScript** - Type-safe JavaScript

### Frontend
- **Flutter** - Cross-platform UI framework
- **Dart** - Programming language
- **HTTP Package** - REST API calls
- **Material Design 3** - UI Components

## โครงสร้างโปรเจค

### Backend Structure
```
backend/src/bookings/
├── dto/
│   ├── create-booking.dto.ts    # DTO สำหรับสร้างการจอง
│   └── update-booking.dto.ts    # DTO สำหรับอัพเดทการจอง
├── schemas/
│   └── booking.schema.ts        # MongoDB Schema
├── bookings.controller.ts       # REST API Controller
├── bookings.service.ts          # Business Logic
└── bookings.module.ts           # NestJS Module
```

### Flutter App Structure
```
lib/
├── models/
│   └── booking.dart             # Booking Model
├── services/
│   └── booking_service.dart     # API Service
├── screens/
│   ├── booking_list_screen.dart # หน้ารายการจอง
│   └── booking_form_screen.dart # หน้าฟอร์มจอง
└── main.dart                    # Entry point
```

## Backend API

### Booking Schema
```typescript
{
  customerName: string,      // ชื่อลูกค้า
  email: string,            // อีเมล
  phone: string,            // เบอร์โทร
  service: string,          // บริการที่จอง
  bookingDate: Date,        // วันที่จอง
  bookingTime: string,      // เวลาที่จอง
  status: string,           // สถานะ (pending, confirmed, cancelled, completed)
  notes?: string,           // หมายเหตุ (ถ้ามี)
  createdAt: Date,          // วันที่สร้าง
  updatedAt: Date           // วันที่อัพเดท
}
```

### API Endpoints

#### 1. Get All Bookings
```http
GET /api/bookings
```
ดึงรายการจองทั้งหมด เรียงตามวันที่จองล่าสุด

#### 2. Filter by Status
```http
GET /api/bookings?status=pending
```
กรองตามสถานะ (pending, confirmed, cancelled, completed)

#### 3. Filter by Date
```http
GET /api/bookings?date=2024-01-01
```
กรองตามวันที่จอง

#### 4. Get Single Booking
```http
GET /api/bookings/:id
```
ดึงข้อมูลการจองแบบเจาะจง

#### 5. Create Booking
```http
POST /api/bookings
Content-Type: application/json

{
  "customerName": "สมชาย ใจดี",
  "email": "somchai@example.com",
  "phone": "081-234-5678",
  "service": "Haircut",
  "bookingDate": "2024-01-15",
  "bookingTime": "14:00",
  "notes": "ต้องการตัดผมสั้น"
}
```

#### 6. Update Booking
```http
PATCH /api/bookings/:id
Content-Type: application/json

{
  "status": "confirmed"
}
```

#### 7. Delete Booking
```http
DELETE /api/bookings/:id
```

## Flutter App

### 1. Booking Model

Model สำหรับจัดการข้อมูลการจอง พร้อม serialization

```dart
class Booking {
  final String? id;
  final String customerName;
  final String email;
  final String phone;
  final String service;
  final DateTime bookingDate;
  final String bookingTime;
  final String status;
  final String? notes;
  
  // fromJson และ toJson สำหรับ API
}
```

### 2. Booking Service

Service class สำหรับเรียก API

```dart
class BookingService {
  static const String baseUrl = 'http://localhost:3000/api';
  
  Future<List<Booking>> getBookings({String? status})
  Future<Booking> getBooking(String id)
  Future<Booking> createBooking(Booking booking)
  Future<Booking> updateBooking(String id, Booking booking)
  Future<void> deleteBooking(String id)
}
```

### 3. Booking List Screen

หน้าแสดงรายการจองทั้งหมด

**Features:**
- แสดงรายการจองในรูปแบบ Card
- Filter ตามสถานะ
- Pull to refresh
- Edit/Delete booking
- Status indicator with colors
- Empty state

**Material Components ที่ใช้:**
- `Scaffold`
- `AppBar` with filter menu
- `ListView` with refresh indicator
- `Card` และ `ListTile`
- `CircleAvatar` สำหรับ status icon
- `PopupMenuButton` สำหรับ actions
- `FloatingActionButton`
- `AlertDialog` สำหรับยืนยันลบ
- `SnackBar` สำหรับแสดงข้อความ

### 4. Booking Form Screen

หน้าฟอร์มสำหรับสร้างและแก้ไขการจอง

**Form Fields:**
- Customer Name (required)
- Email (required, validated)
- Phone Number (required)
- Service Selection (Dropdown)
- Booking Date (Date Picker)
- Time Slot (Dropdown)
- Status (Dropdown, เฉพาะการแก้ไข)
- Notes (Optional)

**Material Components ที่ใช้:**
- `Form` และ `TextFormField`
- `DropdownButtonFormField`
- `DatePicker`
- `InputDecorator`
- `ElevatedButton`
- Form validation

## การใช้งาน

### 1. Setup Backend

```bash
# ติดตั้ง dependencies
cd backend
npm install

# เพิ่ม @nestjs/mapped-types
npm install @nestjs/mapped-types

# รัน backend
npm run start:dev
```

Backend จะรันที่ `http://localhost:3000`

### 2. Setup Flutter App

```bash
# ไปที่โฟลเดอร์แอพ
cd flutter-apps/app-11-booking

# ติดตั้ง dependencies
flutter pub get

# รันแอพ
flutter run
```

### 3. ตั้งค่า API URL

แก้ไข `lib/services/booking_service.dart`:

```dart
// สำหรับ Android Emulator
static const String baseUrl = 'http://10.0.2.2:3000/api';

// สำหรับ iOS Simulator
static const String baseUrl = 'http://localhost:3000/api';

// สำหรับ Device จริง
static const String baseUrl = 'http://YOUR_IP:3000/api';
```

## Features หลัก

### 1. Create Booking
- กรอกข้อมูลลูกค้า
- เลือกบริการ
- เลือกวันที่และเวลา
- บันทึกผ่าน API

### 2. View Bookings
- แสดงรายการจองทั้งหมด
- กรองตามสถานะ
- Pull to refresh
- รองรับ empty state

### 3. Update Booking
- แก้ไขข้อมูลการจอง
- เปลี่ยนสถานะ
- อัพเดทผ่าน API

### 4. Delete Booking
- ลบการจองพร้อมยืนยัน
- ลบผ่าน API

### 5. Status Management
- Pending (รอดำเนินการ) - สีส้ม
- Confirmed (ยืนยันแล้ว) - สีเขียว
- Cancelled (ยกเลิก) - สีแดง
- Completed (เสร็จสิ้น) - สีน้ำเงิน

## Error Handling

### Backend
- Validation ด้วย class-validator
- NotFoundException สำหรับ record ที่หาไม่เจอ
- Global error handling

### Flutter
- Try-catch สำหรับ API calls
- แสดง error ด้วย SnackBar
- Loading states
- Network error handling

## Best Practices

### 1. Code Organization
- แยก Model, Service, และ Screen
- ใช้ const constructor เมื่อเป็นไปได้
- Proper null safety

### 2. UI/UX
- Material Design 3
- Responsive design
- Loading indicators
- Empty states
- Confirmation dialogs
- Success/Error feedback

### 3. API Integration
- Async/await patterns
- Error handling
- Type-safe models
- Clean service layer

### 4. State Management
- StatefulWidget สำหรับ local state
- Proper lifecycle management
- Efficient rebuilds

## ข้อควรระวัง

### 1. CORS
Backend ต้องเปิด CORS สำหรับ Flutter app:
```typescript
app.enableCors({
  origin: true,
  credentials: true,
});
```

### 2. Network Security
สำหรับ Android ต้องอนุญาต HTTP ใน `android/app/src/main/AndroidManifest.xml`:
```xml
<application
  android:usesCleartextTraffic="true"
  ...>
```

### 3. MongoDB Connection
ตรวจสอบว่า MongoDB รันอยู่และ connection string ถูกต้อง

### 4. API URL
ตั้งค่า API URL ให้ถูกต้องตาม platform ที่รัน

## สิ่งที่ได้เรียนรู้

1. **REST API Integration** - การเรียก API แบบ CRUD
2. **HTTP Package** - การใช้งาน http package ใน Flutter
3. **Async Programming** - Future และ async/await
4. **Form Handling** - Validation และ user input
5. **Material Components** - Card, List, Form, Dialog
6. **State Management** - StatefulWidget และ setState
7. **Error Handling** - Try-catch และ error messages
8. **Date/Time Handling** - DatePicker และ formatting
9. **Backend Integration** - NestJS + MongoDB
10. **Full-Stack Development** - Frontend + Backend

## ต่อยอด

1. เพิ่ม Authentication (Login/Register)
2. เพิ่ม User profiles
3. เพิ่ม Push notifications
4. เพิ่ม Calendar view
5. เพิ่ม Payment integration
6. เพิ่ม Image upload
7. เพิ่ม Real-time updates (WebSocket)
8. เพิ่ม Advanced filtering
9. เพิ่ม Export to PDF
10. เพิ่ม Analytics dashboard

## สรุป

Booking App นี้เป็นตัวอย่างที่ดีของการสร้าง Full-Stack Application ด้วย Flutter และ NestJS ครอบคลุมทั้ง Frontend และ Backend พร้อมการเชื่อมต่อผ่าน REST API เหมาะสำหรับเริ่มต้นเรียนรู้การพัฒนาแอพพลิเคชันแบบ Full-Stack
