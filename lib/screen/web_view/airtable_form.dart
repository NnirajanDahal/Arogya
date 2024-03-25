import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:tab_format/helpers/app_helpers.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DashboardAirtableForm extends StatefulWidget {
  const DashboardAirtableForm({Key? key}) : super(key: key);

  @override
  _DashboardAirtableFormState createState() => _DashboardAirtableFormState();
}

class _DashboardAirtableFormState extends State<DashboardAirtableForm> {
  var loadingPercentage = 0;
  bool showProgressIndicator = false;
  String errorMessage = '';
  final WebViewController controller = WebViewController();

  @override
  void initState() {
    super.initState();
    airtableFormFetch();
    checkConnectivity();
  }

  @override
  void dispose() {
    Connectivity().onConnectivityChanged.listen((result) {}).cancel();
    super.dispose();
  }

  Future<void> airtableFormFetch() async {
    await controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              showProgressIndicator = true;
              loadingPercentage = 0;
            });
          },
          onProgress: (int progress) {
            setState(() {
              showProgressIndicator = true;
              loadingPercentage = progress;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              showProgressIndicator = false;
              loadingPercentage = 100;
            });
          },
          onWebResourceError: (WebResourceError error) {
            setState(() {
              errorMessage = 'Connect to Internet....';
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(AppHelpers.dashboardAirtableLink));
  }

  Future<void> checkConnectivity() async {
    await Connectivity().onConnectivityChanged.listen((result) {
      if (result == ConnectivityResult.none) {
        setState(() {
          showProgressIndicator = false;
          errorMessage = 'No internet connection';
        });
      } else if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        _refresh();
      }
    }).cancel();
  }

  Future<void> _refresh() async {
    setState(() {
      errorMessage = '';
    });
    await controller.reload();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WebViewWidget(
            controller: controller,
          ),
          if (showProgressIndicator)
            Center(
              child: CircularProgressIndicator(
                color: Color(0xFF4B4B4B),
              ),
            ),
          if (loadingPercentage < 100)
            LinearProgressIndicator(
              backgroundColor: Colors.white,
              color: Color(0xFF4B4B4B),
              value: loadingPercentage / 100.0,
            ),
          if (errorMessage.isNotEmpty)
            Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(errorMessage),
                    ),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF4B4B4B),
                        ),
                        onPressed: checkConnectivity,
                        child: Text('Refresh'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          if (loadingPercentage < 100)
            Center(
              child: Text(errorMessage),
            ),
        ],
      ),
    );
  }
}
