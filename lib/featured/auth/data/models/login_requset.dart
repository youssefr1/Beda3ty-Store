
import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_requset.g.dart';
@JsonSerializable()
class LoginRequset{
  LoginRequset({required this.email, required this.password});

final String email;
final String password;
Map<String,dynamic> toJson() => _$LoginRequsetToJson(this);

}