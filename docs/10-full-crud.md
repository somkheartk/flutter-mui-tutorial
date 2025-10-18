# บทที่ 10: Full CRUD Application

## 🎯 จุดประสงค์
สร้างแอพพลิเคชันจัดการข้อมูลแบบสมบูรณ์ (Create, Read, Update, Delete) ที่เชื่อมต่อกับ Backend API

## 📚 สิ่งที่จะเรียน

1. การเชื่อมต่อกับ REST API
2. การจัดการ State
3. Form validation
4. Loading states
5. Error handling
6. List management
7. Navigation

## 🏗 โครงสร้างแอพ

```
lib/
├── main.dart
├── models/
│   └── user.dart
├── services/
│   └── api_service.dart
├── screens/
│   ├── user_list_screen.dart
│   ├── user_detail_screen.dart
│   └── user_form_screen.dart
└── widgets/
    └── user_card.dart
```

## 💡 ตัวอย่างโค้ดสมบูรณ์

### 1. Model (models/user.dart)

```dart
class User {
  final String? id;
  final String email;
  final String name;
  final String? phone;
  final String? avatar;

  User({
    this.id,
    required this.email,
    required this.name,
    this.phone,
    this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] ?? json['id'],
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'phone': phone,
      'avatar': avatar,
    };
  }
}
```

### 2. API Service (services/api_service.dart)

```dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:3000/api';
  String? _token;

  // Authentication
  Future<void> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      _token = data['access_token'];
    } else {
      throw Exception('Login failed');
    }
  }

  // Get all users
  Future<List<User>> getUsers() async {
    final response = await http.get(
      Uri.parse('$baseUrl/users'),
      headers: {
        'Content-Type': 'application/json',
        if (_token != null) 'Authorization': 'Bearer $_token',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load users');
    }
  }

  // Get single user
  Future<User> getUser(String id) async {
    final response = await http.get(
      Uri.parse('$baseUrl/users/$id'),
      headers: {
        'Content-Type': 'application/json',
        if (_token != null) 'Authorization': 'Bearer $_token',
      },
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load user');
    }
  }

  // Create user
  Future<User> createUser(User user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users'),
      headers: {
        'Content-Type': 'application/json',
        if (_token != null) 'Authorization': 'Bearer $_token',
      },
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create user');
    }
  }

  // Update user
  Future<User> updateUser(String id, User user) async {
    final response = await http.patch(
      Uri.parse('$baseUrl/users/$id'),
      headers: {
        'Content-Type': 'application/json',
        if (_token != null) 'Authorization': 'Bearer $_token',
      },
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update user');
    }
  }

  // Delete user
  Future<void> deleteUser(String id) async {
    final response = await http.delete(
      Uri.parse('$baseUrl/users/$id'),
      headers: {
        'Content-Type': 'application/json',
        if (_token != null) 'Authorization': 'Bearer $_token',
      },
    );

    if (response.statusCode != 200 && response.statusCode != 204) {
      throw Exception('Failed to delete user');
    }
  }
}
```

### 3. User List Screen (screens/user_list_screen.dart)

