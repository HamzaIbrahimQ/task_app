import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_app/constants/constatnts.dart';
import 'package:task_app/ui/bottom_nav_bar.dart';
import 'package:task_app/ui/section_title.dart';
import '../main.dart';
import '../providers/homeProvider/activitiesAndCources/activities_and_cources_provider.dart';
import '../providers/homeProvider/categories/categories_provider.dart';
import 'package:task_app/ui/login_page.dart';
import 'package:task_app/util/progress_hud.dart';

import 'package:task_app/util/utility.dart';

import 'activities_list_view.dart';
import 'categories_list_view.dart';
import 'category_widget.dart';
import 'course_card.dart';



class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Utility {

  int selectedPosition = 0;


  Future<String> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token') ?? "";
    return token;
  }

  _getData() async {
    ProgressHud.shared.startLoading(context);
    await Provider.of<CategoriesProvider>(context, listen: false)
        .getCategories(isActivities: false, token: token, context: context);
    await Provider.of<ActivitiesAndCoursesProvider>(context, listen: false)
        .getActivitiesAndCourses(
        isActivities: false, token: token, context: context);
    await Provider.of<ActivitiesAndCoursesProvider>(context, listen: false)
        .getActivitiesAndCourses(
        isActivities: true, token: token, context: context).then((value) {
      ProgressHud.shared.stopLoading();
    });
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
            color: Colors.white,
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
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => LoginPage())),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(end: 8.0),
                          child: CategoryWidget(
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
                        child: CategoriesList(categoriesProvider: categoriesProvider),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsetsDirectional.only(
                        start: 16.0, end: 16.0, top: 24.0, bottom: 16.0),
                    decoration: const BoxDecoration(
                      color: greyColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SectionTitle(borderRadius: borderRadius, title: "الفعاليات والأنشطة",),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                                top: 16.0, bottom: 16.0),
                            child: SizedBox(
                              height: 126,
                              child: ActivitiesList(activitiesAndCoursesProvider: activitiesAndCoursesProvider, borderRadius: borderRadius),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                                top: 4.0, bottom: 8.0),
                            child:  SectionTitle(borderRadius: borderRadius, title: "الدورات",),
                          ),
                          Container(
                            height: 400,
                            padding:
                                const EdgeInsetsDirectional.only(bottom: 140),
                            child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisExtent: 260,
                                        crossAxisSpacing: 16,
                                        mainAxisSpacing: 24,
                                        childAspectRatio: 0.7),
                                physics: const BouncingScrollPhysics(),
                                itemCount:
                                    activitiesAndCoursesProvider.courses.length,
                                itemBuilder: (context, index) {
                                  return CourseCard(borderRadius: borderRadius, activitiesAndCoursesProvider: activitiesAndCoursesProvider, index: index);
                                }),
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
                  child: const Icon(Icons.add, size: 32,),
                  onPressed: () {},
                ),
              ),
              Container(

                padding: const EdgeInsetsDirectional.only(top: 8.0),
                child: const Text('طلب جديد'),
              ),
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: NavBar(selectedPosition: selectedPosition,),
        ),
      ),
    );
  }


}













