import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:todouser/model/postModel.dart';

import '../Config/dio_config.dart';

class GetService {
  static Future<dynamic> getUserApi() async {
    try {
      Response response = await DioConfig.createReq()
          .get("https://jsonplaceholder.typicode.com/users");
      if (response.statusCode == 200) {
        return response;
      } else {
        return "${response.statusCode} ${response.statusMessage}";
      }
    } on DioError catch (e) {
      switch (e.type) {
        case DioErrorType.connectionTimeout:
          return "Connection timeout";
        case DioErrorType.sendTimeout:
          return "Send timeout";
        case DioErrorType.receiveTimeout:
          return "Receive timeout";
        case DioErrorType.connectionError:
          return "Connection error";
        default:
          return "Unknown error";
      }
    }
  }

  static Future<dynamic> postDataApi(dynamic post) async {
    try {
      Response response = await DioConfig.createReq()
          .post("https://jsonplaceholder.typicode.com/posts", data: post);
      if (response.statusCode == 201) {
        return response;
      } else {
        return "${response.statusCode} ${response.statusMessage}";
      }
    } on DioError catch (e) {
      switch (e.type) {
        case DioErrorType.connectionTimeout:
          return "Connection timeout";
        case DioErrorType.sendTimeout:
          return "Send timeout";
        case DioErrorType.receiveTimeout:
          return "Receive timeout";
        case DioErrorType.connectionError:
          return "Connection error";
        default:
          return "Unknown error";
      }
    }
  }
}
