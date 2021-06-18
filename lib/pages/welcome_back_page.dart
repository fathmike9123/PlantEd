import 'package:flutter/material.dart';
import 'package:flutterinit/components/custom_elevated_button.dart';
import 'package:flutterinit/components/custom_flat_button.dart';
import 'package:flutterinit/components/login_password_textfield.dart';
import 'package:flutterinit/components/login_signup_textfield.dart';
import 'package:flutterinit/constants.dart';
import 'package:flutterinit/pages/signup_page.dart';
import '../utils.dart';
import 'main_page.dart';

class WelcomePageWidget extends StatefulWidget {
  @override
  _WelcomePageWidgetState createState() => _WelcomePageWidgetState();
}

class _WelcomePageWidgetState extends State<WelcomePageWidget> with TickerProviderStateMixin {
  /// Event handler for the Login button
  void onLoginButtonPressed(BuildContext context) async {
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MainPageWidget(),
      ),
    );
  }

  /// Event handler for the "Create an account" button
  void onCreateAccountPressed(BuildContext context) async {
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => SignupPageWidget(),
      ),
    );
  }

  /// UI of the [WelcomePageWidget]
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => unfocus(context),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 1,
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width,
              maxHeight: MediaQuery.of(context).size.height * 1,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 50.0,
                ),
                Text(
                  'Welcome Back!',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 34.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Sign in to see your plant tasks for today',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Container(
                  width: 250,
                  child: Image.asset(ImageFiles.welcome),
                ),
                LoginSignupTextfield(
                  label: 'Email or Username',
                ),
                LoginPasswordTextfield(
                  label: 'Password',
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: CustomElevatedButton(
                        onPressed: () => this.onLoginButtonPressed(context),
                        label: 'Log in',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 0, bottom: 40),
                      child: CustomFlatButton(
                        onPressed: () => this.onCreateAccountPressed(context),
                        label: 'Create an account',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
