import 'package:cracktech_assessment/Model/MovieListBaseResponse.dart';
import 'package:flutter/cupertino.dart';
import 'api_client.dart';
import 'api_urls.dart';

class ApiRepository {

  /// Movie List
  void getMovieList(BuildContext context,String url, Map<String, dynamic>? params, {void Function(MovieListBaseResponse)? onSuccess,
    void Function(String)? onFailure}) async {


    try {
      final response = await ApiClient.get(url, params,false, false);
      var callResponse = MovieListBaseResponse.fromJson(response);
      if (callResponse != null) {
        onSuccess!(callResponse);
      } else {
        debugPrint(callResponse.toString());
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
