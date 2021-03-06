import 'dart:convert';
import 'package:hms/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class CallApi{
  final String _url = 'https://hms.horebinsurance.co.ke/api';
//  final String _url = 'http://192.168.1.3:8000/api';

  User? _user;
  User? get user=>_user;

  postData(data, apiUrl) async {
    var fullUrl = _url + apiUrl + await _getToken();
    return await http.post(
        Uri.parse(fullUrl),
        body: jsonEncode(data),
        headers: _setHeaders()
    );
  }

  updateBooking(apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.get(
        Uri.parse(fullUrl),
        headers: _setHeaders()
    );
  }

  updateDoc(data, apiUrl) async {
    var fullUrl = _url + apiUrl + await _getToken();
    return await http.post(
        Uri.parse(fullUrl),
        body: jsonEncode(data),
        headers: _setHeaders()
    );
  }

  getData(apiUrl) async {
    var fullUrl = _url + apiUrl + await _getToken();
    return await http.get(
        Uri.parse(fullUrl) ,
        headers: _setHeaders()
    );
  }
  fetchData(data,apiUrl) async {
    var fullUrl = _url + apiUrl + await _getToken();
    return await http.get(
        Uri.parse(fullUrl) ,
        headers: _setHeaders()
    );
  }
  _setHeaders() => {
    'Content-type' : 'application/json',
    'Accept' : 'application/json',
  };

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    return '?token=$token';
  }
  Future<User> getUserData() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var myuser = localStorage.getString('user');
    var user = jsonDecode(myuser!);
    this._user=User.fromJson(user);

    return User.fromJson(user);

  }
}