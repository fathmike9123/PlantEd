import 'package:flutter/material.dart';
import 'package:flutterinit/components/plant_info_button.dart';
import 'package:flutterinit/constants.dart';
import 'package:flutterinit/icons.dart';
import 'package:flutterinit/models/plant.dart';
import 'package:flutterinit/pages/main_page.dart';
import 'package:flutter/widgets.dart';

class PlantPageWidget extends StatefulWidget {
  final Plant plant;

  PlantPageWidget({
    required this.plant,
  });

  @override
  _PlantPageWidgetState createState() => _PlantPageWidgetState();
}

class _PlantPageWidgetState extends State<PlantPageWidget> {
  void onAddPlantPressed(BuildContext context) async {
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MainPageWidget(),
      ),
    );
  }

  //UI of the Main Page
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.topCenter,
          image: AssetImage(widget.plant.photoAsset),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Stack(children: [
        Container(
          margin: new EdgeInsets.fromLTRB(0.0, 440.0, 0.0, 0.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(20.0),
              topRight: const Radius.circular(20.0),
            ),
            color: CustomColorScheme.primaryColorSand,
          ),
        ),
        Container(
          margin: new EdgeInsets.fromLTRB(10.0, 23.0, 10.0, 720.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: const Radius.circular(10.0),
              bottomRight: const Radius.circular(10.0),
              topLeft: const Radius.circular(10.0),
              topRight: const Radius.circular(10.0),
            ),
            boxShadow: [
              BoxShadow(
                color: CustomColorScheme.grey,
                offset: Offset(0.0, 2.0),
                blurRadius: 6.0,
              ),
            ],
            color: CustomColorScheme.primaryColorSand,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  BackButton(
                    onPressed: () => this.onAddPlantPressed(context),
                  ),
                  Text(
                    widget.plant.name,
                    style: Constants.mainFont.copyWith(
                      fontSize: 34.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 370,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        child: PlantInfoButton(
                          label: 'Light',
                          icon: Icons.wb_sunny_rounded,
                          onPressed: () => this.onAddPlantPressed(context),
                        ),
                      ),
                      Container(
                        child: PlantInfoButton(
                          label: 'Fertilizer',
                          icon: CustomIcons.fertilizer_leaf,
                          onPressed: () => this.onAddPlantPressed(context),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        child: PlantInfoButton(
                          label: 'Water',
                          icon: CustomIcons.watering_can,
                          onPressed: () => this.onAddPlantPressed(context),
                        ),
                      ),
                      Container(
                        child: PlantInfoButton(
                          label: 'Temp',
                          icon: Icons.thermostat_rounded,
                          onPressed: () => this.onAddPlantPressed(context),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        child: PlantInfoButton(
                          label: 'Schedule',
                          icon: Icons.calendar_today_rounded,
                          onPressed: () => this.onAddPlantPressed(context),
                        ),
                      ),
                      Container(
                        child: PlantInfoButton(
                          label: 'Log',
                          icon: CustomIcons.log,
                          onPressed: () => this.onAddPlantPressed(context),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
