
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_study/models/user_model.dart';
import '../data/remote/response/api_response.dart';
import '../repository/user_repository.dart';

class UserViewModel extends ChangeNotifier{
  final _myRepo = UserRepository();
  ApiResponse<String> token = ApiResponse.loading();

  String email = "";
  String password = "";

  String get Email => email;
  String get Password => password;

  void set Email(String value){
    email = value;
    notifyListeners();
  }
  void set Password(String value){
    password = value;
    notifyListeners();
  }

  void _setToken(ApiResponse<String> response){
    token = response.data.toString() as ApiResponse<String>;
    notifyListeners();
  }

  Future<void> login(UserModel user) async { 
    
    _setToken(ApiResponse.loading());
    _myRepo.postLogin(user)
          .then((value) => _setToken(ApiResponse.completed(value)))
          .onError((error, stackTrace) => _setToken(ApiResponse.error(error.toString())));

  }
}