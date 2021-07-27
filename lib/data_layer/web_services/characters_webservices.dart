import 'package:bloc_breacking_3/constans/strings.dart';
import 'package:dio/dio.dart';
//import 'package:flutter/material.dart';

class CharactersWebServices {
  late Dio dio;

  CharactersWebServices() {
    BaseOptions baseoption = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 6 * 1000,
      receiveTimeout: 60 * 1000,
    );
    dio = Dio(baseoption);
  } //constructor

  Future<List<dynamic>> getAllCharacters() async {
    try {
      Response response = await dio.get('characters');
      return response.data;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}  //end class
