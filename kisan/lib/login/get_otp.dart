import 'dart:convert';
import 'dart:io';


import 'package:http/http.dart' as http;
import 'package:kisan/login/model.dart';

class GetOTP{
   static final addUserUrl = 'https://add-user-dot-kisan-dev-0.appspot.com/addUser';
   Future<String> addUser() async{
     //sleep(const Duration(seconds: 3));
     final http.Response response = await http.post(
       addUserUrl,
       headers: <String, String>{
         'Content-Type': 'application/json; charset=UTF-8',
       },
       body: jsonEncode(<String, String>{
         'name': User.name,
         'mobileNo': User.mobilNo,
       }),
     );
     if(response.statusCode == 200){
       print(response.body);
       return 'OTP is sent to your mubile Number +91-${User.mobilNo}';
     }else{
       throw Exception('Failed');
     }
   }
}