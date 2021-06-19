import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutterinit/components/plant_card.dart';
import 'package:flutterinit/models/plant.dart';
import 'package:flutterinit/providers/main_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ListHomePage extends StatefulHookWidget {
  @override
  _ListHomePageState createState() => _ListHomePageState();
}

class _ListHomePageState extends State<ListHomePage> {
  late List<Plant> userPlants;

  @override
  Widget build(BuildContext context) {
    userPlants = useProvider(listUserPlants).state;

    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overscroll) {
        overscroll.disallowGlow();
        return true;
      },
      child: ListView.builder(
        itemCount: userPlants.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: PlantCard(
              plant: userPlants[index],
            ),
          );
        },
      ),
    );
  }
}
