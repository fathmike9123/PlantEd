import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutterinit/components/add_button_vertical.dart';
import 'package:flutterinit/components/plant_info_button.dart';
import 'package:flutterinit/constants.dart';
import 'package:flutterinit/icons.dart';
import 'package:flutterinit/models/plant.dart';
import 'package:flutterinit/pages/main_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterinit/providers/main_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PlantPageWidget extends StatefulHookWidget {
  final Plant plant;

  PlantPageWidget({
    required this.plant,
  });

  @override
  _PlantPageWidgetState createState() => _PlantPageWidgetState();
}

class _PlantPageWidgetState extends State<PlantPageWidget> {
  late ValueNotifier<String>? _infoTitle;
  late ValueNotifier<String>? _plantInfo;
  late List<Plant> userPlants;
  final PanelController _pc = PanelController();

  void onAddPlantPressed(BuildContext context) async {
    userPlants.add(widget.plant);

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MainPageWidget(),
      ),
    );
  }

  void onPlantInfoButtonPressed(String infoTitle, String plantInfo) {
    _infoTitle!.value = infoTitle;
    _plantInfo!.value = plantInfo;
    _pc.open();
  }

  //UI of the Main Page
  @override
  Widget build(BuildContext context) {
    _infoTitle = useState('');
    _plantInfo = useState('');
    userPlants = useProvider(listUserPlants).state;

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

          // Gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFFFFFF),
                  Colors.transparent,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0, 0.4],
              ),
              borderRadius: BorderRadius.circular(10),
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
                          child: Icon(
                            Icons.navigate_before,
                            size: 35,
                            color: CustomColorScheme.primaryColor,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          widget.plant.name,
                          style: Constants.mainFont.copyWith(
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
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
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
                              onPressed: () => this.onPlantInfoButtonPressed('Light', widget.plant.lightInformation),
                            ),
                          ),
                          Flexible(
                            child: PlantInfoButton(
                              label: 'Fertilizer',
                              icon: CustomIcons.fertilizer_leaf,
                              onPressed: () => this.onPlantInfoButtonPressed('Fertilizer', widget.plant.fertilizerInformation),
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
                              onPressed: () => this.onPlantInfoButtonPressed('Water', widget.plant.waterInformation),
                            ),
                          ),
                          Flexible(
                            child: PlantInfoButton(
                              label: 'Temp',
                              icon: Icons.thermostat_rounded,
                              onPressed: () => this.onPlantInfoButtonPressed('Temperature', widget.plant.temperatureInformation),
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
                            _infoTitle!.value,
                            textAlign: TextAlign.left,
                            style: Constants.mainFont.copyWith(
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
                        _plantInfo!.value,
                        textAlign: TextAlign.left,
                        style: Constants.mainFont.copyWith(
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
