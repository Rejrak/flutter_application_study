

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter_application_study/data/remote/app_exception.dart';
import 'package:flutter_application_study/data/remote/network/base_api_service.dart';

class NetWorkApiService extends BaseApiService{
  @override
  Future post(String url, dynamic data) async{
    dynamic responseJson;
    try{
      final response = await http.post(
        Uri.parse(BASE_URL + url),
        headers: <String, String>
        {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(data),
      );
      responseJson = returnResponse(response);
    } on SocketException{
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }


  dynamic returnResponse(http.Response response){
    switch (response.statusCode){
      case 200:
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException('Error occurred while communication with server with status code : ${response.statusCode}');
    }
  }
  
}