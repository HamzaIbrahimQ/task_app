import 'package:json_annotation/json_annotation.dart';

part 'activities_and_cources_data_model.g.dart';


@JsonSerializable()
class ActivitiesAndCoursesDataModel {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "trainerId")
  int? trainerId;
  @JsonKey(name: "trainerName")
  String? trainerName;
  @JsonKey(name: "totalHours")
  int? totalHours;
  @JsonKey(name: "startDate")
  String? startDate;
  @JsonKey(name: "eventType")
  String? eventType;
  @JsonKey(name: "category")
  String? category;
  @JsonKey(name: "image")
  String? imagePath;

  ActivitiesAndCoursesDataModel(
      {this.id,
      this.title,
      this.description,
      this.trainerId,
      this.trainerName,
      this.totalHours,
      this.startDate,
      this.eventType,
      this.category,
      this.imagePath});


  factory ActivitiesAndCoursesDataModel.fromJson(Map<String, dynamic> json) =>
      _$ActivitiesAndCoursesDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ActivitiesAndCoursesDataModelToJson(this);

}
