// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainResponseModel _$MainResponseModelFromJson(Map<String, dynamic> json) =>
    MainResponseModel(
      activitiesOrCourses: json['result'] == null
          ? null
          : ActivitiesAndCoursesModel.fromJson(
              json['result'] as Map<String, dynamic>),
      errorMessage: json['errorMessage'] as String?,
      time: json['timeGenerated'] as String?,
    );

Map<String, dynamic> _$MainResponseModelToJson(MainResponseModel instance) =>
    <String, dynamic>{
      'result': instance.activitiesOrCourses,
      'errorMessage': instance.errorMessage,
      'timeGenerated': instance.time,
    };
