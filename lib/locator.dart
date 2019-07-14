import 'package:get_it/get_it.dart';
import 'package:housekeeping/core/viewmodels/allocation_confirmation.dart';
import 'package:housekeeping/core/viewmodels/task_model.dart';
import 'package:housekeeping/core/viewmodels/worker_task.dart';
import 'package:housekeeping/core/viewmodels/workers_model.dart';
import './core/services/http_service.dart';
import './core/viewmodels/assets_model.dart';
import './core/services/basic_setup_service.dart';
import './core/services/localstorage_service.dart';
import 'core/services/api.dart';


GetIt locator = GetIt();

Future setupLocator() async{

  

  locator.registerLazySingleton(() => NetworkService());

  var instance = await LocalStorageService.getInstance(); 
  locator.registerSingleton<LocalStorageService>(instance);
  
  locator.registerLazySingleton(() => BasicSetupServices());
  
  locator.registerLazySingleton(() => Api());

  locator.registerFactory(() => AssetsModel());

  locator.registerFactory(() => TaskModel());

  locator.registerFactory(() => AllocationConfirm());

  locator.registerFactory(() => WorkersModel());
  
  locator.registerFactory(() => WorkersTaskModel());

  
}