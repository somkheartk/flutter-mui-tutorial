# 🚀 Quick Start Guide

เริ่มต้นใช้งานโปรเจค Flutter Material Design Tutorial อย่างรวดเร็ว

## 📋 สิ่งที่ต้องเตรียม

- **Flutter SDK** (3.0+) - [ติดตั้ง](https://docs.flutter.dev/get-started/install)
- **Node.js** (18+) - [ติดตั้ง](https://nodejs.org/)
- **MongoDB** (6.0+) - [ติดตั้ง](https://www.mongodb.com/try/download/community)
- **Code Editor** (VS Code หรือ Android Studio)

## ⚡ เริ่มต้นด้วย 3 ขั้นตอน

### 1️⃣ Clone Repository

```bash
git clone https://github.com/somkheartk/flutter-mui-tutorial.git
cd flutter-mui-tutorial
```

### 2️⃣ รัน Backend

```bash
# เข้าไปยัง backend folder
cd backend

# ติดตั้ง dependencies
npm install

# สร้างไฟล์ .env
cp .env.example .env

# รัน backend (ตรวจสอบว่า MongoDB กำลังรันอยู่)
npm run start:dev
```

Backend จะรันที่: **http://localhost:3000**

### 3️⃣ สร้างและรัน Flutter App

```bash
# กลับไปยัง root folder
cd ..

# เข้าไปยัง flutter-apps folder
cd flutter-apps

# สร้างแอพแรก (ตัวอย่าง)
flutter create app-01-basic-components

# เข้าไปยังแอพ
cd app-01-basic-components

# รันแอพ
flutter run
```

## 📚 เริ่มเรียนรู้

### แนะนำสำหรับผู้เริ่มต้น

1. **อ่านเอกสาร**: เริ่มจาก [docs/README.md](./docs/README.md)
2. **เลือกบทเรียน**: เริ่มจาก [บทที่ 1: Basic Components](./docs/01-basic-components.md)
3. **ลองสร้างแอพ**: ตามตัวอย่างในเอกสาร
4. **ทดลอง Backend**: ทดสอบ API endpoints

### ลำดับการเรียนรู้แนะนำ

**สัปดาห์ที่ 1: พื้นฐาน**
```
📖 บทที่ 1: Basic Material Components
📖 บทที่ 2: Form Controls  
📖 บทที่ 3: Navigation
```

**สัปดาห์ที่ 2: ขั้นกลาง**
```
📖 บทที่ 4: Lists and GridView
📖 บทที่ 5: Dialogs and Bottom Sheets
📖 บทที่ 6: Data Tables
```

**สัปดาห์ที่ 3: ขั้นสูง**
```
📖 บทที่ 7: Theming and Styling
📖 บทที่ 8: Animations and Transitions
📖 บทที่ 9: REST API Integration
📖 บทที่ 10: Full CRUD Application
```

## 🎯 ทดสอบ Backend API

### ใช้ curl

```bash
# ลงทะเบียน
curl -X POST http://localhost:3000/api/auth/register \
  -H "Content-Type: application/json" \
  -d '{
    "email": "test@example.com",
    "password": "password123",
    "name": "Test User"
  }'

# ล็อกอิน
curl -X POST http://localhost:3000/api/auth/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "test@example.com",
    "password": "password123"
  }'
```

### ใช้ Postman/Insomnia

1. Import collection หรือสร้าง requests ใหม่
2. ตั้งค่า Base URL: `http://localhost:3000/api`
3. ทดสอบ endpoints ตาม [Backend README](./backend/README.md)

## 📱 สร้างแอพตัวอย่างทั้งหมด

```bash
cd flutter-apps

# สร้างแอพทั้ง 10 แอพ
flutter create app-01-basic-components
flutter create app-02-form-controls
flutter create app-03-navigation
flutter create app-04-lists-gridview
flutter create app-05-dialogs-bottomsheets
flutter create app-06-data-tables
flutter create app-07-theming-styling
flutter create app-08-animations
flutter create app-09-api-integration
flutter create app-10-full-crud
```

## 🔧 การแก้ไขปัญหาเบื้องต้น

### Backend ไม่รัน

```bash
# ตรวจสอบว่า MongoDB กำลังรัน
# macOS
brew services list

# Linux
sudo systemctl status mongod

# Windows
net start MongoDB
```

### Flutter command not found

```bash
# ตรวจสอบการติดตั้ง
flutter doctor

# เพิ่ม Flutter ใน PATH
export PATH="$PATH:[PATH_TO_FLUTTER_GIT_DIRECTORY]/flutter/bin"
```

### Connection refused error

1. ตรวจสอบว่า backend กำลังรัน
2. ตรวจสอบ port (default: 3000)
3. ตรวจสอบ firewall settings

## 📖 เอกสารเพิ่มเติม

- [SETUP-GUIDE.md](./SETUP-GUIDE.md) - คู่มือติดตั้งละเอียด
- [Backend README](./backend/README.md) - เอกสาร API
- [Flutter Apps README](./flutter-apps/README.md) - คู่มือแอพ
- [CONTRIBUTING.md](./CONTRIBUTING.md) - การมีส่วนร่วม

## 💬 ต้องการความช่วยเหลือ?

- 📝 อ่าน [Documentation](./docs/)
- 🐛 รายงาน [Issues](https://github.com/somkheartk/flutter-mui-tutorial/issues)
- 💡 ดู [Discussions](https://github.com/somkheartk/flutter-mui-tutorial/discussions)

## 🎓 ขั้นตอนต่อไป

1. ✅ ติดตั้ง dependencies ครบถ้วน
2. ✅ รัน backend สำเร็จ
3. ✅ สร้างและรันแอพแรก
4. 📚 เริ่มเรียนบทที่ 1
5. 💪 ฝึกทำแบบฝึกหัดท้ายบท
6. 🚀 สร้างโปรเจคของตัวเอง

---

**ขอให้สนุกกับการเรียนรู้ Flutter! 🎉**

Created with ❤️ by somkheartk
