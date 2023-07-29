import 'package:get/get.dart';

class DetailsScreenController extends GetxController {

  var arg = Get.arguments;
  late List<String> genre;
  String year = "";
  String title = "";
  String director = "";
  String actors = "";
  String plot = "";
  String photo = "";

  @override
  void onInit() {
    genre = arg[0];
    title = arg[1];
    year = arg[2];
    director = arg[3];
    actors = arg[4];
    plot = arg[5];
    photo = arg[6];
    super.onInit();
  }




}