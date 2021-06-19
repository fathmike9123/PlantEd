import 'package:flutter/material.dart';
import 'package:planted/constants.dart';

class CustomAddButton extends StatelessWidget {
  final IconData icon;
  final void Function() onPressed;

  CustomAddButton({
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 100,
        child: ElevatedButton(
          onPressed: this.onPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                icon,
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
    );
  }
}
