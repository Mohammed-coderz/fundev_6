import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:untitled4/feature/login/model/login_model.dart';

import '../../../core/const/api_const.dart';
import '../../../core/utils/shared_preferences_helper.dart';

class AuthProvider with ChangeNotifier {
  bool? isLoading = false;
  String? error;
  LoginModel? response_body;

  Future<void> Login({required String phone, required String password}) async {
    isLoading = true;
    error = null;
    notifyListeners();
    print("login");
    print(ApiConst.Login);

    try {
      final body = {"phone": phone, "password": password};
      var response = await http.post(
        Uri.parse(ApiConst.Login),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        response_body = LoginModel.fromJson(result);
        String token = response_body!.accessToken ?? "abc";
        String user_id = result['user']['id'].toString();
        String user_username = result['user']['username'];
        String user_email = result['user']['email'];
        String user_phone = result['user']['phone'];
        String user_role = result['user']['role'];
        SharedPreferencesHelper.saveString("token", token);
        SharedPreferencesHelper.saveString("id", user_id);
        SharedPreferencesHelper.saveString("username", user_username);
        SharedPreferencesHelper.saveString("email", user_email);
        SharedPreferencesHelper.saveString("phone", user_phone);
        SharedPreferencesHelper.saveString("role", user_role);
        print("Token is : $token");
        print("user_id is : $user_id");
        print("user_username is : $user_username");
        print("user_email is : $user_email");
        print("user_phone is : $user_phone");
        isLoading = false;
        notifyListeners();
      } else {
        isLoading = false;
        error = "Something went wrong";
        notifyListeners();
      }
    } catch (e) {
      isLoading = false;
      error = "Something went wrong";
      notifyListeners();
      print(e);
    }
  }
}
