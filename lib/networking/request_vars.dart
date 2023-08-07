class RequestVar {
  static Map<String, String> getTokenRequest() {
    Map<String, String> tokenRequest = {
      'request': 'login',
      'login': 'tech@freelancers-blag.ru',
      'password': 'Vjnbdfwbz21',
    };
    return tokenRequest;
  }

  static Map<String, String> getStatusRequest(token) {
    Map<String, String> statusRequest = {
      'request': 'getClientStatuses',
      'token': '$token',
    };
    return statusRequest;
  }

  static Map<String, String> getCargosListRequest(token) {
    Map<String, String> statusRequest = {
      'request': 'getClientIntransit',
      'token': '$token',
      'codes': '817-AS'
    };
    return statusRequest;
  }
}
