import 'package:dio/dio.dart';
Dio dio(){
  Dio dio=new Dio();

   dio.options.baseUrl='http://192.168.43.164:8000';

   dio.options.headers['accept']='Application/Json';

   return dio;
}