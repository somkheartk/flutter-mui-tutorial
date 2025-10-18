# บทที่ 2: Form Controls

## 🎯 จุดประสงค์
เรียนรู้การใช้งาน Form Controls และการจัดการฟอร์มใน Flutter

## 📚 Form Controls ที่จะเรียน

### 1. TextField
ช่องกรอกข้อความ

```dart
TextField(
  decoration: InputDecoration(
    labelText: 'ชื่อผู้ใช้',
    hintText: 'กรอกชื่อผู้ใช้',
    prefixIcon: Icon(Icons.person),
    border: OutlineInputBorder(),
  ),
  onChanged: (value) {
    print('Text: $value');
  },
)
```

### 2. TextFormField (สำหรับใช้กับ Form)

```dart
TextFormField(
  decoration: InputDecoration(
    labelText: 'อีเมล',
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
)
```

### 3. Checkbox
ช่องทำเครื่องหมาย

```dart
bool isChecked = false;

Checkbox(
  value: isChecked,
  onChanged: (bool? value) {
    setState(() {
      isChecked = value ?? false;
    });
  },
)

// หรือใช้ CheckboxListTile
CheckboxListTile(
  title: Text('ยอมรับข้อตกลงและเงื่อนไข'),
  value: isChecked,
  onChanged: (bool? value) {
    setState(() {
      isChecked = value ?? false;
    });
  },
)
```

### 4. Radio
ปุ่มเลือกแบบเดียว

```dart
enum Gender { male, female, other }
Gender? selectedGender;

Column(
  children: [
    RadioListTile<Gender>(
      title: Text('ชาย'),
      value: Gender.male,
      groupValue: selectedGender,
      onChanged: (Gender? value) {
        setState(() {
          selectedGender = value;
        });
      },
    ),
    RadioListTile<Gender>(
      title: Text('หญิง'),
      value: Gender.female,
      groupValue: selectedGender,
      onChanged: (Gender? value) {
        setState(() {
          selectedGender = value;
        });
      },
    ),
  ],
)
```

### 5. Switch
สวิตช์เปิด/ปิด

```dart
bool isSwitched = false;

Switch(
  value: isSwitched,
  onChanged: (bool value) {
    setState(() {
      isSwitched = value;
    });
  },
)

// หรือใช้ SwitchListTile
SwitchListTile(
  title: Text('เปิดการแจ้งเตือน'),
  subtitle: Text('รับการแจ้งเตือนแบบ Push'),
  value: isSwitched,
  onChanged: (bool value) {
    setState(() {
      isSwitched = value;
    });
  },
)
```

### 6. Slider
แถบเลื่อนเลือกค่า

```dart
double sliderValue = 50;

Slider(
  value: sliderValue,
  min: 0,
  max: 100,
  divisions: 10,
  label: sliderValue.round().toString(),
  onChanged: (double value) {
    setState(() {
      sliderValue = value;
    });
  },
)
```

### 7. DropdownButton
เมนูแบบเลื่อนลง

```dart
String? selectedCity;
List<String> cities = ['กรุงเทพฯ', 'เชียงใหม่', 'ภูเก็ต', 'พัทยา'];

DropdownButton<String>(
  value: selectedCity,
  hint: Text('เลือกเมือง'),
  isExpanded: true,
  items: cities.map((String city) {
    return DropdownMenuItem<String>(
      value: city,
      child: Text(city),
    );
  }).toList(),
  onChanged: (String? value) {
    setState(() {
      selectedCity = value;
    });
  },
)
```

### 8. DatePicker
เลือกวันที่

```dart
DateTime? selectedDate;

Future<void> _selectDate(BuildContext context) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: selectedDate ?? DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime(2100),
  );
  if (picked != null && picked != selectedDate) {
    setState(() {
      selectedDate = picked;
    });
  }
}

// ใช้งาน
ElevatedButton(
  onPressed: () => _selectDate(context),
  child: Text(
    selectedDate != null
        ? 'วันที่: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
        : 'เลือกวันที่',
  ),
)
```

### 9. TimePicker
เลือกเวลา

```dart
TimeOfDay? selectedTime;

Future<void> _selectTime(BuildContext context) async {
  final TimeOfDay? picked = await showTimePicker(
    context: context,
    initialTime: selectedTime ?? TimeOfDay.now(),
  );
  if (picked != null && picked != selectedTime) {
    setState(() {
      selectedTime = picked;
    });
  }
}
```

## 💡 ตัวอย่าง Form สมบูรณ์

