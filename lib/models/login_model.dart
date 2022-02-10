import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';




@JsonSerializable()
class LoginModel {
  @JsonKey(name: "result")
  String? token;
  @JsonKey(name: "errorMessage")
  String? errorMessage;
  @JsonKey(name: "timeGenerated")
  String? time;


  LoginModel({this.token, this.errorMessage, this.time});


  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);




}
