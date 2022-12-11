abstract class BaseApiService{
  final String BASE_URL = "http://localhost:5000";

  Future<dynamic> post(String url, dynamic data);
}