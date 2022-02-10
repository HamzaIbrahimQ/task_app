
import 'package:flutter/material.dart';
import 'package:task_app/providers/homeProvider/activitiesAndCources/activities_and_cources_provider.dart';

import 'course_card.dart';


class CoursesList extends StatelessWidget {
  const CoursesList({
    Key? key,
    required this.activitiesAndCoursesProvider,
    required this.borderRadius,
  }) : super(key: key);

  final ActivitiesAndCoursesProvider activitiesAndCoursesProvider;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 260,
            crossAxisSpacing: 16,
            mainAxisSpacing: 8,
            childAspectRatio: 0.7),
        physics: const BouncingScrollPhysics(),
        itemCount:
        activitiesAndCoursesProvider.courses.length,
        itemBuilder: (context, index) {
          return CourseCard(borderRadius: borderRadius, activitiesAndCoursesProvider: activitiesAndCoursesProvider, index: index);
        });
  }
}