import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tab_format/helpers/shared_preferences_helper.dart';
import 'package:tab_format/on_boarding/on_baording_screen.dart';
import 'package:tab_format/on_boarding/on_borading_main.dart';
import 'package:tab_format/screen/home_screen.dart';
import 'package:tab_format/screen/login_screen.dart';
import 'package:tab_format/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper().initialize();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Comfortaa', useMaterial3: false),
      home: HomeScreenView(),
    );
  }
}
