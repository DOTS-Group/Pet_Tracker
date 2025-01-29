class MarketModel {
  final String productId;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;
  final List<String> petTypes;
  final String clinicId;
  final double rating;
  final int stock;
  final bool isDiscount;
  final double? discountPrice;

  MarketModel({
    required this.productId,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
    required this.petTypes,
    required this.clinicId,
    required this.rating,
    required this.stock,
    required this.isDiscount,
    this.discountPrice,
  });
}

enum SortType { priceAsc, priceDesc, ratingDesc, newest }

enum ProductCategory { all, food, toys, health, accessories, care }

enum PetType { all, dog, cat, bird, fish, other }
