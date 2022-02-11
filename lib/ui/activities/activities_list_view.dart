import 'package:flutter/material.dart';
import 'package:task_app/models/activities_and_cources_data_model.dart';

import 'activity_card.dart';



class ActivitiesList extends StatelessWidget {
  const ActivitiesList({
    Key? key,
    required this.activities,
  }) : super(key: key);

  final List<ActivitiesAndCoursesDataModel> activities;


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount:activities.length,
        itemBuilder: (context, index) {
          return ActivityCard(activitiy: activities[index],);
        });
  }
}