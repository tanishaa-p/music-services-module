class NavItemModel {
  final String label;
  final String icon;

  NavItemModel({
    required this.label,
    required this.icon,
  });

  factory NavItemModel.fromFirestore(Map<String, dynamic> data) {
    return NavItemModel(
      label: data['label'] ?? '',
      icon: data['icon'] ?? '',
    );
  }
}
