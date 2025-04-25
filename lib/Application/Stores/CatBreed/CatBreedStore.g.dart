// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CatBreedStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CatBreedStore on _CatBreedStore, Store {
  Computed<List<CatBreedEntity>>? _$filteredCatBreedsComputed;

  @override
  List<CatBreedEntity> get filteredCatBreeds => (_$filteredCatBreedsComputed ??=
          Computed<List<CatBreedEntity>>(() => super.filteredCatBreeds,
              name: '_CatBreedStore.filteredCatBreeds'))
      .value;

  late final _$catBreedsAtom =
      Atom(name: '_CatBreedStore.catBreeds', context: context);

  @override
  List<CatBreedEntity> get catBreeds {
    _$catBreedsAtom.reportRead();
    return super.catBreeds;
  }

  @override
  set catBreeds(List<CatBreedEntity> value) {
    _$catBreedsAtom.reportWrite(value, super.catBreeds, () {
      super.catBreeds = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_CatBreedStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$searchTermAtom =
      Atom(name: '_CatBreedStore.searchTerm', context: context);

  @override
  String get searchTerm {
    _$searchTermAtom.reportRead();
    return super.searchTerm;
  }

  @override
  set searchTerm(String value) {
    _$searchTermAtom.reportWrite(value, super.searchTerm, () {
      super.searchTerm = value;
    });
  }

  late final _$getCatBreedAsyncAction =
      AsyncAction('_CatBreedStore.getCatBreed', context: context);

  @override
  Future<dynamic> getCatBreed() {
    return _$getCatBreedAsyncAction.run(() => super.getCatBreed());
  }

  late final _$_CatBreedStoreActionController =
      ActionController(name: '_CatBreedStore', context: context);

  @override
  void setSearchTerm(String value) {
    final _$actionInfo = _$_CatBreedStoreActionController.startAction(
        name: '_CatBreedStore.setSearchTerm');
    try {
      return super.setSearchTerm(value);
    } finally {
      _$_CatBreedStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
catBreeds: ${catBreeds},
isLoading: ${isLoading},
searchTerm: ${searchTerm},
filteredCatBreeds: ${filteredCatBreeds}
    ''';
  }
}
