import 'dart:convert';
import 'dart:developer';
import 'package:task_app/constants/constatnts.dart';
import 'package:task_app/models/login_model.dart';
import 'package:task_app/util/utility.dart';
import 'package:http/http.dart' as http;


class LogInRepository with Utility {
  Future<LoginModel> login({
    required String userName,
    required String password,
  }) async {
    Map<String, String> body = {
      "userName": userName,
      "password": password,
    };
    LoginModel loginResponse = LoginModel();
    try {
      var responseJson = await http.post(Uri.parse(baseUrl+loginEnp), body: jsonEncode(body), headers: {"Content-Type" : "application/json"});
        loginResponse = LoginModel.fromJson(jsonDecode(responseJson.body));
        log(responseJson.body);
        return loginResponse;
    } catch (error) {
      log("login error : ${error.toString()}");
      return loginResponse;
    }
  }
}
