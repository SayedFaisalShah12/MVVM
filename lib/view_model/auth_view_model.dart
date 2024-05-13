import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utils/utils.dart';

class AuthViewModel with ChangeNotifier{
  final myRepo = AuthRepository();

  Future<void> loginApi(dynamic data, BuildContext context) async{
    myRepo.loginApi(data).then((value) {
      Utils.flushBarErrorMessage("Login Successful", context);
        print(value.toString());

    }).onError((error, stackTrace) {
          Utils.flushBarErrorMessage(error.toString(), context);
          print(error.toString());
    });
  }

  Future<void> registerApi(dynamic data, BuildContext context) async{
    myRepo.registerApi(data).then((value) {
      Utils.flushBarErrorMessage("SignUp Successfully", context);
      print(value.toString());

    }).onError((error, stackTrace) {
      Utils.flushBarErrorMessage(error.toString(), context);
      print(error.toString());
    });
  }
}