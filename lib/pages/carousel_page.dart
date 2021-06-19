import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:planted/components/carousel_card.dart';
import 'package:planted/components/custom_elevated_button.dart';
import 'package:planted/pages/welcome_back_page.dart';
import '../constants.dart';

class CarouselPage extends StatefulWidget {
  @override
  _CarouselPageState createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> with TickerProviderStateMixin {
  int _currentIndex = 0;

  List cardList = [
    CarouselCard(
      title: 'Manage plants',
      description: 'Easily manage plant requirements, schedule care, and log your own enviornmental conditions.',
      image: ImageFiles.organize,
    ),
    CarouselCard(
      title: 'Quick problem solving',
      description: 'Quickly learn how to remove the different pests or fungus that might be harming your plants.',
      image: ImageFiles.reading,
    ),
    CarouselCard(
      title: 'Identify new plants',
      description: 'Take a photo of uknown plants and discover their names.',
      image: ImageFiles.waving,
    ),
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  /// Event handler for the "Continue" button
  void onContinuePressed(BuildContext context) async {
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => WelcomePageWidget(),
      ),
    );
  }

  /// UI
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Flexible(
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 650.0,
                  autoPlay: false,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  pauseAutoPlayOnTouch: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: cardList.map((card) {
                  return Builder(builder: (BuildContext context) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.30,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        color: CustomColorScheme.primaryColor,
                        child: card,
                      ),
                    );
                  });
                }).toList(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(cardList, (index, url) {
                return Flexible(
                  child: Container(
                    width: 10.0,
                    height: 10.0,
                    margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == index ? CustomColorScheme.primaryColor : Colors.grey,
                    ),
                  ),
                );
              }),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: CustomElevatedButton(
                onPressed: () => this.onContinuePressed(context),
                label: 'Next',
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
