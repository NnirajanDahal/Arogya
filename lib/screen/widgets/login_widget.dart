import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreenWidget extends StatefulWidget {
  final bool isObscure;
  const LoginScreenWidget({super.key, required this.isObscure});

  @override
  State<LoginScreenWidget> createState() => _LoginScreenWidgetState();
}

class _LoginScreenWidgetState extends State<LoginScreenWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool loginButtonPressed = false;
  bool isObscure = true;
  @override
  void initState() {
    isObscure = widget.isObscure;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.width * 0.03,
            horizontal: MediaQuery.of(context).size.width * 0.2),
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xffa9a9a9),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text("Username"),
                    TextField(),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.02),
                      child: Text("Password"),
                    ),
                    TextField(
                      obscureText: isObscure,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  isObscure = !isObscure;
                                });
                              },
                              icon: Icon(isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off))),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff4b4b4b)),
                        onPressed: () {
                          setState(() {
                            loginButtonPressed = !loginButtonPressed;
                          });
                        },
                        child: loginButtonPressed
                            ? CircularProgressIndicator()
                            : Text("ENTER"))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
