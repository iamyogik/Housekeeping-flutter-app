import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './http_service.dart';
import './localstorage_service.dart';
import '../../locator.dart';

class Api {
  
  NetworkService networkService = locator<NetworkService>();
  LocalStorageService storageService = locator<LocalStorageService>();


  dynamic fetchAllAssets() async{
    var response = await networkService.get("/assets");
    return response;
  }

  dynamic fetchAllTasks(assetId) async{
    var response = await networkService.get("/asset/" + assetId +"/tasks");
    return response;
  }

  dynamic getWorkers(taskId) async{
    var response = await networkService.get("/workers/"+taskId);
    return response;
  }

  dynamic sendAllocationRequest(assetId, taskId, workerId) async{
    print("/asset/"+assetId+"/task/"+taskId+"/worker");
     var response = await networkService.post("/asset/"+assetId+"/task/"+taskId+"/worker", body: {
      "worker_id": workerId
    });

    return response;
  }
  

  dynamic getAllWorkers() async{
    var response = await networkService.get("/workers");
    return response;
  }


  dynamic getAllTaskOfWorker(workerId) async{
    var response = await networkService.get("/worker-tasks/"+workerId);
    return response;
  }


  //! Make requests to the server using the networkService like given below.
  //! Use the storageService to save data to localstorage. Make sure to create functions inside localstorage_service.dart file inorder to do so.

  // dynamic signupUsingEmail(String name, String email, String password) async {
  //     var response = await networkService.post("/signup", body: {
  //       "type": "email",
  //       "name": name,
  //       "email": email,
  //       "password": password
  //     });

  //     if (response['success']) {

  //     }
  //     return response;
  //   }
  // }


}
