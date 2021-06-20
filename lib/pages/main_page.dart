import 'package:camera/camera.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:planted/models/plant.dart';
import 'package:planted/pages/empty_home_page.dart';
import 'package:planted/pages/encyclopedia_page.dart';
import 'package:planted/pages/list_home_page.dart';
import 'package:planted/pages/plant_search_page.dart';
import 'package:planted/pages/welcome_back_page.dart';
import 'package:planted/providers/main_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../constants.dart';

class MainPageWidget extends StatefulHookWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MainPageWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
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
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(85),
        child: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Padding(
            padding: EdgeInsets.only(top: 30, bottom: 11),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                  icon: Icon(Icons.menu),
                ),
                Text(
                  setTitle(),
                  style: Constants.mainFont.copyWith(
                    fontSize: 34.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Image.asset(ImageFiles.logo),
            ),
            ListTile(
              title: Text('Sign Out'),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WelcomePageWidget(),
                  ),
                );
              },
            ),
          ],
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
