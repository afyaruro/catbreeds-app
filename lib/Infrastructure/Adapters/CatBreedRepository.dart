import 'package:catbreeds/Domain/Entity/CatBreedEntity.dart';
import 'package:catbreeds/Domain/Ports/ICatBreedRepository.dart';
import 'package:catbreeds/Infrastructure/Config/env/env.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

class CatBreedRepository implements ICatBreedRepository {
  Dio dio;
  Box box;

  CatBreedRepository({required this.dio, required this.box});

  @override
  Future<List<CatBreedEntity>?> getCatBreedsDio() async {
    try {
      final response = await dio.get(
        "$URLBASE/v1/breeds",
        options: Options(
          headers: {
            "accept": "*/*",
            "Content-Type": "application/json",
            "x-api-key": X_API_KEY,
          },
          validateStatus: (status) => status! <= 500,
        ),
      );

      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        List<CatBreedEntity> catBreeds = CatBreedEntity.tolistCatBreeds(
          response.data,
        );

        return catBreeds;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Future<String?> getImageCatBreedDio(String idImageCat) async {
    try {
      final response = await dio.get(
        "$URLBASE/v1/images/search?breed_ids=$idImageCat",
        options: Options(
          headers: {
            "accept": "*/*",
            "Content-Type": "application/json",
            "x-api-key": X_API_KEY,
          },
          validateStatus: (status) => status! <= 500,
        ),
      );

      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        final List<dynamic> result = response.data;

        if (result.isNotEmpty) {
          final String url = result[0]['url'];
          return url;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<CatBreedEntity>?> getCatBreedsForNameDio(String name) async {
    try {
      final response = await dio.get(
        "$URLBASE/v1/breeds/search?q=$name",
        options: Options(
          headers: {
            "accept": "*/*",
            "Content-Type": "application/json",
            "x-api-key": X_API_KEY,
          },
          validateStatus: (status) => status! <= 500,
        ),
      );

      final Map<String, dynamic> result = response.data;

      if (response.statusCode! >= 200 || response.statusCode! <= 299) {
        List<CatBreedEntity> catBreeds = CatBreedEntity.tolistCatBreeds(
          result['data'],
        );

        return catBreeds;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<CatBreedEntity>?> getCatBreedsHive() async {
    try {
      List<CatBreedEntity> catBreeds = CatBreedEntity.tolistCatBreedsHive(
        box.values.toList(),
      );

      for (var e in catBreeds) {
        print("image to hive: ${e.image}");
      }

      return catBreeds;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<bool> saveListCatBreedsHive(List<CatBreedEntity> catBreeds) async {
    try {
      for (var catBreed in catBreeds) {
        await box.put(catBreed.id, catBreed.toJson());
      }

      return true;
    } catch (e) {
      return false;
    }
  }
}
