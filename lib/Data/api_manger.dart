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
      var token = SharedPreferenceUtils.getData(key: 'token');
      var response = await http.post(url,
          body: {'productId': productId}, headers: {'token': token.toString()});
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var addCartResponse = AddCartResponse.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(addCartResponse);
      } else {
        return Left(ServerError(errorMessage: addCartResponse.message!));
      }
    } catch (e) {
      return Left(NetworkError(errorMessage: e.toString()));
    }
  }

  static Future<Either<Failures, GetProductCartResponse>> getCart() async {
    Uri url = Uri.https(baseUrl, EndPoints.addToCart);

    try {
      var token = SharedPreferenceUtils.getData(key: 'token');
      var response = await http.get(url, headers: {'token': token.toString()});
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var getCartResponse = GetProductCartResponse.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(getCartResponse);
      } else {
        return Left(ServerError(errorMessage: getCartResponse.message!));
      }
    } catch (e) {
      return Left(NetworkError(errorMessage: e.toString()));
    }
  }

  static Future<Either<Failures, GetProductCartResponse>> deleteItemInCart(
      String productId) async {
    Uri url = Uri.https(baseUrl, '${EndPoints.addToCart}/$productId');

    try {
      var token = SharedPreferenceUtils.getData(key: 'token');
      var response =
          await http.delete(url, headers: {'token': token.toString()});
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var deleteItemInCartResponse = GetProductCartResponse.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(deleteItemInCartResponse);
      } else {
        return Left(
            ServerError(errorMessage: deleteItemInCartResponse.message!));
      }
    } catch (e) {
      return Left(NetworkError(errorMessage: e.toString()));
    }
  }

  static Future<Either<Failures, GetProductCartResponse>> updateCountInCart(
      String productId, int count) async {
    Uri url = Uri.https(baseUrl, '${EndPoints.addToCart}/$productId');

    try {
      var token = SharedPreferenceUtils.getData(key: 'token');
      var response = await http.put(url,
          body: {'count': '$count'}, headers: {'token': token.toString()});
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      var updateCountInCartResponse = GetProductCartResponse.fromJson(json);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Right(updateCountInCartResponse);
      } else {
        return Left(ServerError(
          errorMessage: updateCountInCartResponse.message!,
        ));
      }
    } catch (e) {
      return Left(NetworkError(errorMessage: e.toString()));
    }
  }

  static Future<ProductResponse> getFavouriteProducts() async {
    try {
      Uri url = Uri.https(baseUrl, EndPoints.getFavouriteProducts);
      var response = await http.post(url);
      return ProductResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }

  static Future<ProductResponse> getProfile() async {
    try {
      Uri url = Uri.https(baseUrl, EndPoints.getProfile);
      var response = await http.post(url);
      return ProductResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }
}
