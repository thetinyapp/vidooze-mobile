import 'package:json_annotation/json_annotation.dart';
import 'package:vidooze_mobile/data/dto/response/token_response/token_response.dart';
import 'package:vidooze_mobile/data/dto/response/user_response/user_response.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: "auth")
  final TokenResponse token;

  @JsonKey(name: "user")
  final UserResponse user;

  LoginResponse({
    required this.token,
    required this.user,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
