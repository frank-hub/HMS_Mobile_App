import 'package:dio/dio.dart';
Dio dio(){
  Dio dio=new Dio();

   dio.options.baseUrl='http://991cd1cec7b9.ngrok.io';


   return dio;
}