import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_study/models/user_model.dart';
import 'package:flutter_application_study/view/signup_screen.dart';
import 'package:flutter_application_study/view/widget/my_text_widget.dart';
import 'package:flutter_application_study/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';
import '../res/app_context_extensions.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "login_screen";

  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final UserViewModel userViewModel = UserViewModel();
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: MyTextWidget(
                  label: context.resources.strings.SigninScreenTitle)),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: Container(
          alignment: Alignment.center,
          child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(children: [
                    Container(
                      alignment: Alignment.center,
                      width: context.resources.dimension.formWidth,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            icon: const Icon(Icons.person),
                            hintText: context.resources.strings.Email,
                            labelText: context.resources.strings.Email),
                        onChanged: (value) =>
                            context.read<UserViewModel>().Email = value,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: context.resources.dimension.formWidth,
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            icon: const Icon(Icons.password),
                            hintText: context.resources.strings.Password,
                            labelText: context.resources.strings.Password),
                        onChanged: (value) =>
                            context.read<UserViewModel>().Password = value,
                      ),
                    ),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(

                              padding: EdgeInsets.symmetric(
                                  vertical: context.resources.dimension.mediumElevation,
                                  horizontal: context.resources.dimension.mediumMargin
                                  ),
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (_formkey.currentState!.validate()) {
                                      String email = context.read<UserViewModel>().Email;
                                      String password = context.read<UserViewModel>().Password;
                                      UserModel user = UserModel(email: email, password: password);
                                      _onSignUp(context, user);
                                    }
                                  },
                                  child: const Text('SignUp'))
                                  ),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: context.resources.dimension.mediumElevation,
                                  horizontal: context.resources.dimension.mediumMargin

                                  ),
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (_formkey.currentState!.validate()) {
                                      String email =
                                          context.read<UserViewModel>().Email;
                                      String password = context
                                          .read<UserViewModel>()
                                          .Password;
                                      UserModel user = UserModel(
                                          email: email, password: password);
                                      _onLogin(context, user);
                                    }
                                  },
                                  child: const Text('Submit'))
                                  )
                        ]),
                  ]),
                ],
              )),
        ));
  }

  void _onLogin(BuildContext context, UserModel user) {
    context.read<UserViewModel>().login(user);
  }

  void _onSignUp(BuildContext context, UserModel user){
    Navigator.push(context,MaterialPageRoute(builder: (context) => SignUpScreen()));
  }
}
