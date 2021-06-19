import 'package:flutter/material.dart';
import 'package:flutterinit/constants.dart';

class CarouselCard extends StatelessWidget {
  /// Text to show on button
  final String title;
  final String description;
  final String image;

  CarouselCard({
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              this.title,
              textAlign: TextAlign.center,
              style: Constants.mainFont.copyWith(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              this.description,
              textAlign: TextAlign.center,
              style: Constants.mainFont.copyWith(
                fontSize: 18.0,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Image.asset(
            this.image,
            height: 400,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
