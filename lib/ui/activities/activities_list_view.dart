import 'package:flutter/material.dart';
import 'package:task_app/providers/homeProvider/activitiesAndCources/activities_and_cources_provider.dart';

import 'activity_card.dart';



class ActivitiesList extends StatelessWidget {
  const ActivitiesList({
    Key? key,
    required this.activitiesAndCoursesProvider,
    required this.borderRadius,
  }) : super(key: key);

  final ActivitiesAndCoursesProvider activitiesAndCoursesProvider;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: activitiesAndCoursesProvider
            .activities.length,
        itemBuilder: (context, index) {
          return ActivityCard(borderRadius: borderRadius, activitiesAndCoursesProvider: activitiesAndCoursesProvider, index: index,);
        });
  }
}