// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesDataModel _$CategoriesDataModelFromJson(Map<String, dynamic> json) =>
    CategoriesDataModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      logoPath: json['logoPath'] as String?,
      categoryImages: json['categoryImages'] as String?,
      categoryVideos: json['categoryVideos'] as String?,
      errorMessage: json['errorMessage'] as String?,
      time: json['timeGenerated'] as String?,
    );

Map<String, dynamic> _$CategoriesDataModelToJson(
        CategoriesDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'logoPath': instance.logoPath,
      'categoryImages': instance.categoryImages,
      'categoryVideos': instance.categoryVideos,
      'errorMessage': instance.errorMessage,
      'timeGenerated': instance.time,
    };
