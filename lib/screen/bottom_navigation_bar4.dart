import 'package:flutter/material.dart';
import 'package:tab_bar/const/tabs.dart';

class BottomNavigationBar4 extends StatefulWidget {
  const BottomNavigationBar4({super.key});

  @override
  State<BottomNavigationBar4> createState() => _BottomNavigationBar4State();
}

class _BottomNavigationBar4State extends State<BottomNavigationBar4> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: TabInfo.TABS.length, vsync: this);
    // tabController.addListener(() => setState(() {
    //
    // }),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bottom Navigation bar 4 & button"),),
      body: Stack(
        children: [
          TabBarView(
              controller: tabController,
              children: TabInfo.TABS.map((e) => Icon(e.icon),).toList()

          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedBuilder(animation: tabController.animation!, builder: (context, child) {
              return Padding(
                padding: EdgeInsets.only(bottom: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if(tabController.animation!.value.round() >= 1)
                      ElevatedButton(onPressed: () {
                        tabController.animateTo(
                            tabController.index-1
                        );
                      }, child: Text("이전")),
                    if(tabController.animation!.value.round() < TabInfo.TABS.length-1)
                      ElevatedButton(onPressed: () {
                        tabController.animateTo(
                            tabController.index+1
                        );
                      }, child: Text("다음"))
                  ],),
              );
            },)
          )
        ],
      ),
      bottomNavigationBar: AnimatedBuilder(
          animation: tabController.animation!,
          builder: (context, child) {
            final currentIndex = tabController.animation!.value.round();
            return BottomNavigationBar(
                selectedItemColor: Colors.black,
                unselectedItemColor: Colors.grey,
                currentIndex: currentIndex,
                onTap: (value) => tabController.animateTo(value),
                items: TabInfo.TABS.map((e) => BottomNavigationBarItem(icon: Icon(e.icon), label: e.label),).toList()
            );
          },)
    );
  }
}
