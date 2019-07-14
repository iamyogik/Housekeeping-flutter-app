import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:housekeeping/core/models/assets_model.dart';
import 'package:housekeeping/core/models/tasks_model.dart';
import 'package:housekeeping/core/models/worker_model.dart';
import '../services/api.dart';
import '../../locator.dart';
import './base_model.dart';

class TaskModel extends BaseModel {
  Api _api = locator<Api>();

  List<TaskData> _tasksDataJson = List<TaskData>();

  get tasksDataJson => _tasksDataJson;

  set tasksDataJson(a) {
    _tasksDataJson = a;
    notifyListeners();
  }


  List<TaskData> _tasksDataCompleteJson = List<TaskData>();

  get tasksDataCompleteJson => _tasksDataCompleteJson;

  set tasksDataCompleteJson(a) {
    _tasksDataCompleteJson = a;
    notifyListeners();
  }




  dynamic fetchAllTasks(assetId) async {
    setViewState(ViewState.Busy);

    var response = await _api.fetchAllTasks(assetId);

    print(response);

    if (response['success']) {
      var tasksData = List<TaskData>();
      for (var data in response['data']) {
        tasksData.add(TaskData.fromJson(data));
      }
      tasksDataCompleteJson = tasksData;
      tasksDataJson = new List<TaskData>.from(tasksDataCompleteJson);
      
    } else {
      print("Error Occured");
    }

    setViewState(ViewState.Idle);

    return true;
  }


  List<WorkerData> _workersDataJson = List<WorkerData>();

  get workersDataJson => _workersDataJson;

  set workersDataJson(a) {
    _workersDataJson = a;
    notifyListeners();
  }




  dynamic getWorkers(taskId) async{

    workersDataJson.clear();
    
    // setViewState(ViewState.Busy);

    var response = await _api.getWorkers(taskId);

    print(response);

    if (response['success']) {
      var workersData = List<WorkerData>();
      for (var data in response['data']) {
        workersData.add(WorkerData.fromJson(data));
      }
      workersDataJson = workersData;
      
    } else {
      print("Error Occured");
    }

    // setViewState(ViewState.Idle);

    return true;
  }




  //  dynamic onSearchTextChanged(String text) async {
    
  //   assetsDataJson.clear();

  //   var assetsData = List<AssetsData>();

  //    for (var data in assetsDataCompleteJson) {
  //      if (data.name.toLowerCase().contains(text.toLowerCase())){
  //         assetsData.add(data);
  //       }  
  //   }

  //   assetsDataJson = assetsData;

  //   notifyListeners();
   
  // }





}
