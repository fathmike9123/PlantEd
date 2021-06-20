import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:planted/components/custom_elevated_button.dart';
import 'package:planted/components/login_signup_textfield.dart';
import 'package:planted/constants.dart';
import 'package:planted/pages/carousel_page.dart';
import '../utils.dart';

class SignupPageWidget extends StatefulWidget {
  @override
  _SignupPageWidgetState createState() => _SignupPageWidgetState();
}

class _SignupPageWidgetState extends State<SignupPageWidget> with TickerProviderStateMixin {
  String name = '';
  String email = '';
  String password = '';
  String passwordConfirm = '';

  /// Event handler for the "Continue" button
  void onContinuePressed() async {
    if (name.isEmpty || email.isEmpty || password.isEmpty || passwordConfirm.isEmpty) {
      showSnackbar('Please make sure that all fields are filled.');
      return;
    }

    if (email.contains(' ') || password.contains(' ') || passwordConfirm.contains(' ')) {
      showSnackbar('Email and password must not contain whitespaces');
      return;
    }

    if (password != passwordConfirm) {
      showSnackbar('Passwords do not match. Please try again.');
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: this.email.trim(),
        password: this.password.trim(),
      );

      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CarouselPage(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackbar('Password must be at least 6 characters long.');
      } else if (e.code == 'email-already-in-use') {
        showSnackbar('The account already exists for that email.');
      }
      showSnackbar(e.message!);
    } catch (e) {
      print(e);
    }
  }

  void showSnackbar(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  /// UI of the [SignupPageWidget]
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => unfocus(context),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 50.0,
              ),
              Text(
                'Sign Up',
                textAlign: TextAlign.center,
                style: Constants.mainFont.copyWith(
                  fontSize: 34.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Sign up to begin learning',
                textAlign: TextAlign.center,
                style: Constants.mainFont.copyWith(
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
                onTextChanged: (value) {
                  this.name = value;
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              LoginSignupTextfield(
                label: 'Email',
                onTextChanged: (value) {
                  this.email = value;
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              LoginSignupTextfield(
                obscureText: true,
                label: 'Password',
                onTextChanged: (value) {
                  this.password = value;
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              LoginSignupTextfield(
                label: 'Confirm Password',
                obscureText: true,
                onTextChanged: (value) {
                  this.passwordConfirm = value;
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              CustomElevatedButton(
                onPressed: this.onContinuePressed,
                label: 'Continue',
              ),
              SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
