# Flutter Material Design Example Apps

โฟลเดอร์นี้ประกอบด้วยแอพตัวอย่าง 10 แอพที่แสดงการใช้งาน Material Design Components

## 📱 รายการแอพทั้งหมด

### App 01: Basic Material Components
- **โฟลเดอร์**: `app-01-basic-components`
- **เนื้อหา**: Buttons, Cards, AppBar, FloatingActionButton, Chips, Badges
- **เอกสาร**: [docs/01-basic-components.md](../docs/01-basic-components.md)

### App 02: Form Controls
- **โฟลเดอร์**: `app-02-form-controls`
- **เนื้อหา**: TextField, Checkbox, Radio, Switch, Slider, DropdownButton, DatePicker, TimePicker
- **เอกสาร**: [docs/02-form-controls.md](../docs/02-form-controls.md)

### App 03: Navigation
- **โฟลเดอร์**: `app-03-navigation`
- **เนื้อหา**: Drawer, BottomNavigationBar, TabBar, PageView, Navigator
- **เอกสาร**: [docs/03-navigation.md](../docs/03-navigation.md)

### App 04: Lists and GridView
- **โฟลเดอร์**: `app-04-lists-gridview`
- **เนื้อหา**: ListView, GridView, ListTile, Divider, ExpansionTile
- **เอกสาร**: [docs/04-lists-gridview.md](../docs/04-lists-gridview.md)

### App 05: Dialogs and Bottom Sheets
- **โฟลเดอร์**: `app-05-dialogs-bottomsheets`
- **เนื้อหา**: AlertDialog, SimpleDialog, BottomSheet, ModalBottomSheet, SnackBar
- **เอกสาร**: [docs/05-dialogs-bottomsheets.md](../docs/05-dialogs-bottomsheets.md)

### App 06: Data Tables
- **โฟลเดอร์**: `app-06-data-tables`
- **เนื้อหา**: DataTable, PaginatedDataTable, Sorting, Selection
- **เอกสาร**: [docs/06-data-tables.md](../docs/06-data-tables.md)

### App 07: Theming and Styling
- **โฟลเดอร์**: `app-07-theming-styling`
- **เนื้อหา**: ThemeData, Dark Mode, Custom Colors, Typography, Material 3
- **เอกสาร**: [docs/07-theming-styling.md](../docs/07-theming-styling.md)

### App 08: Animations and Transitions
- **โฟลเดอร์**: `app-08-animations`
- **เนื้อหา**: Hero Animation, AnimatedContainer, Transitions, Custom Animations
- **เอกสาร**: [docs/08-animations.md](../docs/08-animations.md)

### App 09: REST API Integration
- **โฟลเดอร์**: `app-09-api-integration`
- **เนื้อหา**: HTTP Requests, JSON Parsing, Loading States, Error Handling
- **เอกสาร**: [docs/09-api-integration.md](../docs/09-api-integration.md)

### App 10: Full CRUD Application
- **โฟลเดอร์**: `app-10-full-crud`
- **เนื้อหา**: Complete app with Create, Read, Update, Delete operations
- **เอกสาร**: [docs/10-full-crud.md](../docs/10-full-crud.md)

## 🚀 การรันแอพ

### สร้างโปรเจค Flutter ใหม่

แต่ละโฟลเดอร์เป็นโปรเจค Flutter แยกกัน สร้างโดยใช้คำสั่ง:

```bash
# เข้าไปยังโฟลเดอร์ flutter-apps
cd flutter-apps

# สร้างแอพใหม่
flutter create app-01-basic-components
flutter create app-02-form-controls
# ... สร้างต่อไปจนครบ 10 แอพ
```

### ติดตั้ง Dependencies

```bash
cd app-01-basic-components
flutter pub get
```

### รันแอพ

```bash
# ตรวจสอบ devices ที่ใช้งานได้
flutter devices

# รันแอพ
flutter run

# หรือระบุ device
flutter run -d chrome  # สำหรับ web
flutter run -d emulator-5554  # สำหรับ Android emulator
```

## 📦 Dependencies ที่ใช้

ส่วนใหญ่แอพจะใช้ dependencies พื้นฐานเหล่านี้:

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
  http: ^1.1.0  # สำหรับ API calls (app 09-10)
  provider: ^6.0.0  # สำหรับ state management
```

## 🎯 เป้าหมายการเรียนรู้

แต่ละแอพออกแบบมาเพื่อให้เรียนรู้:
1. Material Design principles
2. Widget composition
3. State management
4. User interactions
5. Best practices

## 💡 เทคนิคการศึกษา

1. **ดูโค้ด**: เริ่มจากการดูโค้ดและทำความเข้าใจโครงสร้าง
2. **รันแอพ**: ลองรันและทดสอบฟีเจอร์ต่างๆ
3. **แก้ไข**: ลองแก้ไขโค้ดและดูผลลัพธ์
4. **ทดลอง**: สร้างฟีเจอร์ใหม่ๆ ด้วยตัวเอง
5. **อ่านเอกสาร**: ศึกษาเอกสารประกอบใน docs/

## 🔧 การ Debug

```bash
# ดู logs
flutter logs

# Hot reload
# กด 'r' ใน terminal หรือใช้ IDE

# Hot restart
# กด 'R' ใน terminal

# Clear build cache
flutter clean
flutter pub get
```

## 📱 Build สำหรับ Production

### Android
```bash
flutter build apk  # Build APK
flutter build appbundle  # Build App Bundle
```

### iOS
```bash
flutter build ios
```

### Web
```bash
flutter build web
```

## 🎨 ไฟล์สำคัญในแต่ละแอพ

```
app-xx-name/
├── lib/
│   ├── main.dart           # Entry point
│   ├── screens/            # หน้าจอต่างๆ
│   ├── widgets/            # Custom widgets
│   ├── models/             # Data models
│   └── services/           # API services
├── assets/                 # รูปภาพ, ไฟล์อื่นๆ
├── pubspec.yaml           # Dependencies และ assets
└── README.md              # เอกสารแอพ
```

## 🤝 การเรียนรู้เพิ่มเติม

- อ่านเอกสารใน `docs/` folder
- ศึกษา [Flutter Documentation](https://docs.flutter.dev/)
- ดู [Material Design Guidelines](https://m3.material.io/)
- เข้าร่วม [Flutter Community](https://flutter.dev/community)

## 📞 ติดต่อ

หากมีคำถามหรือข้อสงสัย:
- เปิด Issue บน GitHub
- ติดต่อผู้สอน
