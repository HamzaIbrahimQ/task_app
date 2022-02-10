import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_app/models/login_model.dart';
import 'package:task_app/util/utility.dart';

import 'login_repository.dart';

class LoginProvider extends ChangeNotifier with Utility {
  String? token;

  bool get isLoggedIn {
    return token != null;
  }

  Future<void> login(
      {required String userName,
      required String password,
      required BuildContext context}) async {
    LogInRepository logInRepository = LogInRepository();
    LoginModel loginResponse = LoginModel();
    bool _isConnected = await checkInternetConnection();
    if (_isConnected) {
      try {
        loginResponse =
            await logInRepository.login(userName: userName, password: password);
        if ((loginResponse.toString().isNotEmpty) &&
            (loginResponse.errorMessage?.isEmpty ?? false)) {
          token = loginResponse.token ?? "";
          final prefs = await SharedPreferences.getInstance();
          prefs.setString('token', token ?? "");
          showToast(context: context, msg: "تم تسجيل دخولك بنجاح", state: true);
          notifyListeners();
        } else {
          if (loginResponse.errorMessage?.contains("Invalid") ?? false) {
            showToast(
                context: context,
                msg: "معلومات الدخول غير صحيحة",
                state: false);
          } else {
            showToast(
                context: context,
                msg: loginResponse.errorMessage ??
                    "حدث خطأ ما يرجى المحاولة لاحقا",
                state: false);
          }
        }
      } catch (error) {
        showToast(
            context: context,
            msg: loginResponse.errorMessage ?? "حدث خطأ ما يرجى المحاولة لاحقا",
            state: false);
      }
    } else {
      showToast(
          context: context, msg: "من فضلك تفقد اتصالك بالانترنت", state: false);
    }
  }
}
