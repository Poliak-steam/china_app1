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

  static Future<Map<String, String>> checkAppClientToPhone(phone) async{
    Map<String, String> AppCkeck = {
      'request': 'checkAppClientToPhone',
      'token': '${await SecureStorage.getToken()}',
      'phone': '79996812521',
    };
    return AppCkeck;
  }

  static Future<Map<String, String>> insertAppClientFcmToken(fcmToken,clientId) async{
    Map<String, String> fcmregister = {
      'request': 'insertAppClientFcmToken',
      'token': '${await SecureStorage.getToken()}',
      'fcmToken': '$fcmToken',
      'clientId': '$clientId',
    };
    return fcmregister;
  }

  static Map<String, String> getTest() {
    Map<String, String> statusRequest = {
      'request': 'test'
    };
    return statusRequest;
  }
}

