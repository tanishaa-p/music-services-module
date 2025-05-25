import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:music_services_module_assignment/models/bottom_navBar_model.dart';

Future<List<NavItemModel>> fetchNavItems() async {
  final navSnapshot = await FirebaseFirestore.instance
      .collection('bottom_nav')
      .orderBy('order')
      .get();

  return navSnapshot.docs
      .map((doc) => NavItemModel.fromFirestore(doc.data()))
      .toList();
}
