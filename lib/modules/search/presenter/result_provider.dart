import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutterando_clean_arch/modules/search/domain/entities/result_search.dart';
import 'package:flutterando_clean_arch/modules/search/domain/usecases/search_by_text_usecase.dart';

class ResultSearchProvider with ChangeNotifier {

  final SearchByText usecase;
  bool estadoInicial = true;

  ResultSearchProvider({required this.usecase});
  
   List<ResultSearch> list = [];

  Future<void> search(String searchText) async {
    final result = await usecase(searchText);
    result.fold(
      (l) => list = [], 
      (r) => list = r
    );
    estadoInicial = false;
    notifyListeners();
  }


} 