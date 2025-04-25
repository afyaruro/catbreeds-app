import 'package:catbreeds/Application/Service/CatBreedService.dart';
import 'package:catbreeds/Application/Stores/CatBreed/CatBreedStore.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  final serviceCatBreed = GetIt.instance<CatBreedService>();
  final storeCatBreed = GetIt.instance<CatBreedStore>();

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () async {
      var catBreeds = await serviceCatBreed.getCatBreedDio();
      if (catBreeds != null) {
        await serviceCatBreed.saveCatBreedHive(catBreeds);
      }
      await storeCatBreed.getCatBreed();

      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "lib/assets/img_splash.png",
              width: 150,
              height: 100,
              fit: BoxFit.fitWidth,
            ),
            Text(
              "Catbreeds",
              style: TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
