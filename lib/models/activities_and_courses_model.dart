import 'package:json_annotation/json_annotation.dart';

import 'activities_and_cources_data_model.dart';

part 'activities_and_courses_model.g.dart';

@JsonSerializable()
class ActivitiesAndCoursesModel {
  @JsonKey(name: "totalCount")
  int? count;
  @JsonKey(name: "pagedResult")
  List<ActivitiesAndCoursesDataModel>? data;

  ActivitiesAndCoursesModel(
      {this.count, this.data});

  factory ActivitiesAndCoursesModel.fromJson(Map<String, dynamic> json) =>
      _$ActivitiesAndCoursesModelFromJson(json);

  Map<String, dynamic> toJson() => _$ActivitiesAndCoursesModelToJson(this);
}
