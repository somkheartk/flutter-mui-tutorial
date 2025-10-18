# คู่มือการติดตั้งและเริ่มต้นใช้งาน

## 📋 สารบัญ
- [ติดตั้ง Flutter](#ติดตั้ง-flutter)
- [ติดตั้ง Backend](#ติดตั้ง-backend)
- [สร้าง Flutter Apps](#สร้าง-flutter-apps)
- [เชื่อมต่อ Backend กับ Flutter](#เชื่อมต่อ-backend-กับ-flutter)

## 🚀 ติดตั้ง Flutter

### Windows

1. ดาวน์โหลด Flutter SDK จาก [flutter.dev](https://docs.flutter.dev/get-started/install/windows)
2. แตกไฟล์ไปยัง `C:\src\flutter`
3. เพิ่ม Path: `C:\src\flutter\bin`
4. เปิด Command Prompt และรันคำสั่ง:
```cmd
flutter doctor
```

### macOS

1. ดาวน์โหลด Flutter SDK หรือใช้ Homebrew:
```bash
brew install --cask flutter
```

2. เพิ่ม Path ใน `.zshrc` หรือ `.bashrc`:
```bash
export PATH="$PATH:`pwd`/flutter/bin"
```

3. ตรวจสอบการติดตั้ง:
```bash
flutter doctor
```

### Linux

1. ดาวน์โหลดและแตกไฟล์:
```bash
cd ~/development
wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.x.x-stable.tar.xz
tar xf flutter_linux_3.x.x-stable.tar.xz
```

2. เพิ่ม Path:
```bash
export PATH="$PATH:$HOME/development/flutter/bin"
```

3. ตรวจสอบ:
```bash
flutter doctor
```

### ติดตั้ง IDE

#### VS Code
1. ติดตั้ง [Visual Studio Code](https://code.visualstudio.com/)
2. ติดตั้ง Extensions:
   - Flutter
   - Dart
   - Flutter Widget Snippets

#### Android Studio
1. ติดตั้ง [Android Studio](https://developer.android.com/studio)
2. ติดตั้ง Flutter และ Dart plugins
3. ติดตั้ง Android SDK

### ติดตั้ง Emulator

#### Android
```bash
# จาก Android Studio
# Tools > AVD Manager > Create Virtual Device
```

#### iOS (macOS เท่านั้น)
```bash
# ติดตั้ง Xcode จาก App Store
# เปิด Xcode > Preferences > Components > Install Simulator
```

## 🛠 ติดตั้ง Backend

### ติดตั้ง Node.js

#### Windows/macOS
ดาวน์โหลดจาก [nodejs.org](https://nodejs.org/) (แนะนำ LTS version)

#### Linux
```bash
# Ubuntu/Debian
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs

# หรือใช้ nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
nvm install 20
```

### ติดตั้ง MongoDB

#### Windows
1. ดาวน์โหลดจาก [mongodb.com](https://www.mongodb.com/try/download/community)
2. ติดตั้งตาม wizard
3. รัน MongoDB:
```cmd
net start MongoDB
```

#### macOS
```bash
# ใช้ Homebrew
brew tap mongodb/brew
brew install mongodb-community
brew services start mongodb-community
```

#### Linux
```bash
# Ubuntu/Debian
wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo systemctl start mongod
```

#### Docker (ทุก OS)
```bash
docker run -d -p 27017:27017 --name mongodb mongo:latest
```

### ติดตั้ง Backend Dependencies

```bash
cd backend
npm install
```

### ตั้งค่า Environment Variables

สร้างไฟล์ `.env` จาก `.env.example`:
```bash
cp .env.example .env
```

แก้ไขไฟล์ `.env`:
```env
MONGODB_URI=mongodb://localhost:27017/flutter-tutorial
JWT_SECRET=your-super-secret-key-change-this
JWT_EXPIRES_IN=7d
PORT=3000
NODE_ENV=development
```

### รัน Backend

```bash
# Development mode
npm run start:dev

# Production mode
npm run build
npm run start:prod
```

Backend จะรันที่ `http://localhost:3000`

## 📱 สร้าง Flutter Apps

### สร้างแอพ Flutter

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

### ติดตั้ง Dependencies

สำหรับแต่ละแอพ:
```bash
cd app-01-basic-components
flutter pub get
```

### รันแอพ

```bash
# ดู devices ที่มี
flutter devices

# รันแอพ
flutter run

# หรือระบุ device
flutter run -d chrome          # Web
flutter run -d macos           # macOS
flutter run -d emulator-5554   # Android
```

## 🔗 เชื่อมต่อ Backend กับ Flutter

### เพิ่ม HTTP Package

แก้ไข `pubspec.yaml`:
```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.1.0
```

รัน:
```bash
flutter pub get
```

### ตั้งค่า API Endpoint

สร้างไฟล์ `lib/config/api_config.dart`:
```dart
class ApiConfig {
  // สำหรับ Android Emulator
  static const String androidBaseUrl = 'http://10.0.2.2:3000/api';
  
  // สำหรับ iOS Simulator
  static const String iosBaseUrl = 'http://localhost:3000/api';
  
  // สำหรับ device จริง (ใช้ IP ของเครื่อง)
  static const String deviceBaseUrl = 'http://192.168.1.100:3000/api';
  
  // เลือกตาม platform
  static String get baseUrl {
    if (Platform.isAndroid) {
      return androidBaseUrl;
    } else if (Platform.isIOS) {
      return iosBaseUrl;
    }
    return deviceBaseUrl;
  }
}
```

### ตั้งค่า Android Network Permissions

แก้ไข `android/app/src/main/AndroidManifest.xml`:
```xml
<manifest>
    <uses-permission android:name="android.permission.INTERNET" />
    <!-- เพิ่ม cleartext traffic สำหรับ development -->
    <application
        android:usesCleartextTraffic="true"
        ...>
    </application>
</manifest>
```

### ตั้งค่า iOS Network Permissions

แก้ไข `ios/Runner/Info.plist`:
```xml
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
</dict>
```

## 🧪 ทดสอบการติดตั้ง

### ทดสอบ Backend

```bash
# ทดสอบด้วย curl
curl http://localhost:3000/api/users

# หรือใช้ Postman/Insomnia
```

### ทดสอบ Flutter App

1. รัน backend: `npm run start:dev`
2. รัน Flutter app: `flutter run`
3. ลองเรียก API จากแอพ

## ❓ แก้ไขปัญหาที่พบบ่อย

### Flutter Doctor Issues

```bash
# ติดตั้ง Android licenses
flutter doctor --android-licenses

# อัพเดท Flutter
flutter upgrade
```

### MongoDB ไม่รัน

```bash
# macOS
brew services restart mongodb-community

# Linux
sudo systemctl restart mongod

# Windows
net stop MongoDB
net start MongoDB
```

### Android Emulator ช้า

1. ตั้งค่า Hardware Acceleration (HAXM/WHPX)
2. เพิ่ม RAM ให้ emulator
3. ใช้ physical device แทน

### CORS Error

ตรวจสอบว่า backend ได้ enable CORS แล้ว (`src/main.ts`):
```typescript
app.enableCors({
  origin: true,
  credentials: true,
});
```

### Connection Refused

1. ตรวจสอบว่า backend กำลังรัน
2. ตรวจสอบ IP address ถูกต้อง
3. ตรวจสอบ firewall settings

## 📚 Resources เพิ่มเติม

- [Flutter Documentation](https://docs.flutter.dev/)
- [NestJS Documentation](https://docs.nestjs.com/)
- [MongoDB Manual](https://www.mongodb.com/docs/)
- [Material Design Guidelines](https://m3.material.io/)

## 🎓 ขั้นตอนต่อไป

1. อ่านเอกสารใน `docs/` folder
2. ลองรันแอพตัวอย่างแต่ละแอพ
3. ศึกษาโค้ดและแก้ไขเพิ่มเติม
4. สร้างโปรเจคของตัวเอง

## 💬 ติดต่อสอบถาม

หากมีปัญหาหรือข้อสงสัย:
- เปิด Issue บน GitHub
- ดูเอกสารประกอบใน `docs/`
- ศึกษา example code ในแต่ละแอพ
