import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'CategoryData.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class CategoryProvider extends ChangeNotifier{
  List<CategoryData> _categoryData = [];


  
  Future<List<CategoryData>> getCategory() async {

    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      var url = Uri.parse("https://api.escuelajs.co/api/v1/categories");
      final response = await http.get(url);
      if (response.statusCode == 200) {
        dynamic jsonResponse = jsonDecode(response.body);
        _categoryData = List<CategoryData>.from(jsonResponse.map((data) => CategoryData.fromJson(data))).toList();

      }
      else {
        return [];
      }
    }else{
      ScaffoldMessenger.of(context as BuildContext).showSnackBar(
          SnackBar(content: Text('You\'re connected to a ${connectivityResult.name} network')
          ));
    }


    notifyListeners();

    return _categoryData;
  }
  
}