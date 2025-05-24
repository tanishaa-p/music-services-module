import 'package:get_it/get_it.dart';
import '../repositories/service_repository.dart';
import '../view_models/home_view_model.dart';

final locator = GetIt.instance;

void setupLocator() {
  // Register repositories
  locator.registerLazySingleton<ServiceRepository>(() => ServiceRepository());

  // Register view models
  locator.registerFactory<HomeViewModel>(() => HomeViewModel());
}
