import 'package:keepo/models/login_model.dart';
import 'package:keepo/models/profile/profile_model.dart';

class UserService {
  LoginModel? _user;
  LoginModel? get getUser => _user;

  set setUser(LoginModel value) {
    _user = value;
  }
}
