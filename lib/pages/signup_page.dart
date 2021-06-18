import 'package:flutter/material.dart';
import 'package:flutterinit/components/custom_elevated_button.dart';
import 'package:flutterinit/components/login_password_textfield.dart';
import 'package:flutterinit/components/login_signup_textfield.dart';
import 'package:flutterinit/constants.dart';
import 'package:flutterinit/pages/carousel_page.dart';
import '../utils.dart';

class SignupPageWidget extends StatefulWidget {
  @override
  _SignupPageWidgetState createState() => _SignupPageWidgetState();
}

class _SignupPageWidgetState extends State<SignupPageWidget> with TickerProviderStateMixin {
  /// Event handler for the "Continue" button
  void onContinuePressed(BuildContext context) async {
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => CarouselPage(),
      ),
    );
  }

  /// UI of the [SignupPageWidget]
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
                  height: 20.0,
                ),
                Text(
                  'Sign Up',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 34.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Sign up to begin learning',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Container(
                  width: 300,
                  child: Image.asset(ImageFiles.watering),
                ),
                LoginSignupTextfield(
                  label: 'Your Name',
                ),
                LoginSignupTextfield(
                  label: 'Email',
                ),
                LoginPasswordTextfield(
                  label: 'Password',
                ),
                LoginPasswordTextfield(
                  label: 'Confirm Password',
                ),
                CustomElevatedButton(
                  onPressed: () => this.onContinuePressed(context),
                  label: 'Continue',
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
