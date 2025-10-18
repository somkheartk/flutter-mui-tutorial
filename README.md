# Flutter Material Design Tutorial (MUI)
### บทเรียน Flutter เน้นการใช้ Material Design Components พร้อม 10 แอพตัวอย่าง

![Flutter](https://img.shields.io/badge/Flutter-3.0+-blue.svg)
![NestJS](https://img.shields.io/badge/NestJS-10.0+-red.svg)
![MongoDB](https://img.shields.io/badge/MongoDB-6.0+-green.svg)

## 📚 เกี่ยวกับ

บทเรียนนี้เน้นการสอนการใช้งาน Material Design Components ใน Flutter พร้อมแอพตัวอย่าง 10 แอพที่ครอบคลุมการใช้งานจริง รวมถึง Backend API ที่สร้างด้วย NestJS และ MongoDB

## 🎯 เนื้อหาที่สอน

### 10 แอพตัวอย่าง

1. **Basic Material Components** - ปุ่ม, การ์ด, AppBar
2. **Form Controls** - TextField, Checkbox, Radio, Switch
3. **Navigation** - Drawer, BottomNavigationBar, Tabs
4. **Lists and GridView** - รายการและตาราง
5. **Dialogs and Bottom Sheets** - กล่องโต้ตอบและแผ่นด้านล่าง
6. **Data Tables** - ตารางข้อมูล
7. **Theming and Styling** - การจัดธีมและสไตล์
8. **Animations and Transitions** - แอนิเมชันและการเปลี่ยนผ่าน
9. **REST API Integration** - การเชื่อมต่อ API
10. **Full CRUD Application** - แอพพลิเคชันจัดการข้อมูลแบบสมบูรณ์

## 🚀 เริ่มต้นใช้งาน

### ข้อกำหนดเบื้องต้น

- Flutter SDK 3.0 หรือสูงกว่า
- Dart SDK 2.17 หรือสูงกว่า
- Node.js 18 หรือสูงกว่า
- MongoDB 6.0 หรือสูงกว่า
- Android Studio / Xcode (สำหรับ Emulator)
- VS Code หรือ Android Studio

### การติดตั้ง Flutter

```bash
# ดาวน์โหลดและติดตั้ง Flutter SDK
# สำหรับ macOS/Linux
git clone https://github.com/flutter/flutter.git
export PATH="$PATH:`pwd`/flutter/bin"

# ตรวจสอบการติดตั้ง
flutter doctor
```

### การติดตั้ง Backend

```bash
# เข้าไปยังโฟลเดอร์ backend
cd backend

# ติดตั้ง dependencies
npm install

# ตั้งค่าไฟล์ .env
cp .env.example .env

# รัน backend
npm run start:dev
```

### การรันแอพ Flutter

```bash
# เข้าไปยังโฟลเดอร์แอพที่ต้องการ
cd flutter-apps/app-01-basic-components

# ติดตั้ง dependencies
flutter pub get

# รันแอพ
flutter run
```

## 📁 โครงสร้างโปรเจค

```
flutter-mui-tutorial/
├── flutter-apps/              # แอพ Flutter ทั้ง 10 แอพ
│   ├── app-01-basic-components/
│   ├── app-02-form-controls/
│   ├── app-03-navigation/
│   ├── app-04-lists-gridview/
│   ├── app-05-dialogs-bottomsheets/
│   ├── app-06-data-tables/
│   ├── app-07-theming-styling/
│   ├── app-08-animations/
│   ├── app-09-api-integration/
│   └── app-10-full-crud/
├── backend/                   # NestJS Backend API
│   ├── src/
│   ├── package.json
│   └── README.md
├── docs/                      # เอกสารประกอบ
│   ├── 01-basic-components.md
│   ├── 02-form-controls.md
│   └── ...
└── README.md
```

## 📖 เอกสารประกอบ

เอกสารประกอบทั้งหมดอยู่ในโฟลเดอร์ `docs/` พร้อมคำอธิบายละเอียดเป็นภาษาไทย

- [01 - Basic Material Components](./docs/01-basic-components.md)
- [02 - Form Controls](./docs/02-form-controls.md)
- [03 - Navigation](./docs/03-navigation.md)
- [04 - Lists and GridView](./docs/04-lists-gridview.md)
- [05 - Dialogs and Bottom Sheets](./docs/05-dialogs-bottomsheets.md)
- [06 - Data Tables](./docs/06-data-tables.md)
- [07 - Theming and Styling](./docs/07-theming-styling.md)
- [08 - Animations and Transitions](./docs/08-animations.md)
- [09 - REST API Integration](./docs/09-api-integration.md)
- [10 - Full CRUD Application](./docs/10-full-crud.md)

## 🛠 Backend API

Backend สร้างด้วย NestJS และ MongoDB ประกอบด้วย:

- **User Management** - จัดการผู้ใช้
- **Authentication** - ระบบล็อกอิน/ลงทะเบียน
- **CRUD Operations** - สร้าง อ่าน แก้ไข ลบข้อมูล
- **File Upload** - อัพโหลดไฟล์

### API Endpoints

```
GET    /api/users          - ดึงรายการผู้ใช้ทั้งหมด
GET    /api/users/:id      - ดึงข้อมูลผู้ใช้
POST   /api/users          - สร้างผู้ใช้ใหม่
PUT    /api/users/:id      - แก้ไขข้อมูลผู้ใช้
DELETE /api/users/:id      - ลบผู้ใช้
POST   /api/auth/login     - ล็อกอิน
POST   /api/auth/register  - ลงทะเบียน
```

## 🎨 Material Design Components ที่สอน

### Basic Components
- MaterialApp
- Scaffold
- AppBar
- FloatingActionButton
- Button (ElevatedButton, TextButton, OutlinedButton)
- Card
- Chip
- Badge

### Form Components
- TextField
- Checkbox
- Radio
- Switch
- Slider
- DropdownButton
- DatePicker
- TimePicker

### Navigation Components
- Drawer
- BottomNavigationBar
- TabBar & TabBarView
- PageView
- Navigator

### Display Components
- ListView
- GridView
- DataTable
- ExpansionPanel
- Stepper

### Feedback Components
- Dialog
- BottomSheet
- SnackBar
- ProgressIndicator
- CircularProgressIndicator

## 💡 เทคนิคที่สอน

1. **State Management** - การจัดการสถานะด้วย setState, Provider
2. **Routing** - การนำทางระหว่างหน้า
3. **HTTP Requests** - การเรียก API
4. **Local Storage** - การเก็บข้อมูลในเครื่อง
5. **Form Validation** - การตรวจสอบความถูกต้องของฟอร์ม
6. **Error Handling** - การจัดการข้อผิดพลาด
7. **Responsive Design** - การออกแบบที่รองรับหลายขนาดหน้าจอ
8. **Dark Mode** - โหมดมืด

## 🤝 การมีส่วนร่วม

หากต้องการมีส่วนร่วมในการพัฒนา:

1. Fork repository นี้
2. สร้าง feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit การเปลี่ยนแปลง (`git commit -m 'Add some AmazingFeature'`)
4. Push ไปยัง branch (`git push origin feature/AmazingFeature`)
5. เปิด Pull Request

## 📝 License

MIT License - ดูรายละเอียดใน [LICENSE](LICENSE) file

## 📧 ติดต่อ

หากมีคำถามหรือข้อสงสัย สามารถติดต่อได้ที่ [Issues](https://github.com/somkheartk/flutter-mui-tutorial/issues)

## 🙏 ขอบคุณ

- Flutter Team
- NestJS Team
- MongoDB
- Material Design

---

สร้างด้วย ❤️ โดย somkheartk