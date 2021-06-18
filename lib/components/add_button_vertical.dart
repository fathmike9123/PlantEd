import 'package:flutter/material.dart';
import 'package:flutterinit/constants.dart';

class VerticalAddButton extends StatelessWidget {
  /// Text to show on button

  /// Event handler for when the button is pressed
  final Function() onPressed;

  VerticalAddButton({
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 325,
        width: 120,
        child: Material(
          borderRadius: BorderRadius.circular(10),
          elevation: 5,
          child: ElevatedButton(
            onPressed: this.onPressed,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.add_rounded,
                  size: 50,
                  color: Colors.white,
                ),
              ],
            ),
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 15)),
              shadowColor: MaterialStateProperty.all<Color>(Colors.grey.withOpacity(0.3)),
              backgroundColor: MaterialStateProperty.all<Color>(CustomColorScheme.primaryColor),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: CustomColorScheme.primaryColor),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
