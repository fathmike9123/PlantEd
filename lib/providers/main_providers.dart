// For state management

import 'package:flutterinit/models/plant.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

final nameProvider = StateProvider<String>((ProviderReference ref) => '');
final panelControllerProvider = StateProvider<PanelController>((ProviderReference ref) => PanelController());
final listUserPlants = StateProvider<List<Plant>>((ProviderReference ref) => []);
