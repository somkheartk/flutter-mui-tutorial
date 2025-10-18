# บทที่ 4: Lists and GridView

## 🎯 จุดประสงค์
เรียนรู้การแสดงข้อมูลในรูปแบบรายการและตาราง

## 📚 Components ที่จะเรียน

### 1. ListView
รายการแนวตั้ง

```dart
// ListView แบบธรรมดา
ListView(
  children: [
    ListTile(title: Text('Item 1')),
    ListTile(title: Text('Item 2')),
    ListTile(title: Text('Item 3')),
  ],
)

// ListView.builder (แนะนำสำหรับข้อมูลจำนวนมาก)
ListView.builder(
  itemCount: 100,
  itemBuilder: (context, index) {
    return ListTile(
      title: Text('Item ${index + 1}'),
    );
  },
)

// ListView.separated (มี divider)
ListView.separated(
  itemCount: 20,
  itemBuilder: (context, index) {
    return ListTile(title: Text('Item $index'));
  },
  separatorBuilder: (context, index) {
    return Divider();
  },
)
```

### 2. ListTile
รายการพื้นฐาน

```dart
ListTile(
  leading: CircleAvatar(
    child: Icon(Icons.person),
  ),
  title: Text('John Doe'),
  subtitle: Text('john@example.com'),
  trailing: Icon(Icons.arrow_forward_ios),
  onTap: () {
    print('Tapped');
  },
)
```

### 3. GridView
แสดงแบบตาราง

```dart
// GridView.count (กำหนดจำนวนคอลัมน์)
GridView.count(
  crossAxisCount: 2,
  children: List.generate(10, (index) {
    return Card(
      child: Center(
        child: Text('Item $index'),
      ),
    );
  }),
)

// GridView.builder
GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 3,
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
  ),
  itemCount: 50,
  itemBuilder: (context, index) {
    return Card(
      child: Center(child: Text('$index')),
    );
  },
)
```

## 💡 ตัวอย่างแอพสมบูรณ์

```dart
import 'package:flutter/material.dart';

class ListGridExample extends StatelessWidget {
  final List<Product> products = [
    Product('สินค้า 1', 'รายละเอียดสินค้า 1', 299, Icons.shopping_bag),
    Product('สินค้า 2', 'รายละเอียดสินค้า 2', 399, Icons.devices),
    Product('สินค้า 3', 'รายละเอียดสินค้า 3', 499, Icons.laptop),
    Product('สินค้า 4', 'รายละเอียดสินค้า 4', 599, Icons.phone_iphone),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Lists & GridView'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'รายการ', icon: Icon(Icons.list)),
              Tab(text: 'ตาราง', icon: Icon(Icons.grid_view)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildListView(),
            _buildGridView(),
          ],
        ),
      ),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      itemCount: products.length,
      padding: EdgeInsets.all(8),
      itemBuilder: (context, index) {
        final product = products[index];
        return Card(
          margin: EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: CircleAvatar(
              child: Icon(product.icon),
            ),
            title: Text(product.name),
            subtitle: Text(product.description),
            trailing: Text(
              '฿${product.price}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            onTap: () {
              print('Clicked: ${product.name}');
            },
          ),
        );
      },
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.75,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(product.icon, size: 64, color: Colors.blue),
              SizedBox(height: 8),
              Text(
                product.name,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                '฿${product.price}',
                style: TextStyle(fontSize: 14, color: Colors.green),
              ),
            ],
          ),
        );
      },
    );
  }
}

class Product {
  final String name;
  final String description;
  final double price;
  final IconData icon;

  Product(this.name, this.description, this.price, this.icon);
}
```

## 📝 แบบฝึกหัด

1. สร้าง contact list ที่มีรูปและข้อมูล
2. สร้าง photo gallery แบบ grid
3. เพิ่มฟีเจอร์ค้นหาในรายการ
4. สร้างรายการที่มีหมวดหมู่
5. เพิ่ม infinite scroll

## 🔗 Resources

- [ListView](https://api.flutter.dev/flutter/widgets/ListView-class.html)
- [GridView](https://api.flutter.dev/flutter/widgets/GridView-class.html)
