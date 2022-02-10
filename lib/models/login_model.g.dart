// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginModel _$LoginModelFromJson(Map<String, dynamic> json) => LoginModel(
      token: json['result'] as String?,
      errorMessage: json['errorMessage'] as String?,
      time: json['timeGenerated'] as String?,
    );

Map<String, dynamic> _$LoginModelToJson(LoginModel instance) =>
    <String, dynamic>{
      'result': instance.token,
      'errorMessage': instance.errorMessage,
      'timeGenerated': instance.time,
    };
