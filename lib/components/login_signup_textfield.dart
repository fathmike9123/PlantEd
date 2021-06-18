import 'package:flutter/material.dart';
import 'package:flutterinit/constants.dart';

class LoginSignupTextfield extends StatelessWidget {
  /// Text to show in field
  final String label;

  LoginSignupTextfield({
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      child: TextField(
        style: TextStyle(
          color: Colors.black,
          height: 1,
          fontSize: 15.0,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
            borderSide: BorderSide(color: CustomColorScheme.primaryColor),
          ),
          labelText: this.label,
          fillColor: Colors.grey,
        ),
      ),
    );
  }
}
