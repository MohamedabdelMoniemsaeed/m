import 'package:flutter/material.dart';
import 'package:movise/Theme/ColorsTheme.dart';
import 'package:movise/Theme/ImagesTheme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int cindex = 0;
  List<Widget> tabs = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(),
      bottomNavigationBar: buildBottomNavigationBar(),
    ));
  }

  Widget buildBottomNavigationBar() => Theme(
        data: ThemeData(canvasColor: ColorsTheme.blackBar),
        child: BottomNavigationBar(
          selectedItemColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          iconSize: 30,
          currentIndex: cindex,
          onTap: (index) {
            cindex = index;

            setState(() {});
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "HOME"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "SEARCH"),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_collection),
              label: "BROWSE",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.subscriptions), label: "WATCHLIST"),
          ],
        ),
      );
}
