# บทที่ 6: Data Tables

## 🎯 จุดประสงค์
เรียนรู้การแสดงข้อมูลในรูปแบบตาราง

## 📚 Components ที่จะเรียน

### 1. DataTable
ตารางข้อมูลพื้นฐาน

```dart
DataTable(
  columns: [
    DataColumn(label: Text('ชื่อ')),
    DataColumn(label: Text('อายุ')),
    DataColumn(label: Text('เมือง')),
  ],
  rows: [
    DataRow(cells: [
      DataCell(Text('John')),
      DataCell(Text('25')),
      DataCell(Text('กรุงเทพฯ')),
    ]),
    DataRow(cells: [
      DataCell(Text('Jane')),
      DataCell(Text('30')),
      DataCell(Text('เชียงใหม่')),
    ]),
  ],
)
```

### 2. PaginatedDataTable
ตารางที่มี Pagination

```dart
class MyDataSource extends DataTableSource {
  final List<Map<String, dynamic>> _data;
  
  MyDataSource(this._data);
  
  @override
  DataRow? getRow(int index) {
    if (index >= _data.length) return null;
    final item = _data[index];
    
    return DataRow(cells: [
      DataCell(Text(item['name'])),
      DataCell(Text(item['age'].toString())),
      DataCell(Text(item['city'])),
    ]);
  }
  
  @override
  bool get isRowCountApproximate => false;
  
  @override
  int get rowCount => _data.length;
  
  @override
  int get selectedRowCount => 0;
}

// ใช้งาน
PaginatedDataTable(
  header: Text('รายชื่อผู้ใช้'),
  columns: [
    DataColumn(label: Text('ชื่อ')),
    DataColumn(label: Text('อายุ')),
    DataColumn(label: Text('เมือง')),
  ],
  source: MyDataSource(data),
  rowsPerPage: 10,
)
```

## 💡 ตัวอย่างแอพสมบูรณ์

```dart
import 'package:flutter/material.dart';

class DataTableExample extends StatefulWidget {
  @override
  _DataTableExampleState createState() => _DataTableExampleState();
}

class _DataTableExampleState extends State<DataTableExample> {
  List<User> users = [
    User('John Doe', 25, 'กรุงเทพฯ', true),
    User('Jane Smith', 30, 'เชียงใหม่', false),
    User('Bob Johnson', 35, 'ภูเก็ต', true),
  ];

  int? _sortColumnIndex;
  bool _sortAscending = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Data Tables')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildSimpleTable(),
            SizedBox(height: 20),
            _buildSortableTable(),
          ],
        ),
      ),
    );
  }

  Widget _buildSimpleTable() {
    return Card(
      margin: EdgeInsets.all(16),
      child: DataTable(
        columns: [
          DataColumn(label: Text('ชื่อ')),
          DataColumn(label: Text('อายุ')),
          DataColumn(label: Text('เมือง')),
          DataColumn(label: Text('สถานะ')),
        ],
        rows: users.map((user) {
          return DataRow(cells: [
            DataCell(Text(user.name)),
            DataCell(Text(user.age.toString())),
            DataCell(Text(user.city)),
            DataCell(
              Icon(
                user.isActive ? Icons.check_circle : Icons.cancel,
                color: user.isActive ? Colors.green : Colors.red,
              ),
            ),
          ]);
        }).toList(),
      ),
    );
  }

  Widget _buildSortableTable() {
    return Card(
      margin: EdgeInsets.all(16),
      child: DataTable(
        sortColumnIndex: _sortColumnIndex,
        sortAscending: _sortAscending,
        columns: [
          DataColumn(
            label: Text('ชื่อ'),
            onSort: (columnIndex, ascending) {
              setState(() {
                _sortColumnIndex = columnIndex;
                _sortAscending = ascending;
                users.sort((a, b) => ascending
                    ? a.name.compareTo(b.name)
                    : b.name.compareTo(a.name));
              });
            },
          ),
          DataColumn(
            label: Text('อายุ'),
            numeric: true,
            onSort: (columnIndex, ascending) {
              setState(() {
                _sortColumnIndex = columnIndex;
                _sortAscending = ascending;
                users.sort((a, b) => ascending
                    ? a.age.compareTo(b.age)
                    : b.age.compareTo(a.age));
              });
            },
          ),
          DataColumn(label: Text('เมือง')),
        ],
        rows: users.map((user) {
          return DataRow(
            selected: user.isActive,
            cells: [
              DataCell(Text(user.name)),
              DataCell(Text(user.age.toString())),
              DataCell(Text(user.city)),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class User {
  final String name;
  final int age;
  final String city;
  final bool isActive;

  User(this.name, this.age, this.city, this.isActive);
}
```

## 📝 แบบฝึกหัด

1. สร้างตารางที่มีการ sorting
2. เพิ่มฟีเจอร์ search ในตาราง
3. สร้าง paginated table
4. เพิ่มการ select rows
5. สร้างตารางที่ดึงข้อมูลจาก API

## 🔗 Resources

- [DataTable](https://api.flutter.dev/flutter/material/DataTable-class.html)
- [PaginatedDataTable](https://api.flutter.dev/flutter/material/PaginatedDataTable-class.html)
