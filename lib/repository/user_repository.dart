import 'dart:developer';

import '../data/remote/network/network_api_service.dart';
import '../data/remote/network/api_end_points.dart';
import '../data/remote/network/base_api_service.dart';
import '../models/user_model.dart';

class UserRepository {
  final BaseApiService _apiService = NetWorkApiService();

  @override
  Future<String?> postLogin(UserModel user) async {
    try{
      dynamic response = await _apiService.post(ApiEndPoints().LOGIN, user.toJson());
      return response.toString();
    } catch (e){
      throw e;
    }
  }

  @override
  Future<String?> postSignup(dynamic user) async {
    try {
      dynamic response = await _apiService.post(ApiEndPoints().SIGNUP, user);
      final jsonData = UserModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
