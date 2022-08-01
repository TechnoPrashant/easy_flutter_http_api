import 'package:flutter_easy_http_api/api/api_const.dart';
import 'package:http/http.dart' as http;

class APICall {
  Future<http.Response> getCategoryList() async {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    return await http.get(Uri.parse(APIConst.getCategoryList),
        headers: headers);
  }
}
