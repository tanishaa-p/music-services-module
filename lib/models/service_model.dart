class ServiceModel {
  final String id;
  final String title;
  final String description;
  final String iconName;

  ServiceModel({
    required this.id,
    required this.title,
    required this.description,
    required this.iconName,
  });

  factory ServiceModel.fromFirestore(Map<String, dynamic> data, String id) {
    return ServiceModel(
      id: id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      iconName: data['iconName'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'description': description,
      'iconName': iconName,
    };
  }
}
