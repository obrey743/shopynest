class User {
  final String id;
  final String name;
  final String email;
  final String profileImage;
  final double rating;
  final int itemsSold;
  final int itemsBought;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.profileImage,
    required this.rating,
    this.itemsSold = 0,
    this.itemsBought = 0,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      profileImage: json['profileImage'],
      rating: json['rating'].toDouble(),
      itemsSold: json['itemsSold'] ?? 0,
      itemsBought: json['itemsBought'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'profileImage': profileImage,
      'rating': rating,
      'itemsSold': itemsSold,
      'itemsBought': itemsBought,
    };
  }
}
