import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tab_format/helpers/app_helpers.dart';
import 'package:tab_format/helpers/shared_preferences_helper.dart';
import 'package:tab_format/on_boarding/on_borading_main.dart';
import 'package:tab_format/screen/home_screen.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  SharedPreferencesHelper _sharedPreferencesHelper = SharedPreferencesHelper();

  Future<void> checkLoginStatusAndNavigate() async {
    bool isLoggedIn = false;
    bool status = await _sharedPreferencesHelper.isLoggedIn();
    setState(() {
      isLoggedIn = status;
    });

    if (isLoggedIn) {
      navigateToReplacement(HomeScreenView());
    } else {
      navigateToReplacement(OnBpradingMainScreen());
    }
  }

  void navigateToReplacement(Widget replacement) {
    Navigator.of(context).pushReplacement(
      CupertinoPageRoute(builder: (context) => replacement),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      checkLoginStatusAndNavigate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(child: Image.asset(AppHelpers.arogya365)),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Arogya | 365"),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.05),
                  child: Image.asset(AppHelpers.officeLogo),
                ),
                Text("Powered by"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