```dart
import 'package:flutter/material.dart';

class FormControlsPage extends StatefulWidget {
  @override
  _FormControlsPageState createState() => _FormControlsPageState();
}

class _FormControlsPageState extends State<FormControlsPage> {
  final _formKey = GlobalKey<FormState>();
  
  // Controllers
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  
  // State variables
  bool _agreeToTerms = false;
  String? _selectedGender;
  bool _receiveNotifications = true;
  double _age = 25;
  String? _selectedCity;
  DateTime? _birthDate;
  
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (!_agreeToTerms) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('กรุณายอมรับข้อตกลงและเงื่อนไข')),
        );
        return;
      }
      
      // Process form data
      print('Name: ${_nameController.text}');
      print('Email: ${_emailController.text}');
      print('Gender: $_selectedGender');
      print('Age: $_age');
      print('City: $_selectedCity');
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('ส่งข้อมูลสำเร็จ!')),
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Controls'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            // Name field
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
            
            // Email field
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
            
            // Password field
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'รหัสผ่าน',
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'กรุณากรอกรหัสผ่าน';
                }
                if (value.length < 6) {
                  return 'รหัสผ่านต้องมีอย่างน้อย 6 ตัวอักษร';
                }
                return null;
              },
            ),
            
            SizedBox(height: 24),
            
            // Gender radio buttons
            Text('เพศ', style: Theme.of(context).textTheme.titleMedium),
            RadioListTile<String>(
              title: Text('ชาย'),
              value: 'male',
              groupValue: _selectedGender,
              onChanged: (value) {
                setState(() => _selectedGender = value);
              },
            ),
            RadioListTile<String>(
              title: Text('หญิง'),
              value: 'female',
              groupValue: _selectedGender,
              onChanged: (value) {
                setState(() => _selectedGender = value);
              },
            ),
            
            SizedBox(height: 16),
            
            // Age slider
            Text('อายุ: ${_age.round()} ปี', 
                style: Theme.of(context).textTheme.titleMedium),
            Slider(
              value: _age,
              min: 18,
              max: 100,
              divisions: 82,
              label: _age.round().toString(),
              onChanged: (value) {
                setState(() => _age = value);
              },
            ),
            
            SizedBox(height: 16),
            
            // City dropdown
            DropdownButtonFormField<String>(
              value: _selectedCity,
              decoration: InputDecoration(
                labelText: 'เมือง',
                border: OutlineInputBorder(),
              ),
              items: ['กรุงเทพฯ', 'เชียงใหม่', 'ภูเก็ต', 'พัทยา']
                  .map((city) => DropdownMenuItem(
                        value: city,
                        child: Text(city),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() => _selectedCity = value);
              },
            ),
            
            SizedBox(height: 16),
            
            // Switches
            SwitchListTile(
              title: Text('รับการแจ้งเตือน'),
              value: _receiveNotifications,
              onChanged: (value) {
                setState(() => _receiveNotifications = value);
              },
            ),
            
            // Checkbox
            CheckboxListTile(
              title: Text('ยอมรับข้อตกลงและเงื่อนไข'),
              value: _agreeToTerms,
              onChanged: (value) {
                setState(() => _agreeToTerms = value ?? false);
              },
            ),
            
            SizedBox(height: 24),
            
            // Submit button
            ElevatedButton(
              onPressed: _submitForm,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text('ส่งข้อมูล', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
```

## 🎨 การตกแต่ง Input Fields

```dart
// Rounded input
TextFormField(
  decoration: InputDecoration(
    labelText: 'Username',
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    filled: true,
    fillColor: Colors.grey[200],
  ),
)

// With helper text
TextFormField(
  decoration: InputDecoration(
    labelText: 'Email',
    helperText: 'We will never share your email',
    border: OutlineInputBorder(),
  ),
)

// With error text
TextFormField(
  decoration: InputDecoration(
    labelText: 'Password',
    errorText: 'Password is too short',
    border: OutlineInputBorder(),
  ),
)
```

## 📝 แบบฝึกหัด

1. สร้างฟอร์มลงทะเบียนที่มี validation
2. สร้างฟอร์มตั้งค่าแอพ ที่มี switches และ sliders
3. สร้างฟอร์มค้นหาที่มี dropdown และ date picker
4. เพิ่ม password visibility toggle
5. สร้าง multi-step form

## 🔗 Resources

- [Forms in Flutter](https://docs.flutter.dev/cookbook/forms)
- [Input Validation](https://docs.flutter.dev/cookbook/forms/validation)
- [Text Input](https://api.flutter.dev/flutter/material/TextField-class.html)
