import 'package:flutter/material.dart';

class BottomNavigationBar3 extends StatefulWidget {
  const BottomNavigationBar3({super.key});

  @override
  State<BottomNavigationBar3> createState() => _BottomNavigationBar3State();
}

class _BottomNavigationBar3State extends State<BottomNavigationBar3> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() => setState(() {

    }),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bottom Navigation bar 3"),),
      body: TabBarView(
          controller: tabController,
          children: [
        Center(
          child: Icon(Icons.align_horizontal_right),

        ),
        Center(
          child: Icon(Icons.home),

        ),
        Center(child: Icon(Icons.settings),)
      ]),
      bottomNavigationBar: AnimatedBuilder(animation: tabController.animation!, builder: (context, child) {
        final currentIndex = tabController.animation!.value.round();
        return BottomNavigationBar(
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            currentIndex: currentIndex,
            onTap: (value) => tabController.animateTo(value),
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "profile"),
            ]
        );
      },),
    );
  }
}
