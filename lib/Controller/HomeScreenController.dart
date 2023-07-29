import 'package:cracktech_assessment/Model/MovieListBaseResponse.dart';
import 'package:cracktech_assessment/Network/api_urls.dart';
import 'package:get/get.dart';

import '../Network/api_repository.dart';
import '../Utils/AppCommonUtil.dart';
import '../Utils/AppUiUtils.dart';

class HomeScreenController extends GetxController{

  final ApiRepository _apiRepository = ApiRepository();
  RxBool isDataLoading = true.obs;
  late MovieListBaseResponse movieListBaseResponse;


  @override
  void onInit() {
    getMovieList();
    super.onInit();
  }

  ///Api Calls
  Future getMovieList() async {

    CommonUtil.instance.internetCheck().then((value) async {
      if (value) {
        _apiRepository.getMovieList(Get.context!, ApiUrls.baseUrl + ApiUrls.movieList, null,
            onSuccess: (MovieListBaseResponse response) async {
              if (response != null) {
                isDataLoading(false);
                movieListBaseResponse = response;
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
        UIUtil.instance.onNoInternet();
      }
    });
  }

}