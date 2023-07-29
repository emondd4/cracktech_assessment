import 'package:cracktech_assessment/LocalDbModel/LocalMovieListBaseResponse.dart';
import 'package:cracktech_assessment/Network/api_urls.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../Network/api_repository.dart';
import '../Utils/AppCommonUtil.dart';
import '../Utils/AppUiUtils.dart';

class HomeScreenController extends GetxController{

  final ApiRepository _apiRepository = ApiRepository();
  RxBool isDataLoading = true.obs;
  late LocalMovieListBaseResponse movieListBaseResponse;

  final box = Hive.box<LocalMovieListBaseResponse>('movies');


  @override
  void onInit() {
    Hive.openBox('movies');
    getMovieList();
    super.onInit();
  }

  ///Api Calls
  Future getMovieList() async {

    CommonUtil.instance.internetCheck().then((value) async {
      if (value) {
        _apiRepository.getMovieList(Get.context!, ApiUrls.baseUrl + ApiUrls.movieList, null,
            onSuccess: (LocalMovieListBaseResponse response) async {
              if (response != null) {
                isDataLoading(false);
                movieListBaseResponse = response;
                await box.put("response", response);
                print("Box Info: ${box.get("response")?.genres.toString()}");
              } else {
                UIUtil.instance.onFailed('Failed to Fetch Movie List');
              }
            },
            onFailure: (String error) {
              isDataLoading(false);
              UIUtil.instance.onFailed(error);
            });
      } else {
        isDataLoading(false);
        movieListBaseResponse = box.get("response")!;
        UIUtil.instance.onNoInternet();
      }
    });
  }

}