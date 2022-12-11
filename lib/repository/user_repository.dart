import 'dart:developer';

import '../data/remote/network/network_api_service.dart';
import '../data/remote/network/api_end_points.dart';
import '../data/remote/network/base_api_service.dart';
import '../models/user_model.dart';

class UserRepository {
  final BaseApiService _apiService = NetWorkApiService();

  @override
  Future<Map<String, dynamic>> postLogin(UserModel user) async {
    try{
      dynamic response = await _apiService.post(ApiEndPoints().LOGIN, user.toJson());
      return response;
    } catch (e){
      throw e;
    }
  }

  @override
  Future<dynamic> postSignup(UserModel user) async {
    try {
      dynamic response = await _apiService.post(ApiEndPoints().SIGNUP, user.toJson());
      return response;
    } catch (e) {
      throw e;
    }
  }
}
