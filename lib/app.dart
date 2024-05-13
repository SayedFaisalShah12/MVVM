import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes.dart';
import 'package:mvvm/utils/routes/routes_names.dart';
import 'package:mvvm/view/login.dart';
import 'package:mvvm/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ],
      child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      initialRoute:  RouteName.login,
      onGenerateRoute: Routes.generateRoutes,
    ),
    );
  }
}