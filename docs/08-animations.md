# บทที่ 8: Animations and Transitions

## 🎯 จุดประสงค์
เรียนรู้การสร้างแอนิเมชันและ transitions

## 📚 เนื้อหาที่จะเรียน

### 1. AnimatedContainer
Container ที่มีแอนิเมชัน

```dart
class AnimatedContainerExample extends StatefulWidget {
  @override
  _AnimatedContainerExampleState createState() => _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  double _width = 100;
  double _height = 100;
  Color _color = Colors.blue;

  void _animate() {
    setState(() {
      _width = _width == 100 ? 200 : 100;
      _height = _height == 100 ? 200 : 100;
      _color = _color == Colors.blue ? Colors.red : Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          width: _width,
          height: _height,
          color: _color,
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
        ),
        ElevatedButton(
          onPressed: _animate,
          child: Text('Animate'),
        ),
      ],
    );
  }
}
```

### 2. Hero Animation
แอนิเมชันระหว่างหน้า

```dart
// หน้าแรก
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'hero-image',
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondPage()),
          );
        },
        child: Image.asset('assets/image.png', width: 100),
      ),
    );
  }
}

// หน้าที่สอง
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'hero-image',
      child: Image.asset('assets/image.png'),
    );
  }
}
```

### 3. AnimatedOpacity
ความโปร่งใสที่มีแอนิเมชัน

```dart
AnimatedOpacity(
  opacity: _visible ? 1.0 : 0.0,
  duration: Duration(milliseconds: 500),
  child: Container(
    width: 200,
    height: 200,
    color: Colors.blue,
  ),
)
```

## 💡 ตัวอย่างแอพสมบูรณ์

```dart
import 'package:flutter/material.dart';

class AnimationsExample extends StatefulWidget {
  @override
  _AnimationsExampleState createState() => _AnimationsExampleState();
}

class _AnimationsExampleState extends State<AnimationsExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  
  bool _expanded = false;
  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animations')),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // AnimatedContainer
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: _expanded ? 300 : 100,
            height: _expanded ? 300 : 100,
            color: _expanded ? Colors.blue : Colors.red,
            curve: Curves.easeInOut,
            child: Center(
              child: Text(
                _expanded ? 'Expanded' : 'Small',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() => _expanded = !_expanded);
            },
            child: Text('Toggle Size'),
          ),
          
          SizedBox(height: 20),
          
          // AnimatedOpacity
          AnimatedOpacity(
            opacity: _opacity,
            duration: Duration(milliseconds: 500),
            child: Container(
              width: 200,
              height: 100,
              color: Colors.green,
              child: Center(child: Text('Fade Me')),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() => _opacity = _opacity == 1.0 ? 0.0 : 1.0);
            },
            child: Text('Toggle Opacity'),
          ),
          
          SizedBox(height: 20),
          
          // Rotation Animation
          RotationTransition(
            turns: _animation,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.purple,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_controller.isAnimating) {
                _controller.stop();
              } else {
                _controller.repeat();
              }
            },
            child: Text('Rotate'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
```

## 📝 แบบฝึกหัด

1. สร้าง loading animation
2. ทำ page transition animation
3. สร้าง custom animation controller
4. เพิ่ม stagger animation
5. ทำ physics-based animation

## 🔗 Resources

- [Animations in Flutter](https://docs.flutter.dev/development/ui/animations)
- [Animation Class](https://api.flutter.dev/flutter/animation/Animation-class.html)
