import 'dart:convert';

import 'package:familyapp/core/api/index.dart';
import 'package:http/http.dart' as http;

Future<dynamic> postMethod({EndPoint endPoint, dynamic bodyData, String endpoint}) async {
  try {
    String url = mainURL + endpoint;
    final response = await http.post(
      Uri.parse(url),
      body: bodyData,
      headers: {
        "Accept": "application/json",
      },
    );

    var responseDecoded = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return {
        "code": response.statusCode,
        // "msg": responseDecoded['message'],
        "body": responseDecoded,
      };
    } else {
      return {
        // "msg": responseDecoded['message'],
        "code": response.statusCode,
      };
    }
  } catch (e) {
    return e;
  }
}

Future<dynamic> postWithHeader({EndPoint endPoint, dynamic bodyData, String endpoint}) async {
  try {
    String url = mainURL + endpoint;
    final response = await http.post(
      Uri.parse(url),
      body: bodyData,
      headers: setHeader(accessToken),
    );

    var responseDecoded = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return {
        "code": response.statusCode,
        "msg": responseDecoded['message'],
        "body": responseDecoded['data'],
      };
    } else {
      return {
        "msg": responseDecoded['message'],
        "code": response.statusCode,
      };
    }
  } catch (e) {
    return e;
  }
}

Future<dynamic> getMethod({
  EndPoint endPoint,
  dynamic bodyData,
  String endpoint,
}) async {
  try {
    String url = mainURL + endpoint;
    final response = await http.get(
      Uri.parse(url),
      // body: bodyData,
      headers: setHeader(accessToken),
    );
    var responseDecoded = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return {
        "code": response.statusCode,
        "msg": responseDecoded['message'],
        "body": responseDecoded['data'],
      };
    } else {
      return {
        "msg": responseDecoded['message'],
        "code": response.statusCode,
      };
    }
  } catch (e) {
    return e;
  }
}
