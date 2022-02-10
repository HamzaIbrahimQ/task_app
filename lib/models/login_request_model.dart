


class LoginRequest {
  String userName;
  String password;

  LoginRequest({
    required this.userName,
    required this.password,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) {
    return LoginRequest(
      userName: json['userName'] as String,
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userName'] = userName;
    data['password'] = password;
    return data;
  }
}
