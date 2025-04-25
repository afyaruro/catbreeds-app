// lib/routes/app_routes.dart
import 'package:catbreeds/Domain/Entity/CatBreedEntity.dart';
import 'package:catbreeds/Presentation/Screens/Home/HomeScreen.dart';
import 'package:catbreeds/Presentation/Screens/Home/Widgets/CatBreedDetailView.dart';
import 'package:catbreeds/Presentation/Screens/Splash/SplashScreen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String detail = '/detail';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const Splash(),
    home: (context) => const HomeScreen(),

    detail: (context) {
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      final cat = args['cat'] as CatBreedEntity;
      return CatBreedDetailView(catBreed: cat);
    },
  };
}
