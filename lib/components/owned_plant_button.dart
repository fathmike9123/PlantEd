import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterinit/constants.dart';

class OwnedPlantButton extends StatelessWidget {
  /// Text to show on button

  /// Event handler for when the button is pressed
  final Function() onPressed;

  OwnedPlantButton({
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 250,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: this.onPressed,
          child: Stack(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                  child: Text(
                    'Monstera',
                    textAlign: TextAlign.left,
                    style: Constants.mainFont.copyWith(
                      color: Colors.black,
                      fontSize: 40.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  ImageFiles.cardMonstera,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 15)),
            shadowColor: MaterialStateProperty.all<Color>(Colors.grey.withOpacity(0.3)),
            backgroundColor: MaterialStateProperty.all<Color>(CustomColorScheme.primaryColorSand),
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
