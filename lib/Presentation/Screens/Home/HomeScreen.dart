import 'package:catbreeds/Application/Service/CatBreedService.dart';
import 'package:catbreeds/Application/Stores/CatBreed/CatBreedStore.dart';
import 'package:catbreeds/Presentation/Screens/Home/Widgets/CardCatBreed.dart';
import 'package:catbreeds/Presentation/Screens/Home/Widgets/HomeHeader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final storeCatBreed = GetIt.instance<CatBreedStore>();
  final serviceCatBreed = GetIt.instance<CatBreedService>();

  @override
  void initState() {
    super.initState();
    cargarCats();
  }

  cargarCats() async {
    var catBreeds = await serviceCatBreed.getCatBreedDio();
    if (catBreeds != null) {
      await serviceCatBreed.saveCatBreedHive(catBreeds);
    }
    await storeCatBreed.getCatBreed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),

              HomeHeader(store: storeCatBreed),
              Observer(
                builder:
                    (_) =>
                        !storeCatBreed.isLoading
                            ? Column(
                              children: [
                                SizedBox(height: 50),
                                CircularProgressIndicator(),
                                const Center(
                                  child: Text(
                                    "Loading cats...",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            )
                            : Container(),
              ),
              Observer(
                builder:
                    (_) => Center(
                      child: Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          for (var element in storeCatBreed.filteredCatBreeds)
                            CardCatBreed(catBreed: element),
                        ],
                      ),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
