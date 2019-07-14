import 'package:flutter/material.dart';
import './core/services/basic_setup_service.dart';
import './locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  try {
    await setupLocator();
    runApp(MyApp());
  } catch (error) {
    print(error);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: locator<BasicSetupServices>().getStartScreen(),
      navigatorKey: locator<BasicSetupServices>().navigatorKey,
    );
  }
}
