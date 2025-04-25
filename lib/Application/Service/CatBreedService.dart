import 'package:catbreeds/Domain/Entity/CatBreedEntity.dart';
import 'package:catbreeds/Domain/Ports/ICatBreedRepository.dart';

class CatBreedService {
  final ICatBreedRepository repository;

  CatBreedService({required this.repository});

  Future<List<CatBreedEntity>?> getCatBreedDio() async {
    var resp = await repository.getCatBreedsDio();
    if (resp != null) {
      for (var catBreed in resp) {
        if (catBreed.referenceImageId != null) {
          var respImage = await repository.getImageCatBreedDio(catBreed.id);
          if (respImage != null) {
            catBreed.image = respImage;
          } else {
            catBreed.image = null;
          }
        }
      }
    }
    return resp;
  }

  Future<bool> saveCatBreedHive(List<CatBreedEntity> catBreeds) async {
    return await repository.saveListCatBreedsHive(catBreeds);
  }

  Future<List<CatBreedEntity>?> getCatBreedHive() async {
    return await repository.getCatBreedsHive();
  }
}
