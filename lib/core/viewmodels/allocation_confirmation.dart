import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:housekeeping/core/models/allocation_model.dart';
import 'package:housekeeping/core/models/assets_model.dart';
import 'package:housekeeping/core/models/tasks_model.dart';
import 'package:housekeeping/core/models/worker_model.dart';
import '../services/api.dart';
import '../../locator.dart';
import './base_model.dart';

class AllocationConfirm extends BaseModel {
  Api _api = locator<Api>();

  AllocationData _allocationDataJson;

  get allocationDataJson => _allocationDataJson;

  set allocationDataJson(a) {
    _allocationDataJson = a;
    notifyListeners();
  }




  dynamic sendAllocationRequest(assetId, taskId, workerId) async {
    setViewState(ViewState.Busy);

    var response = await _api.sendAllocationRequest(assetId, taskId, workerId);

    // print(response);

    if (response['success']) {
        allocationDataJson = AllocationData.fromJson(response['data']);

      
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




}
