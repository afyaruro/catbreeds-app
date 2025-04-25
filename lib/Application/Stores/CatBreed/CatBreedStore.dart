import 'package:catbreeds/Application/Service/CatBreedService.dart';
import 'package:catbreeds/Domain/Entity/CatBreedEntity.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'CatBreedStore.g.dart';

class CatBreedStore = _CatBreedStore with _$CatBreedStore;

abstract class _CatBreedStore with Store {
  @observable
  List<CatBreedEntity> catBreeds = [];

  final service = GetIt.instance<CatBreedService>();

  @action
  Future getCatBreed() async {
    var resp = await service.getCatBreedHive();
print("desde Aca se si guardo o no en local");
    for (var e in resp!) {
      print("Imagen: ${e.image}");
    }

    if (resp != null) {
      catBreeds = resp;
    }
  }
}
