

import '../../data/model/categories_model.dart';

abstract class GetCategoriesState {}

class OnInitialGetCategoriesState extends GetCategoriesState {}

class OnLoadingGetCategoriesState extends GetCategoriesState {}

class OnLoadedGetCategoriesState extends GetCategoriesState {
  CategoriesModel categories;
  OnLoadedGetCategoriesState({required this.categories});
}

class OnErrorGetCategoriesState extends GetCategoriesState {
  final String errorMessage;

  OnErrorGetCategoriesState(this.errorMessage);
}
