import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecomm/Data/model/failures.dart';
import 'package:ecomm/Data/model/response/ProductResponse.dart';
import 'package:ecomm/Data/model/response/categoryOrBrandResponse.dart';
import 'package:ecomm/Data/model/response/getProductCartResponse.dart';
import 'package:ecomm/data/model/request/loginRequest.dart';
import 'package:ecomm/data/model/response/Register_Response.dart';
import 'package:ecomm/data/model/response/login_Response.dart';
import 'package:ecomm/share_prefrance_utils.dart';
import 'package:http/http.dart' as http;

import 'end_points.dart';
import 'model/request/Register_Request.dart';
import 'model/response/AddCartResponse.dart';

class ApiManager {
  static const String baseUrl = 'ecommerce.routemisr.com';

  // Register method
  static Future<RegisterResponse> register(String name, String email,
      String password, String phone, String rePassword) async {
    var registerRequest = RegisterRequest(
      name: name,
      email: email,
      password: password,
      phone: phone,
      rePassword: rePassword,
    );
    Uri url = Uri.https(baseUrl, EndPoints.signUp);
    try {
      var response = await http.post(url, body: registerRequest.toJson());

      var bodyString = response.body;

      var json = jsonDecode(bodyString);

      return RegisterResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  // Login method
  static Future<LoginResponse> login(String email, String password) async {
    var loginRequest = LoginRequest(email: email, password: password);
    Uri url = Uri.https(baseUrl, EndPoints.login);
    try {
      var response = await http.post(url, body: loginRequest.toJson());

      var bodyString = response.body;

      var json = jsonDecode(bodyString);

      return LoginResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<CategoryOrBrandResponse> getAllCategories() async {
    Uri url = Uri.https(
      baseUrl,
      EndPoints.getAllCategories,
    );
    try {
      var response = await http.get(url);

      var bodyString = response.body;

      var json = jsonDecode(bodyString);

      return CategoryOrBrandResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<CategoryOrBrandResponse> getAllBrands() async {
    Uri url = Uri.https(
      baseUrl,
      EndPoints.getAllBrands,
    );
    try {
      var response = await http.get(url);

      var bodyString = response.body;

      var json = jsonDecode(bodyString);

      return CategoryOrBrandResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<ProductResponse> getAllProducts() async {
    Uri url = Uri.https(
      baseUrl,
      EndPoints.getAllProducts,
    );
    try {
      var response = await http.get(url);

      var bodyString = response.body;

      var json = jsonDecode(bodyString);

      return ProductResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<Either<Failures, AddCartResponse>> addToCart(
      String productId) async {
    Uri url = Uri.https(baseUrl, EndPoints.addToCart);

    try {
      // Retrieve the token safely
      var token = SharedPreferenceUtils.getData(key: "token");

      if (token == null || token.toString().isEmpty) {
        return Left(ServerError(errorMessage: "Token not found or invalid"));
      }

      var response = await http.post(
        url,
        body: {"productId": productId},
        headers: {"token": "Bearer ${token.toString()}"},
      );

      // Handle the HTTP status codes properly
      if (response.statusCode >= 200 && response.statusCode < 300) {
        var json = jsonDecode(response.body);
        var addCartResponse = AddCartResponse.fromJson(json);
        return Right(addCartResponse);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: "Unauthorized: Invalid token"));
      } else {
        // Decode the error message from the response
        var json = jsonDecode(response.body);
        String errorMessage = json['message'] ?? 'Unknown error';
        return Left(ServerError(errorMessage: "Error: $errorMessage"));
      }
    } catch (e) {
      // Catching exceptions
      return Left(ServerError(errorMessage: "Exception: ${e.toString()}"));
    }
  }

  static Future<Either<Failures, GetProductCartResponse>>
      getProductCart() async {
    Uri url = Uri.https(baseUrl, EndPoints.addToCart);

    try {
      // Retrieve the token safely
      var token = SharedPreferenceUtils.getData(key: "token");

      if (token == null || token.toString().isEmpty) {
        return Left(ServerError(errorMessage: "Token not found or invalid"));
      }

      var response = await http.get(
        url,
        headers: {"token": "${token.toString()}"},
      );

      // Handle the HTTP status codes properly
      if (response.statusCode >= 200 && response.statusCode < 300) {
        var json = jsonDecode(response.body);
        var getCartResponse = GetProductCartResponse.fromJson(json);
        return Right(getCartResponse);
      } else if (response.statusCode == 401) {
        return Left(ServerError(errorMessage: "Unauthorized: Invalid token"));
      } else {
        // Decode the error message from the response
        var json = jsonDecode(response.body);
        String errorMessage = json['message'] ?? 'Unknown error';
        return Left(ServerError(errorMessage: "Error: $errorMessage"));
      }
    } catch (e) {
      // Catching exceptions
      return Left(ServerError(errorMessage: "Exception: ${e.toString()}"));
    }
  }
}
