import 'package:catbreeds/Domain/Ports/ICatBreedRepository.dart';
import 'package:catbreeds/Infrastructure/Adapters/CatBreedRepository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';

class PersistenceRepository {
  final di = GetIt.instance;

  Future<void> initRepository() async {
    Dio dio = Dio();
    Box box = await Hive.openBox('catbreed');

    di.registerLazySingleton<ICatBreedRepository>(() => CatBreedRepository(dio: dio, box: box));

  }
}