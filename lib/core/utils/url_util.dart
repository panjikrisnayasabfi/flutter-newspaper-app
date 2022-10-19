import 'dart:convert';

import 'package:flutter_newspaper_app/core/resources/value.dart';

class UrlString {
  static String baseUrlGw = 'https://gateway-dev.bfi.co.id/';
  static String username = usernameConfigDev;
  static String password = usernameConfigDev;

  static String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));

  static final Map<String, String> headerType = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };

  static Map<String, String> headerTypeWithToken(String token) => {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      };

  static Map<String, String> headerTypeBasicAuth() => {
        'Authorization': basicAuth,
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      };

  Map<String, String> getHeaderTypeBasicAuth() {
    return headerTypeBasicAuth();
  }

  Map<String, String> getHeaderTypeWithToken(String token) {
    return headerTypeWithToken(token);
  }

  //URL Sample
  static String urlSample() => 'lalala/lalala';

  String getUrlSample() {
    final String urlSample2 = urlSample();
    return baseUrlGw + urlSample2;
  }
}
