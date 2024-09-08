import 'dart:convert';

import 'package:ecomm/data/model/Register_Response.dart';
import 'package:http/http.dart' as http;

import 'end_points.dart';
import 'model/Register_Request.dart';

class ApiManager {
  static const String baseUrl = 'ecommerce.routemisr.com';
  /*
  https://ecommerce.routemisr.com/api/v1/auth/signup
  */
  static Future<RegisterResponse> register(String name, String email,
      String password, String phone, String rePassword) async {
    Uri url = Uri.https(baseUrl, EndPoints.signUp);
    var registerRequest = RegisterRequest(
      name: name,
      email: email,
      password: password,
      phone: phone,
      rePassword: rePassword,
    );
    try {
      var response = await http.post(url, body: registerRequest.toJson());
      var bodyString = response.body;
      jsonDecode(bodyString);
      return RegisterResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
