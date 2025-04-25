import 'package:catbreeds/Application/Service/CatBreedService.dart';
import 'package:get_it/get_it.dart';

class PersistenceService {
  final di = GetIt.instance;

  Future<void> initService() async {
    di.registerLazySingleton(() => CatBreedService(repository: di()));
  }
}