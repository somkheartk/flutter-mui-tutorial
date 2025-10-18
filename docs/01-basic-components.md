# บทที่ 1: Basic Material Components

## 🎯 จุดประสงค์
เรียนรู้การใช้งาน Material Design Components พื้นฐานใน Flutter

## 📚 Material Components ที่จะเรียน

### 1. MaterialApp
Widget หลักสำหรับสร้าง Material Design app

```dart
MaterialApp(
  title: 'Flutter Demo',
  theme: ThemeData(
    primarySwatch: Colors.blue,
  ),
  home: MyHomePage(),
)
```

### 2. Scaffold
โครงสร้างพื้นฐานของหน้าจอ

```dart
Scaffold(
  appBar: AppBar(
    title: Text('Basic Components'),
  ),
  body: Center(
    child: Text('Hello World'),
  ),
  floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
  ),
)
```

### 3. AppBar
แถบด้านบนของแอพ

```dart
AppBar(
  title: Text('My App'),
  leading: IconButton(
    icon: Icon(Icons.menu),
    onPressed: () {},
  ),
  actions: [
    IconButton(
      icon: Icon(Icons.search),
      onPressed: () {},
    ),
    IconButton(
      icon: Icon(Icons.more_vert),
      onPressed: () {},
    ),
  ],
)
```

### 4. Buttons

#### ElevatedButton
ปุ่มที่มีเงา

```dart
ElevatedButton(
  onPressed: () {
    print('Elevated button pressed');
  },
  child: Text('Elevated Button'),
)
```

#### TextButton
ปุ่มแบบข้อความ

```dart
TextButton(
  onPressed: () {
    print('Text button pressed');
  },
  child: Text('Text Button'),
)
```

#### OutlinedButton
ปุ่มแบบขอบ

```dart
OutlinedButton(
  onPressed: () {
    print('Outlined button pressed');
  },
  child: Text('Outlined Button'),
)
```

#### IconButton
ปุ่มไอคอน

```dart
IconButton(
  icon: Icon(Icons.favorite),
  onPressed: () {
    print('Icon button pressed');
  },
)
```

### 5. Card
การ์ดสำหรับแสดงเนื้อหา

```dart
Card(
  elevation: 4,
  child: Padding(
    padding: EdgeInsets.all(16),
    child: Column(
      children: [
        Text('Card Title', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        Text('Card content goes here...'),
      ],
    ),
  ),
)
```

### 6. FloatingActionButton
ปุ่มลอยที่มักใช้สำหรับ Action หลัก

```dart
FloatingActionButton(
  onPressed: () {
    print('FAB pressed');
  },
  child: Icon(Icons.add),
  backgroundColor: Colors.blue,
)
```

### 7. Chip
แท็กเล็กๆ สำหรับแสดงข้อมูล

```dart
Chip(
  label: Text('Flutter'),
  avatar: CircleAvatar(
    child: Text('F'),
  ),
  deleteIcon: Icon(Icons.cancel),
  onDeleted: () {
    print('Chip deleted');
  },
)
```

### 8. Badge
ตัวเลขแจ้งเตือน

```dart
Badge(
  label: Text('3'),
  child: Icon(Icons.notifications),
)
```

## 💡 ตัวอย่างแอพสมบูรณ์

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Components Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: BasicComponentsPage(),
    );
  }
}

class BasicComponentsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic Material Components'),
        actions: [
          IconButton(
            icon: Badge(
              label: Text('5'),
              child: Icon(Icons.notifications),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Notifications clicked')),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Buttons Section
            Text('Buttons', style: Theme.of(context).textTheme.headlineSmall),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {},
              child: Text('Elevated Button'),
            ),
            SizedBox(height: 8),
            TextButton(
              onPressed: () {},
              child: Text('Text Button'),
            ),
            SizedBox(height: 8),
            OutlinedButton(
              onPressed: () {},
              child: Text('Outlined Button'),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () {},
                ),
              ],
            ),
            
            SizedBox(height: 24),
            
            // Cards Section
            Text('Cards', style: Theme.of(context).textTheme.headlineSmall),
            SizedBox(height: 8),
            Card(
              elevation: 2,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Card Example',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text('This is a Material Design Card component.'),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text('ACTION 1'),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text('ACTION 2'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            
            SizedBox(height: 24),
            
            // Chips Section
            Text('Chips', style: Theme.of(context).textTheme.headlineSmall),
            SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                Chip(
                  label: Text('Flutter'),
                  avatar: CircleAvatar(
                    child: Text('F'),
                  ),
                ),
                Chip(
                  label: Text('Dart'),
                  avatar: CircleAvatar(
                    child: Text('D'),
                  ),
                ),
                Chip(
                  label: Text('Material'),
                  deleteIcon: Icon(Icons.cancel),
                  onDeleted: () {},
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('FAB pressed'),
              action: SnackBarAction(
                label: 'UNDO',
                onPressed: () {},
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
```

## 🎨 การปรับแต่ง Theme

```dart
ThemeData(
  primarySwatch: Colors.blue,
  useMaterial3: true, // ใช้ Material 3
  
  // Customize specific components
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
  
  cardTheme: CardTheme(
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
)
```

## 📝 แบบฝึกหัด

1. สร้าง AppBar ที่มี leading icon และ actions
2. สร้าง Card ที่มีรูปภาพ, หัวข้อ และปุ่ม action
3. สร้างหน้าจอที่มีปุ่ม 3 แบบ (Elevated, Text, Outlined)
4. เพิ่ม FloatingActionButton ที่แสดง SnackBar เมื่อกด
5. สร้าง Chip list ที่สามารถลบได้

## 🔗 Resources

- [Material Design Guidelines](https://m3.material.io/)
- [Flutter Material Components](https://api.flutter.dev/flutter/material/material-library.html)
- [Material 3 in Flutter](https://docs.flutter.dev/ui/design/material)
