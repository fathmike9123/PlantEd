import 'package:flutter/material.dart';
import 'package:flutterinit/components/custom_square_button.dart';
import 'package:flutterinit/constants.dart';
import 'package:flutterinit/pages/web_view_page.dart';

class EncyclopediaPage extends StatefulWidget {
  const EncyclopediaPage({Key? key}) : super(key: key);

  @override
  _EncyclopediaPageState createState() => _EncyclopediaPageState();
}

class _EncyclopediaPageState extends State<EncyclopediaPage> {
  void openWebViewPage() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WebViewPageWidget(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        ListTile(
          title: CustomSquareButton(
            onPressed: openWebViewPage,
            label: 'Insects',
            image: ImageFiles.insect,
            url: 1,
          ),
        ),
        ListTile(
          title: CustomSquareButton(
            onPressed: openWebViewPage,
            label: 'Fungus',
            image: ImageFiles.leaf,
            url: 2,
          ),
        )
      ],
    );
  }
}
