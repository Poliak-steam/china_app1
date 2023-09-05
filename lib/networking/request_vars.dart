import 'package:hl_flutter_app/storage/secure_storage.dart';

class RequestVar {
  static Map<String, String> getTokenRequest() {
    Map<String, String> tokenRequest = {
      'request': 'login',
      'login': 'tech@freelancers-blag.ru',
      'password': 'Vjnbdfwbz21',
    };
    return tokenRequest;
  }

  static Future<Map<String, String>> getStatusRequest() async  {
    Map<String, String> statusRequest = {
      'request': 'getClientStatuses',
      'token': '${await SecureStorage.getToken()}',
    };
    return statusRequest;
  }

  static Future<Map<String, String>> getCargosListRequest() async {
    Map<String, String> statusRequest = {
      'request': 'getClientIntransit',
      'token': '${await SecureStorage.getToken()}',
      'codes': '817-AS'
    };
    return statusRequest;
  }
  static Map<String, String> getTest() {
    Map<String, String> statusRequest = {
      'request': 'tes'
    };
    return statusRequest;
  }
}

