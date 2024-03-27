import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pagination_flutter/pagination.dart';
import 'package:tab_format/appbar/office_appbar.dart';
import 'package:tab_format/drawer/drawer.dart';
import 'package:tab_format/helpers/app_helpers.dart';
import 'package:tab_format/helpers/key_helpers.dart';
import 'package:tab_format/screen/web_view/airtable_form.dart';
import 'package:tab_format/screen/widgets/home_screen_widget.dart';
import 'package:tab_format/screen/widgets/login_widget.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  int selectedPage = 1;
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
            // Expanded(child: Image.asset("assets/images/webview.png"))
            Expanded(child: DashboardAirtableForm())
            // LoginScreenWidget(
            //   isObscure: _isObscure,
            // )
          ],
        ),
      ),
      persistentFooterButtons: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.height * 0.011),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Image.asset(
                    AppHelpers.appbarLeadingImage,
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("PRACASUPRETI"),
                  ),
                ],
              ),
              Container(
                child: Pagination(
                  numOfPages: 11,
                  selectedPage: selectedPage,
                  pagesVisible: 6,
                  onPageChanged: (page) {
                    setState(() {
                      selectedPage = page;
                    });
                  },
                  activeTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                  activeBtnStyle: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                  inactiveTextStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                  inactiveBtnStyle: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
