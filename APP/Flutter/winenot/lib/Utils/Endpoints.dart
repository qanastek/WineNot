class Endpoints {

  // The base url
  static const String baseUrl = "http://127.0.0.1:8000/";

  // Logon
  static String logon(String username, String password) {
    return "${Endpoints.baseUrl}/login$username&p3=$password";
  }

  // Send Image
  static String sendImage() {
    return "${Endpoints.baseUrl}/sendImage";
  }
}