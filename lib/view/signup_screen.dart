import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_study/data/remote/response/api_status.dart';
import 'package:flutter_application_study/view/login_screen.dart';
import 'package:flutter_application_study/view/widget/my_text_widget.dart';
import 'package:flutter_application_study/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';
import '../data/remote/response/api_response.dart';
import '../models/user_model.dart';
import '../res/app_context_extensions.dart';

class SignUpScreen extends StatefulWidget {
  static const String id = "signup_screen";

  @override
  _SignUpScreen createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {
  UserViewModel userViewModel = UserViewModel();
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
                  label: context.resources.strings.SignUpScreenTitle)),
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
                            hintText: context.resources.strings.ConfirmPassword,
                            labelText: context.resources.strings.ConfirmPassword),
                        onChanged: (value) =>
                            context.read<UserViewModel>().Password = value,
                        validator: (value) {
                          if (value != context.read<UserViewModel>().Password){
                            return "Password does not match";
                          }
                        }
                      ),
                    ),
                    Consumer<UserViewModel>(
                      builder: (context, value, _) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: context.resources.dimension.mediumElevation),
                          child: ElevatedButton(
                              onPressed: () {
                                if (_formkey.currentState!.validate()) {
                                  UserModel user = UserModel(email: value.Email, password: value.password);
                                  _onSignUp(context,user,value.Response);
                                }
                              },
                              child: const Text('SignUp')));
                      },
                    )
                    
                  ]),
                ],
              )),
        ));
  }

  void _onSignUp(BuildContext context, UserModel user, ApiResponse<String?> Response) {
    context.read<UserViewModel>().signup(user);
    switch(Response.status){
      case ApiStatus.COMPLETED:
        Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute<void>(builder: (context) => LoginScreen()),
                ModalRoute.withName(SignUpScreen.id),
              );
        break;
      default:
        log("${Response.message}");
    }
  }
}
