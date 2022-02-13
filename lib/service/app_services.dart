import 'dart:convert';

import 'package:aara_assignment/model/product_model.dart';
import 'package:aara_assignment/model/response_model.dart';
import 'package:http/http.dart' as http;

class AppService {
  final String _baseUrl = 'https://zzzmart.com/admin/ecommerce_api';
  AppService._();

  static final AppService instance = AppService._();

  Future<ResponseModel> _makeGetCall(String path) async {
    final data = await http.get(Uri.parse('$_baseUrl$path'));
    final jsonData = (json.decode(data.body)[0]);
    final res = ResponseModel.fromJson(jsonData);
    if (res.status != 0) {
      return res;
    } else {
      throw Exception(res.msg ?? 'Something went wrong');
    }
  }

  Future<ResponseModel> _makePostCall(
      String path, Map<String, dynamic> body) async {
    final data = await http.post(Uri.parse('$_baseUrl$path'), body: body);
    final jsonData = (json.decode(data.body)[0]);
    final res = ResponseModel.fromJson(jsonData);
    if (res.status != 0) {
      return res;
    } else {
      throw Exception(res.msg ?? 'Something went wrong');
    }
  }

  Future<ResponseModel> registerUser({
    required String name,
    required String email,
    required String phone,
    required String gender,
    required String address,
    required String password,
  }) async {
    return await _makePostCall('/customer_login.php?apicall=new_register', {
      'CustomerName': name,
      'CustomerEmail': email,
      'CustomerPhone': phone,
      'CustomerGender': gender,
      'CustomerAddress': address,
      'CustomerPassword': password
    });
  }

  Future<ResponseModel> verifyOTP({
    required String phone,
    required String otp,
  }) async {
    return await _makePostCall('/customer_login.php?apicall=get_otp_verify', {
      'Mobile': phone,
      'OTP': otp,
    });
  }

  Future<ResponseModel> login({
    required String phone,
    required String password,
  }) async {
    return await _makePostCall('/customer_login.php?apicall=login', {
      'Username': phone,
      'Password': password,
    });
  }

  Future<List<ProductModel>> getProducts() async {
    final data =
        await _makeGetCall('/category/cat_read.php?apicall=category_list');
    List<ProductModel> products = [];
    for (var element in (data.data as List)) {
      products.add(ProductModel.fromJson(element));
    }
    return products;
  }
}
