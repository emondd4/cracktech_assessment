import 'package:cracktech_assessment/LocalDbModel/LocalMovieListBaseResponse.dart';
import 'package:cracktech_assessment/LocalDbModel/Movies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/adapters.dart';

import 'Utils/AppRoutes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(LocalMovieListBaseResponseAdapter());
  Hive.registerAdapter(MoviesAdapter());
  await Hive.openBox<LocalMovieListBaseResponse>("movies");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      getPages: AppRoutes.instance.routeList,
      initialRoute: "/splashPage",
    );
  }
}