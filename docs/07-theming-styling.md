# บทที่ 7: Theming and Styling

## 🎯 จุดประสงค์
เรียนรู้การกำหนดธีมและสไตล์ให้แอพพลิเคชัน

## 📚 เนื้อหาที่จะเรียน

### 1. ThemeData
กำหนดธีมหลัก

```dart
MaterialApp(
  theme: ThemeData(
    primarySwatch: Colors.blue,
    useMaterial3: true,
    
    // Color Scheme
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: Brightness.light,
    ),
    
    // Typography
    textTheme: TextTheme(
      displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(fontSize: 16),
    ),
    
    // AppBar Theme
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      elevation: 2,
    ),
  ),
)
```

### 2. Dark Mode
โหมดมืด

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.system, // หรือ .light, .dark
    );
  }
}
```

### 3. Custom Theme

```dart
ThemeData customTheme = ThemeData(
  useMaterial3: true,
  
  colorScheme: ColorScheme.fromSeed(
    seedColor: Color(0xFF6750A4),
    brightness: Brightness.light,
  ),
  
  textTheme: TextTheme(
    displayLarge: TextStyle(
      fontSize: 57,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.25,
    ),
    titleLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w400,
      letterSpacing: 0,
    ),
  ),
  
  cardTheme: CardTheme(
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  ),
  
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
);
```

## 💡 ตัวอย่างแอพสมบูรณ์

```dart
import 'package:flutter/material.dart';

class ThemingExample extends StatefulWidget {
  @override
  _ThemingExampleState createState() => _ThemingExampleState();
}

class _ThemingExampleState extends State<ThemingExample> {
  ThemeMode _themeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _lightTheme,
      darkTheme: _darkTheme,
      themeMode: _themeMode,
      home: HomePage(
        onThemeChanged: (mode) {
          setState(() {
            _themeMode = mode;
          });
        },
      ),
    );
  }

  ThemeData get _lightTheme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
      );

  ThemeData get _darkTheme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.dark,
        ),
      );
}

class HomePage extends StatelessWidget {
  final Function(ThemeMode) onThemeChanged;

  HomePage({required this.onThemeChanged});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Theming & Styling'),
        actions: [
          PopupMenuButton<ThemeMode>(
            icon: Icon(Icons.palette),
            onSelected: onThemeChanged,
            itemBuilder: (context) => [
              PopupMenuItem(
                value: ThemeMode.light,
                child: Text('โหมดสว่าง'),
              ),
              PopupMenuItem(
                value: ThemeMode.dark,
                child: Text('โหมดมืด'),
              ),
              PopupMenuItem(
                value: ThemeMode.system,
                child: Text('ตามระบบ'),
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            'Colors',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(height: 8),
          _buildColorRow(context),
          
          SizedBox(height: 24),
          
          Text(
            'Typography',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(height: 8),
          _buildTypographyExamples(context),
          
          SizedBox(height: 24),
          
          Text(
            'Components',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(height: 8),
          _buildComponentExamples(context),
        ],
      ),
    );
  }

  Widget _buildColorRow(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        _colorBox('Primary', colors.primary),
        _colorBox('Secondary', colors.secondary),
        _colorBox('Tertiary', colors.tertiary),
        _colorBox('Error', colors.error),
      ],
    );
  }

  Widget _colorBox(String label, Color color) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(height: 4),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildTypographyExamples(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Display Large', style: Theme.of(context).textTheme.displayLarge),
        Text('Headline Large', style: Theme.of(context).textTheme.headlineLarge),
        Text('Title Large', style: Theme.of(context).textTheme.titleLarge),
        Text('Body Large', style: Theme.of(context).textTheme.bodyLarge),
        Text('Body Medium', style: Theme.of(context).textTheme.bodyMedium),
        Text('Label Large', style: Theme.of(context).textTheme.labelLarge),
      ],
    );
  }

  Widget _buildComponentExamples(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Text('Elevated Button'),
        ),
        SizedBox(height: 8),
        FilledButton(
          onPressed: () {},
          child: Text('Filled Button'),
        ),
        SizedBox(height: 8),
        OutlinedButton(
          onPressed: () {},
          child: Text('Outlined Button'),
        ),
        SizedBox(height: 8),
        Card(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Text('This is a Card'),
          ),
        ),
      ],
    );
  }
}
```

## 📝 แบบฝึกหัด

1. สร้างธีมที่มีสีเฉพาะของแบรนด์
2. เพิ่มตัวเลือกสลับระหว่างหลายธีม
3. สร้าง custom font theme
4. ทำ dark mode toggle
5. สร้าง theme preset ต่างๆ

## 🔗 Resources

- [Material 3 Theming](https://m3.material.io/styles)
- [ThemeData](https://api.flutter.dev/flutter/material/ThemeData-class.html)
- [Color Schemes](https://m3.material.io/styles/color/overview)
