import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tab_format/helpers/app_helpers.dart';

class DrawerWidget extends StatefulWidget {
  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        height: MediaQuery.of(context).size.height * 0.7,
        width: MediaQuery.of(context).size.height * 0.5,
        child: Drawer(
          backgroundColor: Color(0xffa9a9a9),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.02),
                  child: Text(
                    "//Appointments",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: AppHelpers.drawerTexts1.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              AppHelpers.drawerTexts1[index],
                              style: TextStyle(color: Colors.black),
                            )),
                      ],
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.01),
                  child: Text(
                    "//Servcices",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: AppHelpers.drawerTexts2.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              AppHelpers.drawerTexts2[index],
                              style: TextStyle(color: Colors.black),
                            )),
                      ],
                    );
                  },
                ),
                Text(
                  "//Services",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: AppHelpers.drawerTexts3.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              AppHelpers.drawerTexts3[index],
                              style: TextStyle(color: Colors.black),
                            )),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
