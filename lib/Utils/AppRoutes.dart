import 'package:cracktech_assessment/UI/HomeScreen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../UI/SplashScreen.dart';

class AppRoutes{

  static AppRoutes instance = AppRoutes();

  /// All pages
  List<GetPage> routeList = [
    GetPage(name: "/splashPage", page: () => const SplashPage(),transition: Transition.native),
    GetPage(name: "/homePage", page: () => const HomePage(),transition: Transition.native),
  ];


}