import 'package:catbreeds/Application/Service/CatBreedService.dart';
import 'package:catbreeds/Domain/Entity/CatBreedEntity.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'CatBreedStore.g.dart';

class CatBreedStore = _CatBreedStore with _$CatBreedStore;

abstract class _CatBreedStore with Store {
  @observable
  List<CatBreedEntity> catBreeds = [];

  @observable
  bool isLoading = false;

  final service = GetIt.instance<CatBreedService>();

  @observable
  String searchTerm = '';

  @computed
  List<CatBreedEntity> get filteredCatBreeds {
    if (searchTerm.isEmpty) return catBreeds;
    return catBreeds
        .where(
          (breed) =>
              breed.name.toLowerCase().contains(searchTerm.toLowerCase()),
        )
        .toList();
  }

  @action
  void setSearchTerm(String value) {
    searchTerm = value;
  }

  @action
  Future getCatBreed() async {
    var resp = await service.getCatBreedHive();
    isLoading = true;

    if (resp != null) {
      catBreeds = resp;
    }
  }
}
