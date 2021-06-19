import 'package:flutter/material.dart';
import 'package:planted/constants.dart';

class PlantInfoButton extends StatelessWidget {
  /// Icon to show on button
  final IconData icon;
  final String label;

  /// Event handler for when the button is pressed
  final Function() onPressed;

  PlantInfoButton({
    required this.onPressed,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Material(
          borderRadius: BorderRadius.circular(10),
          elevation: 20,
          shadowColor: Color(0x90EBEBEB),
          child: ElevatedButton(
            onPressed: this.onPressed,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 20,
                ),
                Icon(
                  this.icon,
                  size: 50,
                  color: CustomColorScheme.primaryColor2,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  this.label,
                  style: Constants.mainFont.copyWith(
                    fontSize: 18.0,
                    color: CustomColorScheme.primaryColor2,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
            style: ButtonStyle(
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
      ),
    );
  }
}
