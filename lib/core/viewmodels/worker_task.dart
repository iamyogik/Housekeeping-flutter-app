import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:housekeeping/core/models/allocated_task.dart';
import 'package:housekeeping/core/models/assets_model.dart';
import 'package:housekeeping/core/models/tasks_model.dart';
import 'package:housekeeping/core/models/worker_model.dart';
import '../services/api.dart';
import '../../locator.dart';
import './base_model.dart';

class WorkersTaskModel extends BaseModel {
  Api _api = locator<Api>();

  

  List<AllocatedTaskData> _allocatedTaskDataJson = List<AllocatedTaskData>();

  get allocatedTaskDataJson => _allocatedTaskDataJson;

  set allocatedTaskDataJson(a) {
    _allocatedTaskDataJson = a;
    notifyListeners();
  }




  List<AllocatedTaskData> _allocatedTaskDataCompleteJson = List<AllocatedTaskData>();

  get allocatedTaskDataCompleteJson => _allocatedTaskDataCompleteJson;

  set allocatedTaskDataCompleteJson(a) {
    _allocatedTaskDataCompleteJson = a;
    notifyListeners();
  }



  dynamic getAllTaskOfWorker(workerId) async{

    print(workerId);
    setViewState(ViewState.Busy);

    var response = await _api.getAllTaskOfWorker(workerId);

    print(response);

    if (response['success']) {
      var allocatedTaskData = List<AllocatedTaskData>();
      for (var data in response['data']['tasks']) {
        allocatedTaskData.add(AllocatedTaskData.fromJson(data));
      }
      // allocatedTaskDataJson = allocatedTaskData;
      allocatedTaskDataCompleteJson = allocatedTaskData;
      allocatedTaskDataJson = new List<AllocatedTaskData>.from(allocatedTaskDataCompleteJson);
      
    } else {
      print("Error Occured");
    }

    setViewState(ViewState.Idle);

    // return true;
  }



   dynamic onSearchTextChanged(String text) async {
    
    // print("sas");

    allocatedTaskDataJson.clear();

    var assetsData = List<AllocatedTaskData>();

     for (var data in allocatedTaskDataCompleteJson) {
       if (data.taskData.name.toLowerCase().contains(text.toLowerCase())){
          assetsData.add(data);
        }  
        // print(data.name);
    }

    allocatedTaskDataJson = assetsData;

    notifyListeners();
   
  }




}
