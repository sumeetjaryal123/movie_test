import 'dart:convert';
import '../utils/all_constants.dart';

class ApiRepository {
  Dio _dio = Dio();

  var base_Url = "http://165.22.75.82/v1/";

  /*1................... Movies Api Hit ..........*/

  Future<MoviesApiresponse> getmoviesApiHit() async {
    var response = await _dio.get(base_Url + ApiEndStrings.get_MoviesList);
    log("MoviesApiresponse" + response.toString());
    Map<String, dynamic> data = jsonDecode(response.toString());
    return MoviesApiresponse.fromJson(data);
  }
}
