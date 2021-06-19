import 'package:flutter/material.dart';
import 'package:flutterinit/constants.dart';
import 'package:flutterinit/mocks/plants_mocks.dart';
import 'package:flutterinit/models/responses/plant_image_response.dart';
import 'package:flutterinit/pages/plant_page.dart';

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

  void onTap(PlantResults selectedPlant) async {
    // Close the popup first
    Navigator.pop(context);

    // Find the example from the mocks
    var selection = mockPlants.firstWhere(
      (element) => element.name == selectedPlant.species.genus.scientificNameWithoutAuthor,
      orElse: () => mockPlants[0],
    );

    // Then navigate to PlantPageWidget
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlantPageWidget(
          plant: selection,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      titlePadding: EdgeInsets.only(top: 16),
      contentPadding: EdgeInsets.fromLTRB(30, 0, 30, 30),
      title: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Text(
              isNoResult() ? 'No Plants Found!' : 'Found Some Plants!',
              style: Constants.mainFont.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Transform.translate(
            offset: Offset(0, -50),
            child: Container(
              width: 100,
              height: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: CustomColorScheme.primaryColorSand,
                border: Border.all(color: Colors.white, width: 5),
              ),
              child: Image.asset(
                ImageFiles.logo,
                width: 40,
              ),
            ),
          ),
        ],
      ),
      content: isNoResult()
          ? Text(
              'We were unable to find any plants from your picture. Please try again!',
              style: Constants.mainFont,
            )
          : Container(
              width: double.maxFinite,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: widget.listOfPlantResults
                          .map((PlantResults item) => Column(
                                children: [
                                  ListTile(
                                    minLeadingWidth: 0,
                                    leading: Icon(
                                      Icons.grass,
                                      color: CustomColorScheme.primaryColor,
                                    ),
                                    title: Text(
                                      item.species.genus.scientificNameWithoutAuthor,
                                      style: Constants.mainFont,
                                    ),
                                    onTap: () => this.onTap(item),
                                  ),
                                  Divider(),
                                ],
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
