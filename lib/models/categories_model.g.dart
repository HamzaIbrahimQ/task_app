// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesModel _$CategoriesModelFromJson(Map<String, dynamic> json) =>
    CategoriesModel(
      categories: (json['result'] as List<dynamic>?)
          ?.map((e) => CategoriesDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      errorMessage: json['errorMessage'] as String?,
      time: json['timeGenerated'] as String?,
    );

Map<String, dynamic> _$CategoriesModelToJson(CategoriesModel instance) =>
    <String, dynamic>{
      'result': instance.categories,
      'errorMessage': instance.errorMessage,
      'timeGenerated': instance.time,
    };
