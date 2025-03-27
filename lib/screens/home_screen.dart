import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Product> allProducts = [
    Product(name: '군침싹 수박바 30ml', price: '2,900원', imageUrl: '', category: '전자담배 액상'),
    Product(name: '멘솔 아이스 블루 60ml', price: '4,500원', imageUrl: '', category: '전자담배 액상'),
    Product(name: '딸기 바나나 쉐이크', price: '5,200원', imageUrl: '', category: '전자담배 액상'),
    Product(name: '청포도 아이스 30ml', price: '3,900원', imageUrl: '', category: '전자담배 액상'),
    Product(name: '전자담배 배터리 A', price: '12,000원', imageUrl: '', category: '전자담배'),
    Product(name: '전자담배 케이스 블랙', price: '8,000원', imageUrl: '', category: '전자담배 케이스'),
  ];

  final List<String> categories = [
    '전체',
    '전자담배',
    '전자담배 액상',
    '전자담배 케이스',
  ];

  String selectedCategory = '전체';

  List<Product> get filteredProducts {
    if (selectedCategory == '전체') return allProducts;
    return allProducts.where((p) => p.category == selectedCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: '제품명을 입력하세요',
            border: InputBorder.none,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Colors.purple.shade50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                PopupMenuButton<String>(
                  icon: Row(
                    children: [
                      Icon(Icons.menu, color: Colors.purple),
                      SizedBox(width: 4),
                      Text('전체카테고리', style: TextStyle(color: Colors.purple)),
                    ],
                  ),
                  itemBuilder: (BuildContext context) {
                    return categories.map((String category) {
                      return PopupMenuItem<String>(
                        value: category,
                        child: Text(category),
                      );
                    }).toList();
                  },
                  onSelected: (String value) {
                    setState(() {
                      selectedCategory = value;
                    });
                  },
                ),
                TextButton(onPressed: () {}, child: Text('커뮤니티')),
                TextButton(onPressed: () {}, child: Text('인기제품')),
                TextButton(onPressed: () {}, child: Text('이벤트')),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              selectedCategory == '전체' ? '인기제품' : '$selectedCategory 상품',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return ListTile(
                  leading: Container(
                    width: 50,
                    height: 50,
                    color: Colors.grey[300],
                    child: Center(child: Icon(Icons.image)),
                  ),
                  title: Text(product.name),
                  subtitle: Text('최저가: ${product.price}', style: TextStyle(color: Colors.red)),
                  trailing: OutlinedButton(
                    onPressed: () {},
                    child: Text('구매'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Product {
  final String name;
  final String price;
  final String imageUrl;
  final String category;

  Product({required this.name, required this.price, required this.imageUrl, required this.category});
}