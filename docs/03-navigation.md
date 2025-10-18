# บทที่ 3: Navigation

## 🎯 จุดประสงค์
เรียนรู้การนำทางระหว่างหน้าจอและ Navigation patterns ใน Flutter

## 📚 Navigation Components

### 1. Navigator.push / Navigator.pop
การนำทางพื้นฐาน

```dart
// ไปหน้าถัดไป
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => SecondPage()),
);

// กลับหน้าก่อนหน้า
Navigator.pop(context);

// กลับพร้อมส่งข้อมูล
Navigator.pop(context, 'result data');
```

### 2. Named Routes
การตั้งชื่อเส้นทาง

```dart
// ใน MaterialApp
MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => HomePage(),
    '/second': (context) => SecondPage(),
    '/third': (context) => ThirdPage(),
  },
)

// ใช้งาน
Navigator.pushNamed(context, '/second');
```

### 3. Drawer (Navigation Drawer)
เมนูด้านข้าง

```dart
Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: [
      DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30,
              child: Icon(Icons.person, size: 40),
            ),
            SizedBox(height: 10),
            Text('John Doe', style: TextStyle(color: Colors.white, fontSize: 18)),
            Text('john@example.com', style: TextStyle(color: Colors.white70)),
          ],
        ),
      ),
      ListTile(
        leading: Icon(Icons.home),
        title: Text('หน้าหลัก'),
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, '/');
        },
      ),
      ListTile(
        leading: Icon(Icons.settings),
        title: Text('ตั้งค่า'),
        onTap: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, '/settings');
        },
      ),
      Divider(),
      ListTile(
        leading: Icon(Icons.logout),
        title: Text('ออกจากระบบ'),
        onTap: () {
          // Logout logic
        },
      ),
    ],
  ),
)
```

### 4. BottomNavigationBar
แถบนำทางด้านล่าง

```dart
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  
  final List<Widget> _pages = [
    HomeScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'หน้าหลัก',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'ค้นหา',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'โปรไฟล์',
          ),
        ],
      ),
    );
  }
}
```

### 5. TabBar และ TabBarView
แท็บด้านบน

```dart
class TabBarExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabBar Example'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car), text: 'รถยนต์'),
              Tab(icon: Icon(Icons.directions_bike), text: 'จักรยาน'),
              Tab(icon: Icon(Icons.directions_bus), text: 'รถบัส'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text('รถยนต์')),
            Center(child: Text('จักรยาน')),
            Center(child: Text('รถบัส')),
          ],
        ),
      ),
    );
  }
}
```

### 6. PageView
แสดงหน้าแบบเลื่อน

```dart
class PageViewExample extends StatefulWidget {
  @override
  _PageViewExampleState createState() => _PageViewExampleState();
}

class _PageViewExampleState extends State<PageViewExample> {
  PageController _pageController = PageController();
  int _currentPage = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('PageView Example')),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: [
                Container(color: Colors.red, child: Center(child: Text('Page 1'))),
                Container(color: Colors.green, child: Center(child: Text('Page 2'))),
                Container(color: Colors.blue, child: Center(child: Text('Page 3'))),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return Container(
                margin: EdgeInsets.all(4),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index ? Colors.blue : Colors.grey,
                ),
              );
            }),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
```

## 💡 ตัวอย่างแอพสมบูรณ์

```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Demo',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  
  final List<Widget> _pages = [
    HomeTab(),
    SearchTab(),
    ProfileTab(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation Demo'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('John Doe'),
              accountEmail: Text('john@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text('JD', style: TextStyle(fontSize: 24)),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('หน้าหลัก'),
              onTap: () {
                Navigator.pop(context);
                setState(() => _currentIndex = 0);
              },
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('ค้นหา'),
              onTap: () {
                Navigator.pop(context);
                setState(() => _currentIndex = 1);
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('โปรไฟล์'),
              onTap: () {
                Navigator.pop(context);
                setState(() => _currentIndex = 2);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('ตั้งค่า'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'หน้าหลัก'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'ค้นหา'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'โปรไฟล์'),
        ],
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.home, size: 100, color: Colors.blue),
          SizedBox(height: 20),
          Text('หน้าหลัก', style: TextStyle(fontSize: 24)),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailPage()),
              );
            },
            child: Text('ไปหน้ารายละเอียด'),
          ),
        ],
      ),
    );
  }
}

class SearchTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search, size: 100, color: Colors.green),
          SizedBox(height: 20),
          Text('ค้นหา', style: TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}

class ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person, size: 100, color: Colors.orange),
          SizedBox(height: 20),
          Text('โปรไฟล์', style: TextStyle(fontSize: 24)),
        ],
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('รายละเอียด'),
      ),
      body: Center(
        child: Text('หน้ารายละเอียด'),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ตั้งค่า'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('การแจ้งเตือน'),
            trailing: Switch(value: true, onChanged: (val) {}),
          ),
          ListTile(
            leading: Icon(Icons.dark_mode),
            title: Text('โหมดมืด'),
            trailing: Switch(value: false, onChanged: (val) {}),
          ),
        ],
      ),
    );
  }
}
```

## 🎨 การส่งข้อมูลระหว่างหน้า

### ส่งข้อมูลไปหน้าถัดไป
```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => DetailPage(id: 123, title: 'Example'),
  ),
);
```

### รับข้อมูลกลับ
```dart
final result = await Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => SelectionPage()),
);
print('Selected: $result');
```

## 📝 แบบฝึกหัด

1. สร้างแอพที่มี Drawer และ BottomNavigationBar
2. สร้าง TabBar ที่มี 4 tabs
3. สร้าง PageView สำหรับ onboarding screen
4. ทำระบบนำทางแบบ nested (navigation ซ้อนกัน)
5. สร้าง custom page transition

## 🔗 Resources

- [Navigation in Flutter](https://docs.flutter.dev/cookbook/navigation)
- [Drawer Widget](https://api.flutter.dev/flutter/material/Drawer-class.html)
- [BottomNavigationBar](https://api.flutter.dev/flutter/material/BottomNavigationBar-class.html)
