import 'package:flutter/cupertino.dart';
import 'package:task_app/models/activities_and_cources_data_model.dart';

import 'package:task_app/models/main_response_model.dart';
import 'package:task_app/util/utility.dart';

import 'activities_and_cources_repository.dart';



class ActivitiesAndCoursesProvider extends ChangeNotifier with Utility {
  String? token;


  bool get isLoggedIn {
    return token != null;
  }

  final List<ActivitiesAndCoursesDataModel> _activities = [];
  final List<ActivitiesAndCoursesDataModel> _courses = [];


  List<ActivitiesAndCoursesDataModel> get activities {
    return [..._activities];
  }

  List<ActivitiesAndCoursesDataModel> get courses {
    return [..._courses];
  }


  Future<void> getActivitiesAndCourses(
      {required bool isActivities,
        required String token,
        required BuildContext context}) async {
    ActivitiesAndCoursesRepository activitiesAndCoursesRepository = ActivitiesAndCoursesRepository();
    MainResponseModel mainResponse = MainResponseModel();
    bool _isConnected = await checkInternetConnection();
    if (_isConnected) {
      try {
        mainResponse = await activitiesAndCoursesRepository.getActivities(token: token, isActivities: isActivities,);
        if (mainResponse.errorMessage?.isEmpty ?? false) {
         isActivities ? mainResponse.activitiesOrCourses?.data?.forEach((element) {
           _activities.add(element);
         }) : mainResponse.activitiesOrCourses?.data?.forEach((element) {
           _courses.add(element);
         });
          // showToast(context: context, msg: "تم جلب البيانات بنجاح", state: true);
          notifyListeners();
        }
        else {
          showToast(context: context, msg: mainResponse.errorMessage ?? "حدث خطأ ما يرجى المحاولة لاحقا", state: false);
        }
        // }
      } catch (error) {
        showToast(
            context: context,
            msg: mainResponse.errorMessage ?? "حدث خطأ ما يرجى المحاولة لاحقا",
            state: false);
      }
    }
    else {
      showToast(context: context, msg: "من فضلك تفقد اتصالك بالانترنت", state: false);
    }

  }
}
