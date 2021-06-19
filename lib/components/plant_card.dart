import 'package:flutter/material.dart';
import 'package:flutterinit/constants.dart';
import 'package:flutterinit/models/plant.dart';
import 'package:flutterinit/pages/owned_plant_page.dart';

class PlantCard extends StatelessWidget {
  final Plant plant;

  PlantCard({
    required this.plant,
  });

  void onOwnedPlantInfoPressed(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OwnedPlantPageWidget(plant: plant),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 232,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: CustomColorScheme.primaryColorSand,
        child: GestureDetector(
          onTap: () => this.onOwnedPlantInfoPressed(context),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  plant.plantCardIllustration,
                ),
              ),
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
      ),
    );
  }
}
