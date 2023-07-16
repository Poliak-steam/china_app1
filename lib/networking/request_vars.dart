import 'package:flutter/material.dart';
import 'package:china_app/networking/data_requests.dart';

class RequestVar {

  static Map<String,String> getTokenRequest() {
    Map<String,String> tokenRequest = {
      'request':'login',
      'login':'tech@freelancers-blag.ru',
      'password':'Vjnbdfwbz21',
    };
    return tokenRequest;
  }

  static Map<String,String> getStatusRequest(token) {
     Map<String,String> statusRequest = {
      'request':'getClientStatuses',
      'token':'$token',
    };
    return statusRequest;
  }


}