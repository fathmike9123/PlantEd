import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutterinit/models/plant.dart';
import 'package:flutterinit/pages/empty_home_page.dart';
import 'package:flutterinit/pages/encyclopedia_page.dart';
import 'package:flutterinit/pages/list_home_page.dart';
import 'package:flutterinit/pages/plant_search_page.dart';
import 'package:flutterinit/providers/main_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../constants.dart';

class MainPageWidget extends StatefulHookWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MainPageWidget> {
  late List<Plant> userPlants;
  int _currentNavBarIndex = 0;

  void onAddPressed(BuildContext context) async {
    List<CameraDescription> cameras = await availableCameras();
    CameraDescription firstCamera = cameras.first;

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchPageWidget(
          camera: firstCamera,
        ),
      ),
    );
  }

  Widget setBody() {
    switch (_currentNavBarIndex) {
      case 0:
        if (this.userPlants.isEmpty) {
          return EmptyHomePage();
        } else {
          return ListHomePage();
        }
      case 1:
        return EncyclopediaPage();
      default:
        return Container();
    }
  }

  String setTitle() {
    switch (_currentNavBarIndex) {
      case 0:
        return 'My Plants';
      case 1:
        return 'Encyclopedia';
      default:
        return '';
    }
  }

  //UI of the Main Page
  @override
  Widget build(BuildContext context) {
    userPlants = useProvider(listUserPlants).state;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(85),
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
              Text(
                setTitle(),
                style: Constants.mainFont.copyWith(
                  fontSize: 34.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                height: 11,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: setBody(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_rounded),
        onPressed: () => this.onAddPressed(context),
        backgroundColor: CustomColorScheme.primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAlias,
        notchMargin: 10,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          currentIndex: this._currentNavBarIndex,
          selectedItemColor: CustomColorScheme.primaryColor,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: (int selectedIndex) {
            setState(() {
              this._currentNavBarIndex = selectedIndex;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.menu_book_rounded,
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
