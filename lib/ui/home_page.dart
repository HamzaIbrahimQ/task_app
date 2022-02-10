import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_app/constants/constatnts.dart';
import '../main.dart';
import '../providers/homeProvider/activitiesAndCources/activities_and_cources_provider.dart';
import '../providers/homeProvider/categories/categories_provider.dart';
import '../providers/homeProvider/categories/categories_repository.dart';
import 'package:task_app/ui/login_page.dart';
import 'package:task_app/util/progress_hud.dart';

import 'package:task_app/util/utility.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Utility {
  // String _token = "";
  bool _isLoading = false;

  Future<String> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token') ?? "";
    return token;
  }

  @override
  void initState() {
    _getToken().then((value) {
      _getData();
    });
    super.initState();
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

  // @override
  // void didChangeDependencies() async {
  //
  //   super.didChangeDependencies();
  // }

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
                  decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: const BorderRadius.only(
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
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: categoriesProvider.categories.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsetsDirectional.only(
                                    end: 16.0, start: 4.0),
                                child: CategoryWidget(
                                  title: categoriesProvider
                                          .categories[index].name ??
                                      "empty",
                                  logoPath:
                                      "https://rafiqi-backend.azurewebsites.net/${categoriesProvider.categories[index].logoPath}",
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsetsDirectional.only(
                        start: 16.0, end: 16.0, top: 24.0, bottom: 16.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "الفعليات والانشطة",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  padding: const EdgeInsetsDirectional.all(8.0),
                                  decoration: BoxDecoration(
                                    borderRadius: borderRadius,
                                    color: greyColor,
                                  ),
                                  child: const Text(
                                    "عرض الكل",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                                top: 16.0, bottom: 16.0),
                            child: SizedBox(
                              height: 126,
                              child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: activitiesAndCoursesProvider
                                      .activities.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsetsDirectional.only(
                                          start: 4.0,
                                          end: 24.0,
                                          top: 4.0,
                                          bottom: 4.0),
                                      child: Container(
                                        width: 330,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              spreadRadius: 1,
                                              blurRadius: 7,
                                              offset: const Offset(0,
                                                  3), // changes position of shadow
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 120,
                                              height: 120,
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .all(4.0),
                                              child: ClipRRect(
                                                borderRadius: borderRadius,
                                                child: (activitiesAndCoursesProvider
                                                            .activities[index]
                                                            .imagePath) ==
                                                        null
                                                    ? Image.asset(
                                                        'assets/images/empty.png')
                                                    : FadeInImage(
                                                        placeholder:
                                                            const AssetImage(
                                                                'assets/images/empty.png'),
                                                        image: NetworkImage(
                                                            'https://rafiqi-backend.azurewebsites.net/${activitiesAndCoursesProvider.activities[index].imagePath}'),
                                                        fit: BoxFit.cover,
                                                      ),
                                              ),
                                            ),
                                            // const SizedBox(width: 8.0,),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    activitiesAndCoursesProvider
                                                            .activities[index]
                                                            .title ??
                                                        "empty",
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 160,
                                                        child: Text(
                                                          activitiesAndCoursesProvider
                                                                  .activities[
                                                                      index]
                                                                  .description ??
                                                              "empty",
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 2,
                                                          style: TextStyle(
                                                              fontSize: 10.0,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    height: 8.0,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Row(
                                                        children: const [
                                                          Icon(
                                                            Icons
                                                                .calendar_today_outlined,
                                                            color: Colors.black,
                                                            size: 14,
                                                          ),
                                                          SizedBox(
                                                            width: 4.0,
                                                          ),
                                                          Text(
                                                            'تاريخ الحدث: ',
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: TextStyle(
                                                                fontSize: 10,
                                                                color: Colors
                                                                    .black),
                                                          ),
                                                        ],
                                                      ),
                                                      Text(
                                                        (activitiesAndCoursesProvider
                                                                    .activities[
                                                                        index]
                                                                    .startDate ??
                                                                "empty")
                                                            .substring(0, 10),
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: const TextStyle(
                                                            fontSize: 10,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                                top: 4.0, bottom: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "الدورات",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding:
                                        const EdgeInsetsDirectional.all(8.0),
                                    decoration: BoxDecoration(
                                      borderRadius: borderRadius,
                                      color: greyColor,
                                    ),
                                    child: const Text(
                                      "عرض الكل",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                                  return Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                        start: 4.0, end: 4.0, bottom: 8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: borderRadius,
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 1,
                                            blurRadius: 7,
                                            offset: const Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Wrap(
                                        children: [
                                          Container(
                                            width: 180,
                                            height: 120,
                                            padding: const EdgeInsetsDirectional
                                                    .only(
                                                start: 8.0,
                                                end: 8.0,
                                                top: 8.0,
                                                bottom: 4.0),
                                            child: ClipRRect(
                                              borderRadius: borderRadius,
                                              child:
                                                  (activitiesAndCoursesProvider
                                                              .courses[index]
                                                              .imagePath
                                                              ?.isEmpty ??
                                                          false)
                                                      ? Container(
                                                          decoration:
                                                              const BoxDecoration(
                                                                  image:
                                                                      DecorationImage(
                                                            image: AssetImage(
                                                              'assets/images/empty.png',
                                                            ),
                                                            fit: BoxFit.cover,
                                                          )),
                                                        )
                                                      : FadeInImage(
                                                          placeholder:
                                                              const AssetImage(
                                                                  'assets/images/empty.png'),
                                                          image: NetworkImage(
                                                              'https://rafiqi-backend.azurewebsites.net/${activitiesAndCoursesProvider.courses[index].imagePath}'),
                                                          fit: BoxFit.cover,
                                                        ),
                                            ),
                                          ),
                                          // const SizedBox(width: 8.0,),
                                          Padding(
                                            padding: const EdgeInsetsDirectional
                                                    .only(
                                                start: 8.0,
                                                end: 8.0,
                                                top: 4.0,
                                                bottom: 4.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsetsDirectional
                                                              .only(
                                                          start: 8.0,
                                                          end: 8.0,
                                                          top: 4.0,
                                                          bottom: 4.0),
                                                  decoration: BoxDecoration(
                                                    borderRadius: borderRadius,
                                                    color: Colors.cyan
                                                        .withOpacity(0.2),
                                                  ),
                                                  child: Text(
                                                    "التصميم والمنتاج",
                                                    style: TextStyle(
                                                        color: mainColor,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 4.0,
                                                ),
                                                Text(
                                                  activitiesAndCoursesProvider
                                                          .courses[index]
                                                          .title ??
                                                      "empty",
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 8.0,
                                                ),
                                                Row(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        const Text(
                                                          'الساعات:',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        const SizedBox(
                                                          width: 4.0,
                                                        ),
                                                        Text(
                                                          "${activitiesAndCoursesProvider.courses[index].totalHours ?? 0}",
                                                          textAlign:
                                                              TextAlign.start,
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 10,
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      width: 4.0,
                                                    ),
                                                    Wrap(
                                                      crossAxisAlignment:
                                                          WrapCrossAlignment
                                                              .center,
                                                      children: [
                                                        const Text(
                                                          'بدء الدورة:',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        const SizedBox(
                                                          width: 4.0,
                                                        ),
                                                        Text(
                                                          (activitiesAndCoursesProvider
                                                                      .courses[
                                                                          index]
                                                                      .startDate ??
                                                                  "empty")
                                                              .substring(0, 10),
                                                          textAlign:
                                                              TextAlign.start,
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 10,
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 4.0,
                                                ),
                                                Row(
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 15,
                                                      backgroundColor: Colors
                                                          .cyan
                                                          .withOpacity(0.1),
                                                      child: Image.asset(
                                                        'assets/images/profile.png',
                                                        width: 24,
                                                        height: 24,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 2.0,
                                                    ),
                                                    Text(
                                                      activitiesAndCoursesProvider
                                                              .courses[index]
                                                              .trainerName ??
                                                          "empty",
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: const TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
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
        ),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget with Utility {
  final String title;
  final String? logoPath;
  final bool? isShowAll;

  CategoryWidget({
    required this.title,
    this.logoPath,
    this.isShowAll,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: Colors.blue[900],
          ),
          child: isShowAll ?? false
              ? Icon(
                  Icons.apps_outlined,
                  color: Colors.white,
                  size: 40,
                )
              : Image.network(
                  logoPath ?? "",
                ),
        ),
        const SizedBox(
          height: 6.0,
        ),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}
