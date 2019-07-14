import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:housekeeping/core/models/assets_model.dart';
import '../services/api.dart';
import '../../locator.dart';
import './base_model.dart';

class AssetsModel extends BaseModel {
  Api _api = locator<Api>();

  List<AssetsData> _assetsDataJson = List<AssetsData>();

  get assetsDataJson => _assetsDataJson;

  set assetsDataJson(a) {
    _assetsDataJson = a;
    notifyListeners();
  }


  List<AssetsData> _assetsDataCompleteJson = List<AssetsData>();

  get assetsDataCompleteJson => _assetsDataCompleteJson;

  set assetsDataCompleteJson(a) {
    _assetsDataCompleteJson = a;
    notifyListeners();
  }




  dynamic fetchAllAssets() async {
    setViewState(ViewState.Busy);

    var response = await _api.fetchAllAssets();

    print(response);

    if (response['success']) {
      var assetsData = List<AssetsData>();
      for (var data in response['data']) {
        assetsData.add(AssetsData.fromJson(data));
      }
      assetsDataCompleteJson = assetsData;
      assetsDataJson = new List<AssetsData>.from(assetsDataCompleteJson);
      // assetsDataJson = assetsDataCompleteJson;
    } else {
      print("Error Occured");
    }

    setViewState(ViewState.Idle);

    return true;
  }



   dynamic onSearchTextChanged(String text) async {
    
    assetsDataJson.clear();

    var assetsData = List<AssetsData>();

     for (var data in assetsDataCompleteJson) {
       if (data.name.toLowerCase().contains(text.toLowerCase())){
          assetsData.add(data);
        }  
    }

    assetsDataJson = assetsData;

    notifyListeners();
   
  }







  // void doSomething() async {
  //   setViewState(ViewState.Busy);

  //   await Future.delayed(Duration(seconds: 3));

  //   //! Call _api.someMethod and get the response

  //   setViewState(ViewState.Idle);
  // }

  //! Getter and Setter with notifyListeners();

  // String _something = "something";

  // String get something => _something;

  // void setSomething(String s) {
  //   _something = s;
  //   notifyListeners();
  // }

}
