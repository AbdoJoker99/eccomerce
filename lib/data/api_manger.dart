import 'dart:convert';

import 'package:ecomm/data/model/request/loginRequest.dart';
import 'package:ecomm/data/model/response/Register_Response.dart';
import 'package:ecomm/data/model/response/login_Response.dart';
import 'package:http/http.dart' as http;

import 'end_points.dart';
import 'model/request/Register_Request.dart';

class ApiManager {
  static const String baseUrl = 'ecommerce.routemisr.com';

  // Register method
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
      print('Making request to: $url'); // Debugging line
      var response = await http.post(
        url,
        body: jsonEncode(registerRequest.toJson()), // Encode request as JSON
      );

      print('Response status: ${response.statusCode}'); // Debugging line

      // Check if the response status code is 2xx
      if (response.statusCode >= 200 && response.statusCode < 300) {
        var registerResponse = jsonDecode(response.body);
        return RegisterResponse.fromJson(registerResponse);
      } else {
        // Handle errors like 4xx or 5xx
        var errorResponse = jsonDecode(response.body);
        throw Exception('Failed to register: ${errorResponse['message']}');
      }
    } catch (e) {
      throw Exception('Error registering: $e');
    }
  }

  // Login method
  static Future<LoginResponse> login(String email, String password) async {
    Uri url = Uri.https(baseUrl, EndPoints.login);
    var loginRequest = LoginRequest(email: email, password: password);

    try {
      print('Making request to: $url'); // Debugging line
      var response = await http.post(
        url,
        body: jsonEncode(loginRequest.toJson()), // Encode request as JSON
      );

      print('Response status: ${response.statusCode}'); // Debugging line

      // Check if the response status code is 2xx
      if (response.statusCode >= 200 && response.statusCode < 300) {
        var loginResponse = jsonDecode(response.body);
        return LoginResponse.fromJson(loginResponse);
      } else {
        // Handle errors like 4xx or 5xx
        var errorResponse = jsonDecode(response.body);
        throw Exception('Failed to login: ${errorResponse['message']}');
      }
    } catch (e) {
      throw Exception('Error logging in: $e');
    }
  }
}
