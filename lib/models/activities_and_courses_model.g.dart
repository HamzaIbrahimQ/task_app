// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activities_and_courses_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivitiesAndCoursesModel _$ActivitiesAndCoursesModelFromJson(
        Map<String, dynamic> json) =>
    ActivitiesAndCoursesModel(
      count: json['totalCount'] as int?,
      data: (json['pagedResult'] as List<dynamic>?)
          ?.map((e) =>
              ActivitiesAndCoursesDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ActivitiesAndCoursesModelToJson(
        ActivitiesAndCoursesModel instance) =>
    <String, dynamic>{
      'totalCount': instance.count,
      'pagedResult': instance.data,
    };
