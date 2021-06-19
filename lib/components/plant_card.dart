import 'package:flutter/material.dart';
import 'package:flutterinit/constants.dart';
import 'package:flutterinit/models/plant.dart';

class PlantCard extends StatelessWidget {
  final Plant plant;

  PlantCard({
    required this.plant,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 232,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: CustomColorScheme.primaryColorSand,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: Text(
                plant.name,
                style: Constants.mainFont.copyWith(fontSize: 36),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
