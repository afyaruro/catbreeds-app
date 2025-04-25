import 'package:catbreeds/Domain/Entity/CatBreedEntity.dart';

abstract class ICatBreedRepository {
  Future<List<CatBreedEntity>?> getCatBreedsDio();

  Future<List<CatBreedEntity>?> getCatBreedsForNameDio(String name);

  Future<List<CatBreedEntity>?> getCatBreedsHive();

  Future<bool> saveListCatBreedsHive(List<CatBreedEntity> catBreeds);

  Future<String?> getImageCatBreedDio(String idImageCat);
}
