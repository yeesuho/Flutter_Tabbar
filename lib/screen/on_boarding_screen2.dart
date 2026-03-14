import 'package:flutter/material.dart';

class OnBoardingScreen2 extends StatefulWidget {
  const OnBoardingScreen2({super.key});

  @override
  State<OnBoardingScreen2> createState() => _OnBoardingScreen2State();
}

class ScreenModel {
  final String title;
  final String subTitle;
  ScreenModel({required this.title, required this.subTitle});
}

class _OnBoardingScreen2State extends State<OnBoardingScreen2> with TickerProviderStateMixin {
  late TabController tabController;

  final screens = [
    ScreenModel(title: "Screen 1", subTitle: "첫 번째 스크린입니다"),
    ScreenModel(title: "Screen 2", subTitle: "두 번째 스크린입니다"),
    ScreenModel(title: "Screen 3", subTitle: "세 번째 스크린입니다"),
    ScreenModel(title: "Last Screen", subTitle: "마지막 스크린입니다"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: screens.length, vsync: this);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("OnBoardingScreen2"),),
      body: Stack(
        children: [
          TabBarView(
              controller: tabController,
              children: screens.map((e) => Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 200),
                  child: Column(

                    children: [
                      Text(e.title, style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Text(e.subTitle, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      SizedBox(height: 30,),

                      if (screens[screens.length-1] == e)
                        ElevatedButton(
                            onPressed: () => tabController.animateTo(tabController.index = 0),
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.black
                            ),
                            child: Text("처음으로", style: TextStyle(color: Colors.white, fontSize: 16),)
                        ),
                    ],
                  ),
                ),
              ),
              ).toList()
          ),
          AnimatedBuilder(animation: tabController.animation!, builder: (context, child) {
            final currentIndex = tabController.animation!.value.round();
            return Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 300),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(screens.length, (i) => GestureDetector(
                    onTap: () {
                      if (currentIndex !=  i) {
                        tabController.animateTo(tabController.index = i);
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: currentIndex == i ? Colors.black : Colors.grey,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                  ),
                ),
              ),
            );
          },)
        ],
      ),
    );
  }
}
