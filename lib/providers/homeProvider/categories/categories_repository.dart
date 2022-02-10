import 'dart:convert';
import 'dart:developer';
import 'package:task_app/constants/constatnts.dart';
import 'package:task_app/models/categories_model.dart';
import 'package:task_app/util/utility.dart';
import 'package:http/http.dart' as http;



class CategoriesRepository with Utility {
  Future<CategoriesModel> getCategories({
    required String token,
  }) async {
    CategoriesModel loginResponse = CategoriesModel();
    try {
      var responseJson = await http.get(Uri.parse("https://rafiqi-backend.azurewebsites.net/api/portal/categories/search") , headers: {"Authorization" : "Bearer $token"});
      loginResponse = CategoriesModel.fromJson(jsonDecode(responseJson.body));
      log(responseJson.body);
      return loginResponse;
    } catch (error) {
      log("categories service error : ${error.toString()}");
      return loginResponse;
    }
  }

}
