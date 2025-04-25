// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CatBreedStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CatBreedStore on _CatBreedStore, Store {
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

  @override
  String toString() {
    return '''
catBreeds: ${catBreeds}
    ''';
  }
}
