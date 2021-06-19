import 'package:flutter/material.dart';
import 'package:flutterinit/constants.dart';

class CustomFlatButton extends StatelessWidget {
  /// Text to show on button
  final String label;

  /// Event handler for when the button is pressed
  final Function() onPressed;

  CustomFlatButton({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
      child: Container(
        height: 55.0,
        width: double.infinity,
        child: TextButton(
          onPressed: this.onPressed,
          child: Text(
            this.label,
            style: Constants.mainFont.copyWith(color: CustomColorScheme.grey),
          ),
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 15)),
            shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35),
                side: BorderSide(color: CustomColorScheme.grey),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
