import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tab_format/appbar/office_appbar.dart';
import 'package:tab_format/drawer/drawer.dart';
import 'package:tab_format/helpers/app_helpers.dart';
import 'package:tab_format/helpers/key_helpers.dart';
import 'package:tab_format/screen/widgets/home_screen_widget.dart';
import 'package:tab_format/screen/widgets/login_widget.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: ScaffoldKey.scaffoldKey,
      appBar: OfficeAppbar(),
      drawer: DrawerWidget(),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.height * 0.03),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SideBarWidget(),
            LoginScreenWidget(
              isObscure: _isObscure,
            )
          ],
        ),
      ),
      persistentFooterButtons: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.height * 0.011),
          child: Row(
            children: [
              Image.asset(
                AppHelpers.appbarLeadingImage,
                height: MediaQuery.of(context).size.height * 0.05,
              ),
            ],
          ),
        )
      ],
    );
  }
}
