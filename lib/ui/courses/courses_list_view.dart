
import 'package:flutter/material.dart';
import 'package:task_app/models/activities_and_cources_data_model.dart';

import 'course_card.dart';


class CoursesList extends StatelessWidget {
  const CoursesList({
    Key? key,
    required this.courses,
  }) : super(key: key);

  final List<ActivitiesAndCoursesDataModel> courses;

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
        courses.length,
        itemBuilder: (context, index) {
          return CourseCard(course: courses[index]);
        });
  }
}