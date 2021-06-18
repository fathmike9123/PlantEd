import 'package:flutter/material.dart';
import 'package:flutterinit/components/add_button_vertical.dart';
import 'package:flutterinit/components/plant_info_button.dart';
import 'package:flutterinit/constants.dart';
import 'package:flutterinit/icons.dart';
import 'package:flutterinit/models/plant.dart';
import 'package:flutterinit/pages/main_page.dart';
import 'package:flutter/widgets.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PlantPageWidget extends StatefulWidget {
  final Plant plant;

  PlantPageWidget({
    required this.plant,
  });

  @override
  _PlantPageWidgetState createState() => _PlantPageWidgetState();
}

class _PlantPageWidgetState extends State<PlantPageWidget> {
  String _infotitle = '';
  String _plantinfo = '';
  PanelController _pc = PanelController();

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
      child: Stack(
        children: [
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
            margin: new EdgeInsets.fromLTRB(10.0, 33.0, 10.0, 720.0),
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
            body: Stack(
              children: [
                Column(
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
                          style: const TextStyle(
                            fontSize: 34.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 360,
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
                                onPressed: () {
                                  setState(() {});
                                  _infotitle = 'Light';
                                  _plantinfo = widget.plant.lightInformation;
                                  _pc.open();
                                },
                              ),
                            ),
                            Container(
                              child: PlantInfoButton(
                                label: 'Fertilizer',
                                icon: CustomIcons.fertilizer_leaf,
                                onPressed: () {
                                  setState(() {});
                                  _infotitle = 'Fertilizer';
                                  _plantinfo = widget.plant.fertilizerInformation;
                                  _pc.open();
                                },
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
                                onPressed: () {
                                  setState(() {});
                                  _infotitle = 'Water';
                                  _plantinfo = widget.plant.waterInformation;
                                  _pc.open();
                                },
                              ),
                            ),
                            Container(
                              child: PlantInfoButton(
                                label: 'Temp',
                                icon: Icons.thermostat_rounded,
                                onPressed: () {
                                  setState(() {});
                                  _infotitle = 'Temperature';
                                  _plantinfo = widget.plant.temperatureInformation;
                                  _pc.open();
                                },
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child: VerticalAddButton(
                            onPressed: () => this.onAddPlantPressed(context),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                SlidingUpPanel(
                  controller: _pc,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  backdropEnabled: true,
                  maxHeight: MediaQuery.of(context).size.height - 240,
                  minHeight: 0,
                  panel: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                        child: Container(
                          height: 6,
                          width: 99,
                          decoration: BoxDecoration(
                            color: CustomColorScheme.primaryColor2,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              _infotitle,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 2,
                        width: 380,
                        decoration: BoxDecoration(
                          color: CustomColorScheme.primaryColor2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          _plantinfo,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
