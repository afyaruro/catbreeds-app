import 'package:catbreeds/Application/Stores/CatBreed/CatBreedStore.dart';
import 'package:get_it/get_it.dart';

class PersistenceStore {
  final di = GetIt.instance;

  Future<void> initStore() async {
    di.registerLazySingleton(() => CatBreedStore());
  }
}
