import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../UI/SplashScreen.dart';

class AppRoutes{

  static AppRoutes instance = AppRoutes();

  /// All pages
  List<GetPage> routeList = [
    GetPage(name: "/splashPage", page: () => const SplashPage(),transition: Transition.native),
  ];


}