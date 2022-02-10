import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_app/constants/constatnts.dart';
import 'package:task_app/ui/home_page.dart';
import 'package:task_app/util/progress_hud.dart';
import '../main.dart';
import '../providers/homeProvider/activitiesAndCources/activities_and_cources_provider.dart';
import '../providers/loginProvider/login_provider.dart';
import 'package:task_app/util/utility.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with Utility {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String dropDownValue = dropDownList[0];
  bool _isLoading = false;

  @override
  void initState() {
    _getToken();
    super.initState();
  }

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // String token = "";

  Future<String> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token') ?? "";
    print("token is  : " + token);
    return token;
  }

  _getActivitiesAndCourses() async {
    _getToken().then((value) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
    });
  }


  _login() async {
    bool isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }
    if (_isLoading == true) {
      return;
    }
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    await Provider.of<LoginProvider>(context, listen: false)
        .login(
            userName: userNameController.text,
            password: passwordController.text,
            context: context)
        .then((value) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 300,
                    padding: const EdgeInsetsDirectional.only(top: 64),
                    child: Image.asset(
                      'assets/images/login_header.png',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Positioned(
                    top: 80,
                    right: 20,
                    child: InkWell(
                      onTap: () => showToast(
                          context: context,
                          msg: 'تم الضغط على الزر',
                          state: true),
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            padding: const EdgeInsetsDirectional.only(start: 8.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: borderRadius,
                              color: mainColor,
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          const Text(
                            'الرجوع',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 560,
                // color: Colors.green,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 16,
                        end: 16,
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'سجل دخول',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          const Text(
                            'ابدا الان بتسجيل الدخول للاستمتاع بالخدمات',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 32.0,
                          ),
                          Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  controller: userNameController,
                                  validator: (val) {
                                    if (val?.isEmpty ?? false) {
                                      return 'value empty!';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (val) {
                                    setState(() {
                                      val = userNameController.text;
                                    });
                                  },
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    fillColor: Colors.white,
                                    enabledBorder: outlineInputBorder,
                                    focusedErrorBorder: outlineInputBorder,
                                    errorBorder: outlineInputBorder,
                                    focusedBorder: outlineInputBorder,
                                    hintText: 'رقم الجوال',
                                    hintStyle: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    errorMaxLines: 2,
                                    suffixIcon: Container(
                                      margin: const EdgeInsets.only(left: 10),
                                      width: 90,
                                      decoration: BoxDecoration(
                                        borderRadius: borderRadius,
                                        color: mainColor,
                                      ),
                                      child: DropdownButton(
                                        underline: Container(),
                                        dropdownColor: mainColor,
                                        value: dropDownValue,
                                        style: const TextStyle(
                                            fontSize: 16.0, color: Colors.white),
                                        isExpanded: true,
                                        borderRadius: borderRadius,
                                        icon: const Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: Colors.white,
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            dropDownValue = value.toString();
                                          });
                                        },
                                        items: dropDownList.map((value) {
                                          return DropdownMenuItem(
                                            value: value,
                                            child: Center(
                                              child: Text(
                                                value,
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    errorStyle: const TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.red,
                                    ),
                                    filled: true,
                                  ),
                                ),
                                const SizedBox(
                                  height: 24.0,
                                ),
                                TextFormField(
                                  controller: passwordController,
                                  validator: (val) {
                                    if (val?.isEmpty ?? false) {
                                      return 'value empty!';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (val) {
                                    setState(() {
                                      val = passwordController.text;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    fillColor: Colors.white,
                                    enabledBorder: outlineInputBorder,
                                    focusedErrorBorder: outlineInputBorder,
                                    errorBorder: outlineInputBorder,
                                    focusedBorder: outlineInputBorder,
                                    hintText: 'كلمة السر',
                                    hintStyle: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    errorMaxLines: 2,
                                    errorStyle: const TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.red,
                                    ),
                                    filled: true,
                                  ),
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                                InkWell(
                                  onTap: () => _getToken(),
                                  // showToast(
                                  // context: context,
                                  // msg: 'تم الضغط على الزر',
                                  // state: true),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 16.0),
                                    child: Text(
                                      'نسيت كلمة السر',
                                      style: TextStyle(
                                        fontSize: 16,
                                        shadows: [
                                          Shadow(
                                            color: secondColor,
                                            offset: const Offset(0, -5),
                                          ),
                                        ],
                                        color: Colors.transparent,
                                        decoration: TextDecoration.underline,
                                        decorationColor: secondColor,
                                        decorationThickness: 2,
                                        decorationStyle:
                                            TextDecorationStyle.solid,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 46.0,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  height: 56.0,
                                  child: ElevatedButton(
                                    child: _isLoading
                                        ? const CircularProgressIndicator(
                                            color: Colors.red,
                                            backgroundColor: Colors.green,
                                          )
                                        : const Text('دخول'),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(mainColor),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: borderRadius,
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      _login();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
        bottomSheet: Container(
          width: double.infinity,
          height: 90,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'لا يوجد لدي حساب',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              InkWell(
                onTap: () {
                  _getActivitiesAndCourses();
                },
                child: Text(
                  'انشاء حساب',
                  style: TextStyle(
                    fontSize: 16,
                    shadows: [
                      Shadow(
                        color: secondColor,
                        offset: const Offset(0, -6),
                      ),
                    ],
                    height: 3,
                    color: Colors.transparent,
                    decoration: TextDecoration.underline,
                    decorationColor: secondColor,
                    decorationThickness: 2,
                    decorationStyle: TextDecorationStyle.solid,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
