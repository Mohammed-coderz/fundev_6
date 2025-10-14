import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../../../core/const/api_const.dart';
import '../../../../core/utils/shared_preferences_helper.dart';
import '../../data/model/login_model.dart';
import '../state/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginModel? response_body;
  LoginCubit() : super(OnInitialLoginState());



  Future<void> Login({required String phone, required String password}) async {
    emit(OnLoadingLoginState());
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
        SharedPreferencesHelper.saveString("token", token);
        print("Token is : $token");
        emit(OnLoadedLoginState(user: response_body!));
      } else {
        emit(OnErrorLoginState("Something went wrong"));
      }
    } catch (e) {
      emit(OnErrorLoginState("$e"));
      print(e);
    }
  }
}
