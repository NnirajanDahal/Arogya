import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tab_format/helpers/shared_preferences_helper.dart';
import 'package:tab_format/on_boarding/on_baording_screen.dart';
import 'package:tab_format/screen/login_screen.dart';

class OnBoardingMainScreen extends StatefulWidget {
  const OnBoardingMainScreen({super.key});

  @override
  State<OnBoardingMainScreen> createState() => _OnBoardingMainScreenState();
}

class _OnBoardingMainScreenState extends State<OnBoardingMainScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;
  SharedPreferencesHelper _sharedPreferencesHelper = SharedPreferencesHelper();
  handleLoggedIn() async {
    await _sharedPreferencesHelper.setLoggedIn(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.1),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                children: [for (int i = 0; i < 3; i++) OnBoardingScreen()],
                onPageChanged: (page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.1),
              child: DotsIndicator(
                dotsCount: 3,
                decorator: DotsDecorator(activeColor: Color(0xff008000)),
                position: _currentPage,
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff008000)),
                onPressed: () {
                  if (_currentPage == 2) {
                    handleLoggedIn();
                    Navigator.pushAndRemoveUntil(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => LoginScreenView()),
                        (route) => false);
                  } else {
                    _pageController.nextPage(
                        duration: Duration(seconds: 1),
                        curve: Curves.easeInOut);
                  }
                },
                child: Text('Continue'))
          ],
        ),
      ),
    );
  }
}
