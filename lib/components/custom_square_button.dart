import 'package:flutter/material.dart';
import 'package:flutterinit/constants.dart';

class CustomSquareButton extends StatelessWidget {
  /// Text to show on button
  final String label;
  final String image;
  final int url;

  /// Event handler for when the button is pressed
  final Function() onPressed;

  CustomSquareButton({
    required this.label,
    required this.onPressed,
    required this.image,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 200,
        child: ElevatedButton(
          onPressed: this.onPressed,
          child: Column(
            children: [
              Text(
                this.label,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Image.asset(
                this.image,
                height: 130,
                fit: BoxFit.cover,
              ),
            ],
          ),
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(10),
            padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 15)),
            shadowColor: MaterialStateProperty.all<Color>(Colors.grey.withOpacity(0.3)),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: CustomColorScheme.grey),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
