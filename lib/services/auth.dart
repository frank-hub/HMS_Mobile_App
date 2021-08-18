
import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as Dio;
import 'package:hms/models/user.dart';
import 'package:hms/services/dio.dart';

class Auth extends ChangeNotifier{
  bool _isLoggedIn = false;
   late User _user;
  String _token='';

  bool get authenticated => _isLoggedIn;
  User get user=>_user;
  void login(Map creds) async{
    try {
      Dio.Response response = await dio().post('/api/auth/login', data: creds);
      print(response.data);
      String token=response.data.toString();
      this.tryToken(token: token);
      _isLoggedIn = true;
      notifyListeners();
    }
    catch(e){
      print(e);
    }
  }
  void tryToken({required String token}) async{
    // ignore: unnecessary_null_comparison
    if(token== null){
      return;
    }
    else{
      try{
        Dio.Response response = await dio().get('/api/me', options: Dio.Options(headers: {'Authorization':'Bearer $token'}));
        this._isLoggedIn=true;
        this._user=User.fromJson(response.data);
        notifyListeners();
        print(_user);
      }catch(e){
        print(e);
      }

    }

  }
  void logout(){
    _isLoggedIn=false;
    notifyListeners();

  }

}