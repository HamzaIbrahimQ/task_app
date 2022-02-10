import 'package:flutter/material.dart';
import 'package:task_app/constants/constatnts.dart';
import 'package:task_app/providers/homeProvider/activitiesAndCources/activities_and_cources_provider.dart';




class CourseCard extends StatelessWidget {
  const CourseCard({
    Key? key,
    required this.borderRadius,
    required this.activitiesAndCoursesProvider,
    required this.index
  }) : super(key: key);

  final BorderRadius borderRadius;
  final ActivitiesAndCoursesProvider activitiesAndCoursesProvider;
  final int index;

  @override
  Widget build(BuildContext context) {
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
                    child: const Text(
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
  }
}