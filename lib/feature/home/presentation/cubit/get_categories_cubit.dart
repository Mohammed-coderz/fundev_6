import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:untitled4/feature/home/data/model/categories_model.dart';

import '../../../../core/const/api_const.dart';
import '../../../../core/utils/shared_preferences_helper.dart';
import '../state/get_categories_state.dart';

class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  CategoriesModel? response_body;

  GetCategoriesCubit() : super(OnInitialGetCategoriesState());

  Future<void> getCategories() async {
    emit(OnLoadingGetCategoriesState());
    print("get categories");
    print(ApiConst.Login);

    try {
      var response = await http.get(
        Uri.parse(ApiConst.get_categories),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer ${SharedPreferencesHelper.getString("token")}',
        },
      );
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        response_body = CategoriesModel.fromJson(result);
        if (response_body!.result == true) {
          emit(OnLoadedGetCategoriesState(categories: response_body!));
        } else {
          emit(OnErrorGetCategoriesState("Something went wrong"));
        }
      } else {
        emit(OnErrorGetCategoriesState("Something went wrong"));
      }
    } catch (e) {
      emit(OnErrorGetCategoriesState("$e"));
      print(e);
    }
  }
}
