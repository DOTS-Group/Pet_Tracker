class VaccineDataModel {
  final String name;
  final String description;
  final String date;
  final int daysLeft;

  VaccineDataModel({
    required this.name,
    required this.description,
    required this.date,
    required this.daysLeft,
  });

  factory VaccineDataModel.fromJson(Map<String, dynamic> json) {
    return VaccineDataModel(
      name: json['name'] as String,
      description: json['description'] as String,
      date: json['date'] as String,
      daysLeft: json['daysLeft'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'date': date,
      'daysLeft': daysLeft,
    };
  }
}
