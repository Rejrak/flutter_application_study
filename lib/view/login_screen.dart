import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_study/data/remote/response/api_status.dart';
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
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
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
                                  vertical: context
                                      .resources.dimension.mediumElevation,
                                  horizontal:
                                      context.resources.dimension.mediumMargin),
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (_formkey.currentState!.validate()) {
                                      _onSignUp(
                                          context,
                                          UserModel(
                                              email: context
                                                  .read<UserViewModel>()
                                                  .Email,
                                              password: context
                                                  .read<UserViewModel>()
                                                  .Password));
                                    }
                                  },
                                  child: const Text('SignUp'))),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: context
                                      .resources.dimension.mediumElevation,
                                  horizontal:
                                      context.resources.dimension.mediumMargin),
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (_formkey.currentState!.validate()) {
                                      _onLogin(
                                          context,
                                          UserModel(
                                              email: context
                                                  .read<UserViewModel>()
                                                  .Email,
                                              password: context
                                                  .read<UserViewModel>()
                                                  .Password));
                                    }
                                  },
                                  child: const Text('Submit'))),
                          Consumer<UserViewModel>(
                            builder: ((context, userViewModel, _) {
                              switch (userViewModel.Response.status) {
                                case ApiStatus.COMPLETED:
                                  return  Text('Logged in');
                                case ApiStatus.LOADING:
                                  return Text('');
                                case ApiStatus.ERROR:
                                default:
                                  return Text('Error');
                              }
                          }))
                        ]),
                  ]),
                ],
              )),
        ));
  }

  void _onLogin(BuildContext context, UserModel user) {
    context.read<UserViewModel>().login(user);
    log("${context.read<UserViewModel>().Response}");
  }

  void _onSignUp(BuildContext _context, UserModel user) {
    Navigator.of(_context).pushAndRemoveUntil(
      MaterialPageRoute<void>(builder: (context) => SignUpScreen()),
      ModalRoute.withName(LoginScreen.id),
    );
  }
}
