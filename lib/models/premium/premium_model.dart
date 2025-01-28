class PremiumModel {
  final String packageName;
  final String description;
  final double price;
  final String currency;
  final List<String> features;
  final String duration;
  final String storeId; // Google Play veya App Store ID'si

  PremiumModel({
    required this.packageName,
    required this.description,
    required this.price,
    required this.currency,
    required this.features,
    required this.duration,
    required this.storeId,
  });

  factory PremiumModel.fromJson(Map<String, dynamic> json) {
    return PremiumModel(
      packageName: json['packageName'],
      description: json['description'],
      price: json['price'].toDouble(),
      currency: json['currency'],
      features: List<String>.from(json['features']),
      duration: json['duration'],
      storeId: json['storeId'],
    );
  }
}
