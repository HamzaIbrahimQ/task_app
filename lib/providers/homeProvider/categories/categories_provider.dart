import 'package:flutter/cupertino.dart';
import 'categories_repository.dart';
import 'package:task_app/models/categories_data_model.dart';
import 'package:task_app/models/categories_model.dart';
import 'package:task_app/util/utility.dart';




class CategoriesProvider extends ChangeNotifier with Utility {
  String? token;


  bool get isLoggedIn {
    return token != null;
  }

  final List<CategoriesDataModel> _categories = [];


  List<CategoriesDataModel> get categories {
    return [..._categories];
  }




  Future<void> getCategories(
      {required bool isActivities,
        required String token,
        required BuildContext context}) async {
    CategoriesRepository activitiesAndCoursesRepository = CategoriesRepository();
    CategoriesModel categoriesModel = CategoriesModel();
    bool _isConnected = await checkInternetConnection();
    if (_isConnected) {

      try {
        categoriesModel = await activitiesAndCoursesRepository.getCategories(token: token,);
        if (categoriesModel.errorMessage?.isEmpty ?? false) {
          categoriesModel.categories?.forEach((element) {
            _categories.add(element);
          });
          // showToast(context: context, msg: "تم جلب البيانات بنجاح", state: true);
          notifyListeners();
        }
        else {
          showToast(context: context, msg: categoriesModel.errorMessage ?? "حدث خطأ ما يرجى المحاولة لاحقا", state: false);
        }
      } catch (error) {
        showToast(
            context: context,
            msg: categoriesModel.errorMessage ?? "حدث خطأ ما يرجى المحاولة لاحقا",
            state: false);
      }
    }
    else {
      showToast(context: context, msg: "من فضلك تفقد اتصالك بالانترنت", state: false);
    }

  }
}
