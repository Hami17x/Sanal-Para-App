import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_sanalira_app/model/bank_model.dart';

abstract class IBankService {
  Future getBanks();
}

class BankService extends IBankService {
  final Dio _dio = Dio(BaseOptions(baseUrl: "https://api.sanalira.com"));
  @override
  Future getBanks() async {
    try {
      var response = await _dio.get('/assignment');
      if (response.statusCode == HttpStatus.ok) {
        if (response.data["response"]["code"] == 200) {
          final jsonBody = response.data["data"];
          if (jsonBody is List) {
            return jsonBody.map((e) => BankModel.fromJson(e)).toList();
          }
        }
      }
    } on DioError catch (e) {
      return Future.error(e.message);
    }
  }
}
