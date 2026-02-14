import 'package:flutter/material.dart';

import '../const/tabs.dart';

class BottomNavigationBar2 extends StatefulWidget {
  const BottomNavigationBar2({super.key});

  @override
  State<BottomNavigationBar2> createState() => _BottomNavigationBar2State();
}

class _BottomNavigationBar2State extends State<BottomNavigationBar2> with TickerProviderStateMixin{
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    tabController = TabController(length: TabInfo.TABS.length, vsync: this);
    tabController.addListener(() => setState(() {

    }),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Navigation Bar2"),

      ),
      body: TabBarView(
        controller: tabController,
          children: TabInfo.TABS.map((e) => Icon(e.icon),).toList()
      ),
      bottomNavigationBar: AnimatedBuilder(animation: tabController.animation!, builder: (context, child) {
        final currentIndex = tabController.animation!.value.round();

        return BottomNavigationBar(

            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: false,

            currentIndex: currentIndex,

            onTap: (value) => tabController.animateTo(value),

            items: TabInfo.TABS.map((e) => BottomNavigationBarItem(icon: Icon(e.icon), label: e.label),).toList()
        );
      },),
    );
  }
}
