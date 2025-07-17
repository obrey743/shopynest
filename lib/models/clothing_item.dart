class ClothingItem {
  final String id;
  final String title;
  final String description;
  final double price;
  final String category;
  final String size;
  final String condition;
  final String imageUrl;
  final String sellerId;
  final String sellerName;
  final DateTime postedDate;

  ClothingItem({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.size,
    required this.condition,
    required this.imageUrl,
    required this.sellerId,
    required this.sellerName,
    required this.postedDate,
  });

  factory ClothingItem.fromJson(Map<String, dynamic> json) {
    return ClothingItem(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      category: json['category'],
      size: json['size'],
      condition: json['condition'],
      imageUrl: json['imageUrl'],
      sellerId: json['sellerId'],
      sellerName: json['sellerName'],
      postedDate: DateTime.parse(json['postedDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'category': category,
      'size': size,
      'condition': condition,
      'imageUrl': imageUrl,
      'sellerId': sellerId,
      'sellerName': sellerName,
      'postedDate': postedDate.toIso8601String(),
    };
  }
}
