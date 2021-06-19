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
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.topCenter,
                image: AssetImage(widget.plant.photoAsset),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),

          // App bar on top
          PreferredSize(
            preferredSize: Size.fromHeight(75),
            child: AppBar(
              elevation: 0,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          widget.plant.name,
                          style: const TextStyle(
                            fontSize: 34.0,
                            fontWeight: FontWeight.normal,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 11,
                  ),
                ],
              ),
            ),
          ),

          // Bottom menu
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20.0),
                  topRight: const Radius.circular(20.0),
                ),
                color: CustomColorScheme.primaryColorSand,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
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
                          Flexible(
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
                    ),
                    Flexible(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
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
                          Flexible(
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
                    ),
                    Flexible(
                      child: VerticalAddButton(
                        onPressed: () => this.onAddPlantPressed(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Sliding up menu
          SlidingUpPanel(
            controller: _pc,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            backdropEnabled: true,
            maxHeight: MediaQuery.of(context).size.height - 240,
            minHeight: 0,
            panel: NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (overscroll) {
                overscroll.disallowGlow();
                return true;
              },
              child: SingleChildScrollView(
                child: Column(
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
            ),
          ),
        ],
      ),
    );
  }
}
