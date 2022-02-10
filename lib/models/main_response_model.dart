

import 'package:json_annotation/json_annotation.dart';
import 'package:task_app/models/activities_and_courses_model.dart';

part 'main_response_model.g.dart';



@JsonSerializable()
class MainResponseModel {
  @JsonKey(name: "result")
  ActivitiesAndCoursesModel? activitiesOrCourses;
  @JsonKey(name: "errorMessage")
  String? errorMessage;
  @JsonKey(name: "timeGenerated")
  String? time;


  MainResponseModel({this.activitiesOrCourses, this.errorMessage, this.time});


  factory MainResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MainResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$MainResponseModelToJson(this);
}






