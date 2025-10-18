# คู่มือการมีส่วนร่วมในโปรเจค

ขอบคุณที่สนใจมีส่วนร่วมในโปรเจค Flutter Material Design Tutorial!

## 🤝 วิธีการมีส่วนร่วม

### 1. Fork และ Clone Repository

```bash
# Fork repository บน GitHub
# จากนั้น clone ไปยังเครื่องของคุณ
git clone https://github.com/YOUR-USERNAME/flutter-mui-tutorial.git
cd flutter-mui-tutorial
```

### 2. สร้าง Branch ใหม่

```bash
git checkout -b feature/your-feature-name
# หรือ
git checkout -b fix/your-fix-name
```

### 3. ทำการแก้ไขหรือเพิ่มเติม

#### สำหรับการเพิ่ม Flutter App ใหม่

1. สร้างแอพใน `flutter-apps/` folder
2. เพิ่มเอกสารประกอบใน `docs/`
3. อัพเดท README.md

#### สำหรับการแก้ไข Backend

1. แก้ไขไฟล์ใน `backend/src/`
2. ทดสอบการทำงาน
3. อัพเดทเอกสาร API

#### สำหรับการแก้ไขเอกสาร

1. แก้ไขไฟล์ markdown ใน `docs/`
2. ตรวจสอบ formatting
3. เพิ่ม screenshot หากจำเป็น

### 4. Commit Changes

```bash
git add .
git commit -m "feat: เพิ่มฟีเจอร์ XYZ"
```

#### Commit Message Convention

ใช้รูปแบบ Conventional Commits:

- `feat:` - ฟีเจอร์ใหม่
- `fix:` - แก้ไขบั๊ก
- `docs:` - แก้ไขเอกสาร
- `style:` - แก้ไข formatting, ไม่เปลี่ยนโค้ด
- `refactor:` - ปรับปรุงโค้ด
- `test:` - เพิ่มหรือแก้ไข tests
- `chore:` - งานบำรุงรักษา

### 5. Push และ Create Pull Request

```bash
git push origin feature/your-feature-name
```

จากนั้นไปที่ GitHub และสร้าง Pull Request

## 📝 Code Style Guidelines

### Flutter/Dart

- ใช้ `dart format` เพื่อ format โค้ด
- ตั้งชื่อตัวแปรและฟังก์ชันให้มีความหมาย
- เขียน comments เป็นภาษาไทยหรือภาษาอังกฤษ
- ใช้ `const` constructor เมื่อเป็นไปได้

```dart
// ดี
class MyWidget extends StatelessWidget {
  const MyWidget({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const Text('Hello');
  }
}

// ไม่ดี
class mywidget extends StatelessWidget {
  Widget build(context) {
    return Text('Hello');
  }
}
```

### TypeScript/NestJS

- ใช้ `npm run format` เพื่อ format โค้ด
- ตั้งชื่อตามแบบ camelCase
- เขียน JSDoc comments
- ใช้ TypeScript types เสมอ

```typescript
// ดี
export class UsersService {
  /**
   * ดึงรายการผู้ใช้ทั้งหมด
   */
  async findAll(): Promise<User[]> {
    return this.userModel.find().exec();
  }
}

// ไม่ดี
export class UsersService {
  async findAll() {
    return this.userModel.find().exec();
  }
}
```

### Markdown

- ใช้ภาษาไทยที่ถูกต้อง
- เพิ่ม code blocks สำหรับตัวอย่างโค้ด
- ใช้ emoji เพื่อความชัดเจน (🎯, 📚, 💡)
- เพิ่ม links ไปยังเอกสารอ้างอิง

## 🧪 Testing

### Backend Testing

```bash
cd backend
npm test
```

### Flutter Testing

```bash
cd flutter-apps/app-name
flutter test
```

## 📋 Pull Request Checklist

ก่อนส่ง PR ตรวจสอบว่า:

- [ ] โค้ดทำงานได้ถูกต้อง
- [ ] ผ่านการทดสอบ (ถ้ามี)
- [ ] เอกสารถูกอัพเดท
- [ ] Commit messages ถูกต้อง
- [ ] ไม่มี conflicts กับ main branch
- [ ] Code style ถูกต้อง

## 💬 การสื่อสาร

- **Issues**: สำหรับรายงาน bugs หรือแนะนำฟีเจอร์
- **Discussions**: สำหรับคำถามและการพูดคุย
- **Pull Requests**: สำหรับส่งโค้ด

## 🎯 จุดประสงค์โปรเจค

โปรเจคนี้มีเป้าหมายเพื่อ:

1. สอนการใช้ Material Design ใน Flutter
2. ให้ตัวอย่างที่ใช้งานได้จริง
3. รวม backend API เพื่อการเรียนรู้ที่สมบูรณ์
4. ใช้ภาษาไทยในการอธิบาย

## 🙏 ขอบคุณ

ขอบคุณที่มีส่วนร่วมในโปรเจค! การมีส่วนร่วมของคุณช่วยให้โปรเจคนี้ดีขึ้น

## 📞 ติดต่อ

หากมีคำถามหรือข้อสงสัย:
- เปิด Issue
- แสดงความคิดเห็นใน Discussions
- ติดต่อผ่าน GitHub

---

**Note**: โปรเจคนี้เป็นโอเพนซอร์สภายใต้ MIT License
