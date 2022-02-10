import 'dart:convert';
import 'dart:developer';
import 'package:task_app/constants/constatnts.dart';
import 'package:task_app/models/activities_and_courses_model.dart';
import 'package:task_app/models/login_model.dart';
import 'package:task_app/models/main_response_model.dart';
import 'package:task_app/util/utility.dart';
import 'package:http/http.dart' as http;



class ActivitiesAndCoursesRepository with Utility {
  Future<MainResponseModel> getActivities({
    required bool isActivities,
    required String token,
  }) async {
    MainResponseModel loginResponse = MainResponseModel();
    int eventTypeId = isActivities ? 44 : 43;
    try {
      var responseJson = await http.get(Uri.parse(baseUrl+activitiesEnp+"$eventTypeId") , headers: {"Authorization" : "Bearer $token"});
      loginResponse = MainResponseModel.fromJson(jsonDecode(responseJson.body));
      log(responseJson.body);
      return loginResponse;
    } catch (error) {
      log("activities and courses service error : ${error.toString()}");
      return loginResponse;
    }
  }

}
