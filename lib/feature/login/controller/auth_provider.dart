// import 'dart:convert';
//
// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;
// import 'package:untitled4/feature/login/model/login_model.dart';
//
// import '../../../core/const/api_const.dart';
// import '../../../core/utils/shared_preferences_helper.dart';
//
// class AuthProvider with ChangeNotifier {
//   bool isLoading = false;
//   String? error;
//   LoginModel? response_body;
//
//   Future<void> Login({required String phone, required String password}) async {
//     isLoading = true;
//     error = null;
//     notifyListeners();
//     print("login");
//     print(ApiConst.Login);
//
//     try {
//       final body = {"phone": phone, "password": password};
//       var response = await http.post(
//         Uri.parse(ApiConst.Login),
//         headers: {'Content-Type': 'application/json'},
//         body: jsonEncode(body),
//       );
//       print(response.statusCode);
//       print(response.body);
//       if (response.statusCode == 200) {
//         var result = jsonDecode(response.body);
//         response_body = LoginModel.fromJson(result);
//         String token = response_body!.accessToken ?? "abc";
//         SharedPreferencesHelper.saveString("token", token);
//         print("Token is : $token");
//         isLoading = false;
//         notifyListeners();
//       } else {
//         isLoading = false;
//         error = "Something went wrong";
//         notifyListeners();
//       }
//     } catch (e) {
//       isLoading = false;
//       error = "Something went wrong";
//       notifyListeners();
//       print(e);
//     }
//   }
// }
