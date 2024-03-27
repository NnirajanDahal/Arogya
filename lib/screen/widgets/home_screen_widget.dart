import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tab_format/helpers/app_helpers.dart';

class SideBarWidget extends StatefulWidget {
  const SideBarWidget({super.key});

  @override
  State<SideBarWidget> createState() => _SideBarWidgetState();
}

class _SideBarWidgetState extends State<SideBarWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
            decoration: BoxDecoration(
                color: Color(0xffA9A9A9),
                borderRadius: BorderRadius.circular(10)),
            width: MediaQuery.of(context).size.height * 0.28,
            height: MediaQuery.of(context).size.height * 0.7,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02),
                    child: Text(
                      "// Appointments",
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
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  AppHelpers.drawerTexts1[index],
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                        ],
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.01),
                    child: Text(
                      "// Servcices",
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
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  AppHelpers.drawerTexts2[index],
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                        ],
                      );
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.02),
                    child: Text(
                      "// Services",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: AppHelpers.drawerTexts3.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  AppHelpers.drawerTexts3[index],
                                  style: TextStyle(color: Colors.black),
                                )),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
            child: Text(
              "Tip : How Pacemaker Works !",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
            ),
          )
        ],
      ),
    );
  }
}
