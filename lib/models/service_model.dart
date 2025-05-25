class ServiceModel {
  final String id;
  final String title;
  final String description;
  final String iconAsset;
  final String backgroundAsset;

  ServiceModel({
    required this.id,
    required this.title,
    required this.description,
    required this.iconAsset,
    required this.backgroundAsset,
  });

  factory ServiceModel.fromFirestore(Map<String, dynamic> data, String id) {
    return ServiceModel(
      id: id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      iconAsset: data['iconAsset'] ?? '',
      backgroundAsset: data['backgroundAsset'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'description': description,
      'iconAsset': iconAsset,
      'backgroundAsset': backgroundAsset,
    };
  }
}
