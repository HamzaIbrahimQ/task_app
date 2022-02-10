import 'package:json_annotation/json_annotation.dart';
import 'package:task_app/models/categories_data_model.dart';

part 'categories_model.g.dart';



@JsonSerializable()
class CategoriesModel {
  @JsonKey(name: "result")
  List<CategoriesDataModel>? categories;
  @JsonKey(name: "errorMessage")
  String? errorMessage;
  @JsonKey(name: "timeGenerated")
  String? time;

  CategoriesModel({this.categories, this.errorMessage, this.time});


  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesModelToJson(this);
}
