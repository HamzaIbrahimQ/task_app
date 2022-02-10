import 'package:flutter/material.dart';
import 'package:task_app/providers/homeProvider/activitiesAndCources/activities_and_cources_provider.dart';



class ActivityCard extends StatelessWidget {
  const ActivityCard({
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
                          style: const TextStyle(
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
  }
}