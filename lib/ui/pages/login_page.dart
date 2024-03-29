import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/constants/constatnts.dart';
import 'package:task_app/util/progress_hud.dart';
import '../../providers/loginProvider/login_provider.dart';
import 'package:task_app/util/utility.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with Utility {
  late TextEditingController _userNameController;
  late TextEditingController _passwordController;
  late FocusNode _passwordFocusNode;

  final _formKey = GlobalKey<FormState>();

  String dropDownValue = dropDownList[0];

  @override
  void initState() {
    _userNameController = TextEditingController();
    _passwordController = TextEditingController();
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  // String token = "";

  // Future<String> _getToken() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   token = prefs.getString('token') ?? "";
  //   print("token is  : " + token);
  //   return token;
  // }

  // _getActivitiesAndCourses() async {
  //   _getToken().then((value) {
  //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
  //   });
  // }


  _login() async {
    bool isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) {
      return;
    }
    // if (_isLoading == true) {
    //   return;
    // }
    _formKey.currentState!.save();
    ProgressHud.shared.startLoading(context);
    await Provider.of<LoginProvider>(context, listen: false)
        .login(
            userName: _userNameController.text,
            password: _passwordController.text,
            context: context)
        .then((value) {
      ProgressHud.shared.stopLoading();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
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
                      onTap: () {},
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
                                  controller: _userNameController,
                                  textInputAction: TextInputAction.next,
                                  validator: (val) {
                                    if (val?.isEmpty ?? false) {
                                      return 'ادخل رقم الهاتف من فضلك';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (val) {
                                    setState(() {
                                      val = _userNameController.text;
                                    });
                                  },
                                  onFieldSubmitted: (_) {
                                    FocusScope.of(context).requestFocus(_passwordFocusNode);
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
                                      margin: const EdgeInsets.only(left: 8.0),
                                      width: 80,
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
                                        icon: const Padding(
                                          padding: EdgeInsetsDirectional.only(end: 4.0),
                                          child: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: Colors.white,
                                          ),
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
                                  obscureText: true,
                                  controller: _passwordController,
                                  focusNode: _passwordFocusNode,
                                  validator: (val) {
                                    if (val?.isEmpty ?? false) {
                                      return 'ادخل كلمة السر من فضلك';
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (val) {
                                    setState(() {
                                      val = _passwordController.text;
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
                                  onTap: () {},
                                  child: const Padding(
                                    padding: EdgeInsetsDirectional.only(
                                        start: 16.0),
                                    child: Text(
                                      'نسيت كلمة السر',
                                      style: TextStyle(
                                        fontSize: 16,
                                        shadows: [
                                          Shadow(
                                            color: secondColor,
                                            offset: Offset(0, -5),
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
                                    child: const Text('دخول'),
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
                onTap: () {},
                child: const Text(
                  'انشاء حساب',
                  style: TextStyle(
                    fontSize: 16,
                    shadows: [
                      Shadow(
                        color: secondColor,
                        offset: Offset(0, -6),
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