```dart
import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/api_service.dart';
import 'user_form_screen.dart';
import 'user_detail_screen.dart';

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final ApiService _apiService = ApiService();
  List<User> _users = [];
  bool _isLoading = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final users = await _apiService.getUsers();
      setState(() {
        _users = users;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _isLoading = false;
      });
    }
  }

  Future<void> _deleteUser(String id) async {
    try {
      await _apiService.deleteUser(id);
      _loadUsers();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('ลบผู้ใช้สำเร็จ')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('ลบผู้ใช้ไม่สำเร็จ: $e')),
      );
    }
  }

  void _confirmDelete(User user) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('ยืนยันการลบ'),
        content: Text('คุณต้องการลบ ${user.name} ใช่หรือไม่?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('ยกเลิก'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _deleteUser(user.id!);
            },
            child: Text('ลบ', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('จัดการผู้ใช้'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _loadUsers,
          ),
        ],
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserFormScreen(),
            ),
          );
          if (result == true) {
            _loadUsers();
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: Colors.red),
            SizedBox(height: 16),
            Text('เกิดข้อผิดพลาด: $_error'),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadUsers,
              child: Text('ลองอีกครั้ง'),
            ),
          ],
        ),
      );
    }

    if (_users.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.people_outline, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text('ไม่มีผู้ใช้'),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _loadUsers,
      child: ListView.builder(
        itemCount: _users.length,
        padding: EdgeInsets.all(8),
        itemBuilder: (context, index) {
          final user = _users[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 4),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(user.name[0].toUpperCase()),
              ),
              title: Text(user.name),
              subtitle: Text(user.email),
              trailing: PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'view',
                    child: Row(
                      children: [
                        Icon(Icons.visibility),
                        SizedBox(width: 8),
                        Text('ดูรายละเอียด'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'edit',
                    child: Row(
                      children: [
                        Icon(Icons.edit),
                        SizedBox(width: 8),
                        Text('แก้ไข'),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 'delete',
                    child: Row(
                      children: [
                        Icon(Icons.delete, color: Colors.red),
                        SizedBox(width: 8),
                        Text('ลบ', style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                ],
                onSelected: (value) async {
                  if (value == 'view') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserDetailScreen(userId: user.id!),
                      ),
                    );
                  } else if (value == 'edit') {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserFormScreen(user: user),
                      ),
                    );
                    if (result == true) {
                      _loadUsers();
                    }
                  } else if (value == 'delete') {
                    _confirmDelete(user);
                  }
                },
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserDetailScreen(userId: user.id!),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
```

### 4. User Form Screen (screens/user_form_screen.dart)

```dart
import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/api_service.dart';

class UserFormScreen extends StatefulWidget {
  final User? user;

  UserFormScreen({this.user});

  @override
  _UserFormScreenState createState() => _UserFormScreenState();
}

class _UserFormScreenState extends State<UserFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _apiService = ApiService();
  
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  
  bool _isLoading = false;
  bool get _isEditing => widget.user != null;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user?.name);
    _emailController = TextEditingController(text: widget.user?.email);
    _phoneController = TextEditingController(text: widget.user?.phone);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isLoading = true);

    try {
      final user = User(
        id: widget.user?.id,
        name: _nameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
      );

      if (_isEditing) {
        await _apiService.updateUser(user.id!, user);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('แก้ไขข้อมูลสำเร็จ')),
        );
      } else {
        await _apiService.createUser(user);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('เพิ่มผู้ใช้สำเร็จ')),
        );
      }

      Navigator.pop(context, true);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('เกิดข้อผิดพลาด: $e')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? 'แก้ไขผู้ใช้' : 'เพิ่มผู้ใช้'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'ชื่อ-นามสกุล',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'กรุณากรอกชื่อ';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'อีเมล',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'กรุณากรอกอีเมล';
                }
                if (!value.contains('@')) {
                  return 'รูปแบบอีเมลไม่ถูกต้อง';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'เบอร์โทรศัพท์',
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: _isLoading ? null : _submitForm,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: _isLoading
                    ? SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(_isEditing ? 'บันทึก' : 'เพิ่มผู้ใช้',
                        style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

## 📝 การติดตั้ง

### pubspec.yaml
```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.1.0
```

### การรัน Backend
```bash
cd backend
npm install
npm run start:dev
```

## 🎯 Features

- ✅ แสดงรายการผู้ใช้
- ✅ เพิ่มผู้ใช้ใหม่
- ✅ แก้ไขข้อมูลผู้ใช้
- ✅ ลบผู้ใช้
- ✅ ดูรายละเอียดผู้ใช้
- ✅ Form validation
- ✅ Loading states
- ✅ Error handling
- ✅ Pull to refresh

## 📝 แบบฝึกหัด

1. เพิ่มฟีเจอร์ค้นหาผู้ใช้
2. เพิ่มการเรียงลำดับข้อมูล
3. เพิ่ม pagination
4. เพิ่มการอัพโหลดรูปโปรไฟล์
5. เพิ่มระบบ authentication

## 🔗 Resources

- [HTTP Package](https://pub.dev/packages/http)
- [Working with REST APIs](https://docs.flutter.dev/cookbook/networking/fetch-data)
- [JSON Serialization](https://docs.flutter.dev/data-and-backend/json)
