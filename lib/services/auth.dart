
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hms/models/user.dart';
import 'package:hms/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth extends ChangeNotifier{
  bool _isAuthenticated = false;
  User? _user;
  var status ;
  bool get isAuthenticated => _isAuthenticated;

  User? get user{
    return _user;
  }

  Future<bool> login(String email, String password) async {
    final response = await http.post(Uri.parse('$API_URL/api/auth/login'), body: {
      'email': email,
      'password': password,
    }, headers: {
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      String result = response.body;
      Map<String, dynamic> resp = jsonDecode(result);
      String token =resp['data']['token'];
      this.tryToken(token: token);
      await saveToken(token);
      _isAuthenticated = true;
      notifyListeners();
      return true;
    }

    if (response.statusCode == 422) {
      return false;

    }

    return false;
  }

  Future registerUser(String name ,String email ,String phone, String password) async{

    final response = await http.post(Uri.parse('$API_URL/api/auth/register'),
        headers: {
          'Accept':'application/json'
        },
        body: {
          "name": "$name",
          "email": "$email",
          "phone": "$phone",
          "password" : "$password"
        } ) ;
    status = response.body.contains('error');

    var data = json.decode(response.body);

    if(status){
      print('data : ${data["error"]}');
    }else{
      print('data : ${data["token"]}');
      saveToken(data["token"]);
      notifyListeners();
    }

  }

  saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);

  }

  void tryToken({required String token}) async {
    // ignore: unnecessary_null_comparison
    if (token == null) {
      return;
    }
    else {
      try{
        final response = await http.get(Uri.parse('$API_URL/api/me'),headers: {'Authorization':'Bearer $token'});
        Map<String, dynamic> user = jsonDecode(response.body);
        this._isAuthenticated=true;
        this._user=User.fromJson(user);
        notifyListeners();
        print(user);
      }catch(e){
        print(e);
      }
    }
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    notifyListeners();
    return prefs.getString('token');
  }

  logout() async {
    _isAuthenticated = false;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

}