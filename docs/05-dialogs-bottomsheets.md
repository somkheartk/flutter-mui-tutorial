# บทที่ 5: Dialogs and Bottom Sheets

## 🎯 จุดประสงค์
เรียนรู้การใช้งาน Dialogs, Bottom Sheets และ Feedback Components

## 📚 Components ที่จะเรียน

### 1. AlertDialog
กล่องแจ้งเตือนพื้นฐาน

```dart
void _showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('ยืนยันการลบ'),
        content: Text('คุณต้องการลบรายการนี้ใช่หรือไม่?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('ยกเลิก'),
          ),
          TextButton(
            onPressed: () {
              // ทำการลบ
              Navigator.pop(context);
            },
            child: Text('ลบ', style: TextStyle(color: Colors.red)),
          ),
        ],
      );
    },
  );
}
```

### 2. SimpleDialog
กล่องเลือกตัวเลือก

```dart
void _showSimpleDialog(BuildContext context) async {
  final result = await showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        title: Text('เลือกสี'),
        children: [
          SimpleDialogOption(
            child: Text('สีแดง'),
            onPressed: () {
              Navigator.pop(context, 'red');
            },
          ),
          SimpleDialogOption(
            child: Text('สีน้ำเงิน'),
            onPressed: () {
              Navigator.pop(context, 'blue');
            },
          ),
          SimpleDialogOption(
            child: Text('สีเขียว'),
            onPressed: () {
              Navigator.pop(context, 'green');
            },
          ),
        ],
      );
    },
  );
  
  if (result != null) {
    print('Selected: $result');
  }
}
```

### 3. Bottom Sheet
แผ่นด้านล่างแบบถาวร

```dart
void _showBottomSheet(BuildContext context) {
  showBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 200,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text('Bottom Sheet', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('ปิด'),
            ),
          ],
        ),
      );
    },
  );
}
```

### 4. Modal Bottom Sheet
แผ่นด้านล่างแบบ Modal

```dart
void _showModalBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.share),
              title: Text('แชร์'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.link),
              title: Text('คัดลอกลิงก์'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('แก้ไข'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}
```

### 5. SnackBar
แจ้งเตือนชั่วคราวด้านล่าง

```dart
void _showSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('บันทึกข้อมูลสำเร็จ'),
      duration: Duration(seconds: 3),
      action: SnackBarAction(
        label: 'เลิกทำ',
        onPressed: () {
          print('Undo');
        },
      ),
    ),
  );
}
```

## 💡 ตัวอย่างแอพสมบูรณ์

```dart
import 'package:flutter/material.dart';

class DialogsBottomSheetsExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialogs & Bottom Sheets'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ElevatedButton(
            onPressed: () => _showAlertDialog(context),
            child: Text('แสดง Alert Dialog'),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => _showSimpleDialog(context),
            child: Text('แสดง Simple Dialog'),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => _showCustomDialog(context),
            child: Text('แสดง Custom Dialog'),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => _showModalBottomSheet(context),
            child: Text('แสดง Modal Bottom Sheet'),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => _showSnackBar(context),
            child: Text('แสดง SnackBar'),
          ),
        ],
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('ยืนยัน'),
        content: Text('คุณต้องการออกจากระบบใช่หรือไม่?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('ยกเลิก'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _showSnackBar(context);
            },
            child: Text('ออกจากระบบ'),
          ),
        ],
      ),
    );
  }

  void _showSimpleDialog(BuildContext context) async {
    final color = await showDialog<String>(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text('เลือกสีธีม'),
        children: [
          SimpleDialogOption(
            child: Row(
              children: [
                Icon(Icons.circle, color: Colors.red),
                SizedBox(width: 8),
                Text('สีแดง'),
              ],
            ),
            onPressed: () => Navigator.pop(context, 'red'),
          ),
          SimpleDialogOption(
            child: Row(
              children: [
                Icon(Icons.circle, color: Colors.blue),
                SizedBox(width: 8),
                Text('สีน้ำเงิน'),
              ],
            ),
            onPressed: () => Navigator.pop(context, 'blue'),
          ),
          SimpleDialogOption(
            child: Row(
              children: [
                Icon(Icons.circle, color: Colors.green),
                SizedBox(width: 8),
                Text('สีเขียว'),
              ],
            ),
            onPressed: () => Navigator.pop(context, 'green'),
          ),
        ],
      ),
    );

    if (color != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('เลือกสี: $color')),
      );
    }
  }

  void _showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 64),
              SizedBox(height: 16),
              Text(
                'สำเร็จ!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('บันทึกข้อมูลเรียบร้อยแล้ว'),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('ตกลง'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text('แชร์'),
              onTap: () {
                Navigator.pop(context);
                _showSnackBar(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.link),
              title: Text('คัดลอกลิงก์'),
              onTap: () {
                Navigator.pop(context);
                _showSnackBar(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.download),
              title: Text('ดาวน์โหลด'),
              onTap: () {
                Navigator.pop(context);
                _showSnackBar(context);
              },
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('การดำเนินการสำเร็จ'),
        action: SnackBarAction(
          label: 'เลิกทำ',
          onPressed: () {},
        ),
      ),
    );
  }
}
```

## 📝 แบบฝึกหัด

1. สร้าง confirmation dialog สำหรับการลบข้อมูล
2. สร้าง bottom sheet สำหรับเลือกตัวกรอง
3. สร้าง loading dialog
4. เพิ่ม custom dialog ที่มีฟอร์ม
5. สร้าง draggable bottom sheet

## 🔗 Resources

- [Dialogs](https://api.flutter.dev/flutter/material/showDialog.html)
- [Bottom Sheets](https://api.flutter.dev/flutter/material/showModalBottomSheet.html)
- [SnackBar](https://api.flutter.dev/flutter/material/SnackBar-class.html)
