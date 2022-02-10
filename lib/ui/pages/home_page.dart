import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_app/constants/constatnts.dart';
import '../../components/bottom_nav_bar.dart';
import '../../components/section_title.dart';
import '../../providers/homeProvider/activitiesAndCources/activities_and_cources_provider.dart';
import '../../providers/homeProvider/categories/categories_provider.dart';
import 'login_page.dart';
import 'package:task_app/util/progress_hud.dart';

import 'package:task_app/util/utility.dart';

import '../activities/activities_list_view.dart';
import '../categories/categories_list_view.dart';
import '../categories/category_card.dart';
import '../courses/courses_list_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Utility {
  int selectedPosition = 0;
  String _token = "";

  // We need this function to get the user Token, to send it in the Api request
  Future<String> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token') ?? "";
    return _token;
  }

  // This function will call the Api services and get data
  _getData() async {
    ProgressHud.shared.startLoading(context);
    await Provider.of<CategoriesProvider>(context, listen: false)
        .getCategories(isActivities: false, token: _token, context: context);
    await Provider.of<ActivitiesAndCoursesProvider>(context, listen: false)
        .getActivitiesAndCourses(
            isActivities: false, token: _token, context: context);
    await Provider.of<ActivitiesAndCoursesProvider>(context, listen: false)
        .getActivitiesAndCourses(
            isActivities: true, token: _token, context: context)
        .then((value) {
      ProgressHud.shared.stopLoading();
    });

    /// there is an another way to call Api services, call services one by one like this:

    // await Provider.of<CategoriesProvider>(context, listen: false)
    //     .getCategories(isActivities: false, token: _token, context: context)
    //     .then((value) async {
    //   await Provider.of<ActivitiesAndCoursesProvider>(context, listen: false)
    //       .getActivitiesAndCourses(
    //           isActivities: false, token: _token, context: context)
    //       .then((value) async {
    //     await Provider.of<ActivitiesAndCoursesProvider>(context, listen: false)
    //         .getActivitiesAndCourses(
    //             isActivities: true, token: _token, context: context)
    //         .then((value) {
    //       ProgressHud.shared.stopLoading();
    //     });
    //   });
    // });

  }

  @override
  void initState() {
    _getToken().then((value) {
      _getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final activitiesAndCoursesProvider =
        Provider.of<ActivitiesAndCoursesProvider>(context);
    final categoriesProvider = Provider.of<CategoriesProvider>(context);
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: mainColor,
          appBar: getAppBar(context: context, title: "الرئيسية"),
          body: Container(
            color: greyColor,
            child: Column(
              children: [
                Container(
                  height: 140,
                  padding:
                      const EdgeInsetsDirectional.only(start: 8.0, end: 8.0),
                  decoration: const BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                    ),
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(end: 8.0),
                          child: CategoryCard(
                            title: "عرض الكل",
                            isShowAll: true,
                          ),
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsetsDirectional.only(top: 32.0, bottom: 32.0),
                        child: VerticalDivider(
                          color: Colors.white,
                          thickness: 0.5,
                        ),
                      ),
                      Expanded(
                        child: CategoriesList(
                            categoriesProvider: categoriesProvider),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsetsDirectional.only(
                        start: 16.0, end: 16.0, top: 24.0, bottom: 0.0),
                    decoration: const BoxDecoration(
                      color: greyColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Wrap(
                        children: [
                          SectionTitle(
                            borderRadius: borderRadius,
                            title: "الفعاليات والأنشطة",
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                                top: 16.0, bottom: 16.0),
                            child: SizedBox(
                              height: 126,
                              child: ActivitiesList(
                                  activitiesAndCoursesProvider:
                                      activitiesAndCoursesProvider,
                                  borderRadius: borderRadius),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsetsDirectional.only(bottom: 16.0),
                            child: SectionTitle(
                              borderRadius: borderRadius,
                              title: "الدورات",
                            ),
                          ),
                          Container(
                            height: 400,
                            width: double.infinity,
                            padding:
                                const EdgeInsetsDirectional.only(bottom: 180),
                            child: CoursesList(
                                activitiesAndCoursesProvider:
                                    activitiesAndCoursesProvider,
                                borderRadius: borderRadius),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(top: 32),
                child: FloatingActionButton(
                  child: const Icon(
                    Icons.add,
                    size: 32,
                  ),
                  onPressed: () {},
                ),
              ),
              Container(
                padding: const EdgeInsetsDirectional.only(top: 8.0),
                child: const Text('طلب جديد'),
              ),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: NavBar(
            selectedPosition: selectedPosition,
          ),
        ),
      ),
    );
  }
}
