// lib/routes/app_routes.dart
import 'package:catbreeds/Presentation/Screens/Home/HomeScreen.dart';
import 'package:catbreeds/Presentation/Screens/Splash/SplashScreen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';

  static Map<String, WidgetBuilder> routes = {
    splash: (context) => const Splash(),
    home: (context) => const HomeScreen(),

    // signup2: (context) {
    //   final args =
    //       ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    //   final code = args['code'] as String;
    //   final correo = args['correo'] as String;
    //   return SignUp2(code: code, correo: correo);
    // },
  };
}
