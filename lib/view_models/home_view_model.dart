import 'package:flutter/material.dart';
import 'package:music_services_module_assignment/views/service_detail_screen.dart';
import '../models/service_model.dart';
import '../repositories/service_repository.dart';
import '../services/locator.dart';

class HomeViewModel extends ChangeNotifier {
  final ServiceRepository _repository = locator<ServiceRepository>();

  List<ServiceModel> _services = [];
  bool _isLoading = false;
  String? _error;

  List<ServiceModel> get services => _services;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadServices() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _services = await _repository.getServices();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void navigateToServiceDetail(BuildContext context, ServiceModel service) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ServiceDetailScreen(service: service),
      ),
    );
  }
}
