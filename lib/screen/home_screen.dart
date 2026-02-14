import 'package:flutter/material.dart';
import 'package:tab_bar/screen/apbbar_using_controller.dart';
import 'package:tab_bar/screen/basic_appbar_tabbar_screen.dart';
import 'package:tab_bar/screen/bottom_navigation_bar2.dart';
import 'package:tab_bar/screen/bottom_navigation_bar3.dart';

import 'bottom_navigation_bar.dart';
import 'bottom_navigation_bar4.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => BasicAppbarTabbarScreen(),));
            }, child: Text("Basic AppBar TabBar Screen")),
            ElevatedButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ApbbarUsingController(),));
            }, child: Text("AppBar Using Controller Screen")),
            ElevatedButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => BottomNavigationBarScreen(),));
            }, child: Text("Bottom Navigation Bar Screen")),
            ElevatedButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => BottomNavigationBar2(),));
            }, child: Text("Bottom Navigation Bar2 Screen")),
            ElevatedButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => BottomNavigationBar3(),));
            }, child: Text("Bottom Navigation Bar3 Screen")),
            ElevatedButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => BottomNavigationBar4(),));
            }, child: Text("Bottom Navigation Bar4 & button Screen"))
          ],
        ),
      ),

    );
  }
}
