import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_names.dart';
import 'package:mvvm/view/login.dart';
import 'package:mvvm/view/sign_up.dart';
import '../../view/home.dart';

class Routes{
  static Route<dynamic> generateRoutes(RouteSettings settings){
      switch(settings.name){
        case RouteName.home:
          return MaterialPageRoute(builder: (context) => const HomeScreen());

        case RouteName.login:
          return MaterialPageRoute(builder: (context) => const LoginScreen());

        case RouteName.signUp:
          return MaterialPageRoute(builder: (context) => const SignUpScreen());

        default:
         return MaterialPageRoute(builder: (_){return Scaffold(body: Center(child: Text("NO routes Found")));});
      }
  }
}