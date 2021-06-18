import 'package:flutter/material.dart';
import 'package:flutterinit/constants.dart';
import 'package:flutterinit/models/responses/plant_image_response.dart';

class PlantAlertDialog extends StatefulWidget {
  final List<PlantResults> listOfPlantResults;

  const PlantAlertDialog({
    required this.listOfPlantResults,
  });

  @override
  _PlantAlertDialogState createState() => _PlantAlertDialogState();
}

class _PlantAlertDialogState extends State<PlantAlertDialog> {
  bool isNoResult() => widget.listOfPlantResults.isEmpty;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      title: Text(
        isNoResult() ? 'No Plants Found!' : 'Found Some Plants!',
        style: Constants.mainFont.copyWith(fontWeight: FontWeight.bold),
      ),
      content: isNoResult()
          ? Text(
              'We were unable to find any plants from your picture. Please try again!',
              style: Constants.mainFont,
            )
          : SingleChildScrollView(
              child: Container(
                width: double.maxFinite,
                child: Column(
                  children: widget.listOfPlantResults
                      .map((item) => ListTile(
                            leading: Icon(
                              Icons.grass,
                              color: CustomColorScheme.primaryColor,
                            ),
                            title: Text(
                              item.species.genus.scientificNameWithoutAuthor,
                              style: Constants.mainFont,
                            ),
                          ))
                      .toList(),
                ),
              ),
            ),
    );
  }
}
