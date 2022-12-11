
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_study/models/user_model.dart';
import '../data/remote/response/api_response.dart';
import '../repository/user_repository.dart';

class UserViewModel with ChangeNotifier{
  final _myRepo = UserRepository();
  
  ApiResponse<String> _response = ApiResponse.loading();
  String _email = "";
  String password = "";

  String get Email => _email;
  String get Password => password;
  ApiResponse<String> get Response => _response;

  void set Email(String value){
    _email = value;
    notifyListeners();
  }
  void set Password(String value){
    password = value;
    notifyListeners();
  }

  void set Response(ApiResponse<String> value){
    _response = value;
    notifyListeners();
  } 

  void _setResponse(ApiResponse<String> value) => Response = value;

  Future<void> login(UserModel user) async { 
    Response = ApiResponse.loading();
    _myRepo
      .postLogin(user)
      .then((value) => _setResponse(ApiResponse.completed(value.toString())))
      .onError((error, stackTrace) => _setResponse(ApiResponse.error(error.toString())));
      log("DUE : $Response");

  }

  Future<void> signup(UserModel user) async {
    Response = ApiResponse.loading();
    _myRepo
      .postSignup(user)
      .then((value) => _setResponse(ApiResponse.completed(value.toString())))
      .onError((error, stackTrace) => _setResponse(ApiResponse.error(error.toString())));
  }
}