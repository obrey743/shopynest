import 'package:flutter/material.dart';
import '../../models/clothing_item.dart';
import 'item_detail_screen.dart';

class MarketplaceScreen extends StatefulWidget {
  @override
  _MarketplaceScreenState createState() => _MarketplaceScreenState();
}

class _MarketplaceScreenState extends State<MarketplaceScreen> {
  // Sample data
  final List<ClothingItem> items = [
    ClothingItem(
      id: '1',
      title: 'Vintage Denim Jacket',
      description: 'Classic blue denim jacket in excellent condition',
      price: 45.00,
      category: 'Jackets',
      size: 'M',
      condition: 'Like New',
      imageUrl: 'https://via.placeholder.com/300x300/4285F4/FFFFFF?text=Denim+Jacket',
      sellerId: 'user1',
      sellerName: 'Sarah Johnson',
      postedDate: DateTime.now().subtract(Duration(days: 2)),
    ),
    ClothingItem(
      id: '2',
      title: 'Floral Summer Dress',
      description: 'Beautiful floral print dress, perfect for summer',
      price: 32.00,
      category: 'Dresses',
      size: 'S',
      condition: 'Good',
      imageUrl: 'https://via.placeholder.com/300x300/E91E63/FFFFFF?text=Summer+Dress',
      sellerId: 'user2',
      sellerName: 'Emma Wilson',
      postedDate: DateTime.now().subtract(Duration(days: 1)),
    ),
    ClothingItem(
      id: '3',
      title: 'Designer Sneakers',
      description: 'Limited edition sneakers, barely worn',
      price: 120.00,
      category: 'Shoes',
      size: '9',
      condition: 'Excellent',
      imageUrl: 'https://via.placeholder.com/300x300/FF9800/FFFFFF?text=Sneakers',
      sellerId: 'user3',
      sellerName: 'Mike Chen',
      postedDate: DateTime.now().subtract(Duration(hours: 5)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShopNest'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          _buildCategoriesSection(),
          _buildItemsGrid(),
        ],
      ),
    );
  }

  Widget _buildCategoriesSection() {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(16),
        children: [
          _buildCategoryCard('All', Icons.apps),
          _buildCategoryCard('Dresses', Icons.checkroom),
          _buildCategoryCard('Tops', Icons.sentiment_satisfied_alt),
          _buildCategoryCard('Bottoms', Icons.dry_cleaning),
          _buildCategoryCard('Shoes', Icons.local_mall),
          _buildCategoryCard('Accessories', Icons.watch),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(String title, IconData icon) {
    return Container(
      width: 80,
      margin: EdgeInsets.only(right: 12),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(icon, color: Colors.blue, size: 30),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildItemsGrid() {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return _buildItemCard(items[index]);
        },
      ),
    );
  }

  Widget _buildItemCard(ClothingItem item) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ItemDetailScreen(item: item),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              _buildItemImage(),
            void _clearForm() {
    _titleController.clear();
    _descriptionController.clear();
    _priceController.clear();
    setState(() {
    selectedCategory = 'Tops';
    selectedSize = 'S';
    selectedCondition = 'Like New';
    });
    }
    }
