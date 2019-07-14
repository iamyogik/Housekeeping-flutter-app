import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:housekeeping/core/models/assets_model.dart';
import 'package:housekeeping/core/models/tasks_model.dart';
import 'package:housekeeping/core/models/worker_model.dart';
import '../services/api.dart';
import '../../locator.dart';
import './base_model.dart';

class WorkersModel extends BaseModel {
  Api _api = locator<Api>();

  

  List<WorkerData> _workersDataJson = List<WorkerData>();

  get workersDataJson => _workersDataJson;

  set workersDataJson(a) {
    _workersDataJson = a;
    notifyListeners();
  }


 List<WorkerData> _workersDataCompleteJson = List<WorkerData>();

  get workersDataCompleteJson => _workersDataCompleteJson;

  set workersDataCompleteJson(a) {
    _workersDataCompleteJson = a;
    notifyListeners();
  }




  dynamic getAllWorkers() async{

    workersDataJson.clear();
    
    setViewState(ViewState.Busy);

    var response = await _api.getAllWorkers();

    print(response);

    if (response['success']) {
      var workersData = List<WorkerData>();
      for (var data in response['data']) {
        workersData.add(WorkerData.fromJson(data));
      }
      // workersDataJson = workersData;
      workersDataCompleteJson = workersData;
      workersDataJson = new List<WorkerData>.from(workersDataCompleteJson);
      
    } else {
      print("Error Occured");
    }

    setViewState(ViewState.Idle);

    return true;
  }



   dynamic onSearchTextChanged(String text) async {
    
    workersDataJson.clear();

    var workersData = List<WorkerData>();

     for (var data in workersDataCompleteJson) {
       if (data.name.toLowerCase().contains(text.toLowerCase())){
          workersData.add(data);
        }  
    }

    workersDataJson = workersData;

    notifyListeners();
   
  }




}
