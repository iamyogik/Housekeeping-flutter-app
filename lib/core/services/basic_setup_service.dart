import 'package:flutter/widgets.dart';
import 'package:housekeeping/ui/views/home.dart';
import 'package:housekeeping/ui/views/tasks_page.dart';
import 'package:housekeeping/ui/views/worker_task.dart';
import 'package:housekeeping/ui/views/workers_page.dart';
import '../../ui/views/assets_page.dart';
import '../../locator.dart';
import './localstorage_service.dart';
import './localstorage_service.dart';

class BasicSetupServices{

  final GlobalKey<NavigatorState> _navigatorKey = new GlobalKey<NavigatorState>();

  get navigatorKey => _navigatorKey;

  
  Widget getStartScreen(){


    LocalStorageService storageService = locator<LocalStorageService>();
    
    // return TaskPage(assetId: "5d2b250c83490e59c02a5faf");
    // return WorkerTaskPage(workerId: "5d2b247283490e59c02a5fae");
    return HomePage();


    //! Check which page you have to return on the app start up using the LocalStorage service and return it. 

    // if (user != null && user.toJson()['token'] != null ) {

    //   var userData = user.toJson();

    //   if(!userData['mobile_verified']){
    //     return MobileVerifyPage();
    //   }

    //   if(userData['onboarding_required']){
    //     return OnboardingPage();
    //   }

    //   return HomePage();
    // } else {
    //   return LoginPage();
    // }


  }






}

