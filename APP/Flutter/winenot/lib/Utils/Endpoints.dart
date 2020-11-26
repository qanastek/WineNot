import 'package:http/http.dart' as http;

class Endpoints {

  // The base url
  // static const String baseUrl = "http://127.0.0.1:8000/";
  static const String baseUrl = "http://192.168.0.29:3000";

  // Logon
  static String logon() {
    return "${Endpoints.baseUrl}/user_token";
  }

  // Get wines
  static Future wines() async {
    var url = "${Endpoints.baseUrl}/wines.json";
    return http.get(url);
  }

  // Get wine
  static String wine(int wineId) {
    return "${Endpoints.baseUrl}/wines/$wineId.json";
  }

  // Get reviews
  static String reviews(int wineId) {
    return "${Endpoints.baseUrl}/wines/$wineId.json";
  }

  // Send Image
  static String sendImage() {
    return "${Endpoints.baseUrl}/sendImage";
  }
}