import 'package:flutter/material.dart';
import 'package:flutter_application_study/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';
import 'view/login_screen.dart';
import 'view/signup_screen.dart';
void main() {
  // runApp(MyApp());

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => UserViewModel())
  ],
  child: MyApp(),
  )
  );
}

class MyApp extends StatelessWidget{
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: LoginScreen.id,
    routes: {
      LoginScreen.id :(context) => LoginScreen(),
      SignUpScreen.id:(context) => SignUpScreen()
      },
    );
  }
}