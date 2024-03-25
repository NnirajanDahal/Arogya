import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tab_format/helpers/app_helpers.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Expanded(child: Image.asset(AppHelpers.arogya365))],
    );
  }
}
