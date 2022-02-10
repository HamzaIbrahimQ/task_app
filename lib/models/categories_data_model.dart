

import 'package:json_annotation/json_annotation.dart';
import 'package:task_app/models/activities_and_courses_model.dart';

part 'categories_data_model.g.dart';



@JsonSerializable()
class CategoriesDataModel {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "description")
  String? description;
  @JsonKey(name: "logoPath")
  String? logoPath;
  @JsonKey(name: "categoryImages")
  String? categoryImages;
  @JsonKey(name: "categoryVideos")
  String? categoryVideos;
  @JsonKey(name: "errorMessage")
  String? errorMessage;
  @JsonKey(name: "timeGenerated")
  String? time;


  CategoriesDataModel({this.id, this.name, this.description, this.logoPath, this.categoryImages, this.categoryVideos, this.errorMessage, this.time});


  factory CategoriesDataModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesDataModelToJson(this);
}






