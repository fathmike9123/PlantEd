import 'package:flutter/material.dart';
import 'package:flutterinit/components/custom_elevated_button.dart';
import 'package:flutterinit/components/custom_flat_button.dart';
import 'package:flutterinit/constants.dart';
import 'package:flutterinit/pages/signup_page.dart';
import 'package:flutterinit/pages/welcome_back_page.dart';
import '../utils.dart';

class LoginPageWidget extends StatefulWidget {
  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> with TickerProviderStateMixin {
  /// Event handler for the Login button
  void onLoginButtonPressed(BuildContext context) async {
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => WelcomePageWidget(),
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

  /// UI of the [LoginPageWidget]
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(ImageFiles.logo),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'PlantEd',
                      textAlign: TextAlign.left,
                      style: Constants.mainFont.copyWith(
                        fontSize: 46.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 300,
                  child: Image.asset(ImageFiles.titleAlternate),
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
