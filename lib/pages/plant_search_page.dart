import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutterinit/mocks/plants_mocks.dart';
import 'package:flutterinit/models/plant.dart';
import 'package:flutterinit/pages/camera_page.dart';
import 'package:flutterinit/pages/plant_page.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class SearchPageWidget extends StatefulWidget {
  final CameraDescription camera;

  SearchPageWidget({required this.camera});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<SearchPageWidget> {
  List<Plant> selectedPlants = [];

  void onSearchButtonPressed(BuildContext context, Plant selectedPlant) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlantPageWidget(
          plant: selectedPlant,
        ),
      ),
    );
  }

  void onBackButtonPressed(BuildContext context) async {
    Navigator.pop(context);
  }

  List<Widget> generateListTiles() {
    List<Widget> listTiles = [];

    // If no plants have been selected, then display ALL of them
    List<Plant> dataSource = selectedPlants;
    if (selectedPlants.isEmpty) {
      dataSource = mockPlants;
    }

    dataSource.forEach((Plant plant) {
      listTiles.add(
        ListTile(
          title: Text(plant.name),
          onTap: () {
            this.onSearchButtonPressed(context, plant);
          },
        ),
      );
    });

    return listTiles;
  }

  Widget buildFloatingSearchBarBody() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Material(
        child: Column(
          children: generateListTiles(),
        ),
      ),
    );
  }

  // monst
  void onSearchChanged(String query) {
    setState(() {
      selectedPlants = mockPlants.where((Plant plant) {
        return plant.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  //UI of the Main Page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Camera on bottom
          CameraPage(camera: widget.camera),

          // Search bar on top
          FloatingSearchBar(
            automaticallyImplyBackButton: false,
            hint: 'Search for plants',
            margins: EdgeInsets.all(20),
            transitionCurve: Curves.easeInOutCubic,
            transition: CircularFloatingSearchBarTransition(),
            physics: const BouncingScrollPhysics(),
            builder: (context, _) => buildFloatingSearchBarBody(),
            onQueryChanged: onSearchChanged,
          ),
        ],
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75),
        child: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
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
                      onTap: () => this.onBackButtonPressed(context),
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                  Text(
                    'New Plants',
                    style: const TextStyle(
                      fontSize: 34.0,
                      fontWeight: FontWeight.normal,
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
    );
  }
}
