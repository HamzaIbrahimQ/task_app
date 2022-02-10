// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activities_and_cources_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivitiesAndCoursesDataModel _$ActivitiesAndCoursesDataModelFromJson(
        Map<String, dynamic> json) =>
    ActivitiesAndCoursesDataModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      trainerId: json['trainerId'] as int?,
      trainerName: json['trainerName'] as String?,
      totalHours: json['totalHours'] as int?,
      startDate: json['startDate'] as String?,
      eventType: json['eventType'] as String?,
      category: json['category'] as String?,
      imagePath: json['image'] as String?,
    );

Map<String, dynamic> _$ActivitiesAndCoursesDataModelToJson(
        ActivitiesAndCoursesDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'trainerId': instance.trainerId,
      'trainerName': instance.trainerName,
      'totalHours': instance.totalHours,
      'startDate': instance.startDate,
      'eventType': instance.eventType,
      'category': instance.category,
      'image': instance.imagePath,
    };
