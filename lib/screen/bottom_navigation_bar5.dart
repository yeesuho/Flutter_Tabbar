import 'package:flutter/material.dart';

class BottomNavigationBar5 extends StatefulWidget {
  const BottomNavigationBar5({super.key});

  @override
  State<BottomNavigationBar5> createState() => _BottomNavigationBar5State();
}

class _BottomNavigationBar5State extends State<BottomNavigationBar5> with TickerProviderStateMixin{
  late TabController tabController;
  final List<int> numbers = List.generate(3, (index) => index,);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: numbers.length, vsync: this);
    // tabController.addListener(() => setState(() {
    //
    // }),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BottomNavigationBar5"),
      ),
      body: Stack(
        children: [
          TabBarView(
              controller: tabController,
              children: numbers.map((e) => Center(child: Text(e.toString(), style: TextStyle(fontSize: 30),),),).toList()
          ),
          AnimatedBuilder(animation: tabController.animation!, builder: (context, child) {
            return Padding(
              padding: EdgeInsets.only(bottom: 280),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Spacer(),
                    if(tabController.animation!.value.round() >= 1)
                      IconButton(onPressed: () {
                        tabController.animateTo(tabController.index-1);
                      }, icon: Icon(Icons.arrow_back_ios_rounded)),
                    Spacer(),
                    if(tabController.animation!.value.round() < numbers.length-1)
                      IconButton(onPressed: () {
                        tabController.animateTo(tabController.index+1);
                      }, icon: Icon(Icons.arrow_forward_ios_rounded)),
                    Spacer(),
                  ],
                ),
              ),
            );
          },)
        ],
      ),

      bottomNavigationBar: AnimatedBuilder(animation: tabController.animation!, builder: (context, child) {
        final currentIndex = tabController.animation!.value.round();
        return BottomNavigationBar(
          selectedItemColor: Colors.black,
          currentIndex: currentIndex,
          onTap: (value) => tabController.animateTo(value),
          items: numbers.map((e) => BottomNavigationBarItem(icon: Icon(Icons.home), label: e.toString()),).toList(),
        );
      },),
    );
  }
}
