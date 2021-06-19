import 'package:flutter/material.dart';
import 'package:planted/constants.dart';

class EmptyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            child: Image.asset(
              ImageFiles.thinking,
              height: 350,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Flexible(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: Constants.mainFont.copyWith(
                  fontSize: 14.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'You don’t have any plants yet, use the ',
                    style: Constants.mainFont.copyWith(
                      fontSize: 20,
                      color: CustomColorScheme.grey,
                    ),
                  ),
                  TextSpan(
                    text: ' plus button',
                    style: Constants.mainFont.copyWith(
                      fontSize: 20,
                      color: CustomColorScheme.primaryColor,
                    ),
                  ),
                  TextSpan(
                    text: ' to add a new member to your plant family.',
                    style: Constants.mainFont.copyWith(
                      fontSize: 20,
                      color: CustomColorScheme.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
