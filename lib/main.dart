import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'providers/homeProvider/activitiesAndCources/activities_and_cources_provider.dart';
import 'providers/loginProvider/login_provider.dart';
import 'package:task_app/ui/home_page.dart';
import 'package:task_app/ui/login_page.dart';

import 'providers/homeProvider/categories/categories_provider.dart';

String token = "";

void main() async {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
          providers: [
            ChangeNotifierProvider<LoginProvider>(
                create: (context) => LoginProvider(),
                ),
            ChangeNotifierProvider<ActivitiesAndCoursesProvider>(
              create: (context) => ActivitiesAndCoursesProvider(),
            ),
            ChangeNotifierProvider<CategoriesProvider>(
              create: (context) => CategoriesProvider(),
            ),

          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Task app',
            home: Consumer<LoginProvider>(
              builder: (context, loginProvider, _) => loginProvider.isLoggedIn ? HomePage() : LoginPage(),
            ),
          ));
  }
}
