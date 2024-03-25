import 'package:flutter/material.dart';
import 'package:tab_format/helpers/app_helpers.dart';
import 'package:tab_format/helpers/key_helpers.dart';

class OfficeAppbar extends StatelessWidget implements PreferredSizeWidget {
  final double? leadingWidth;
  final String? actionText;

  const OfficeAppbar({Key? key, this.leadingWidth, this.actionText})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 4,
      actions: [
        Center(
          child: Text(
            actionText ?? "",
            style: TextStyle(color: Colors.black),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(top: 8, bottom: 8, right: 17, left: 17),
          child: Image.asset(
            AppHelpers.splashImage,
            height: 42,
            width: 42,
            fit: BoxFit.fill,
          ),
        ),
      ],
      leadingWidth: 65,
      leading: Padding(
        padding: EdgeInsets.only(top: 5, bottom: 5, left: 17),
        child: InkWell(
            onTap: () {
              ScaffoldKey.scaffoldKey.currentState?.openDrawer();
            },
            child: Image.asset(AppHelpers.appbarLeadingImage)),
      ),
      backgroundColor: Colors.white,
      // centerTitle: true,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "PRACAS",
            style: TextStyle(
              fontSize: 25,
              fontFamily: 'JDR Province',
              color: Colors.black,
              fontWeight: FontWeight.bold,
              // fontStyle: FontStyle.italic`
            ),
          ),
          Text(
            " | ",
            style: TextStyle(
              fontSize: 13,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              // fontStyle: FontStyle.italic
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 2),
            child: Text(
              "Arogya365",
              style: TextStyle(
                fontSize: 13,
                color: Colors.black,
                fontWeight: FontWeight.bold,
                // fontStyle: FontStyle.italic
              ),
            ),
          ),
        ],
      ),
    );
  }
}
