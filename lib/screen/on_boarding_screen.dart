import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> with TickerProviderStateMixin {
  late TabController tabController;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
    
  }

  @override
  void dispose() {

    // TODO: implement dispose
    tabController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          TabBarView(
            controller: tabController,
              children: [
            Center(
              child: Text("온보딩 스크린 1입니다", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),

            ),
            Center(
              child: Text("온보딩 스크린 2입니다", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
            ),
            Center(
              child: Text("온보딩 스크린 3입니다", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("다시 처음으로 돌아가기", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                  SizedBox(height: 30,),
                  ElevatedButton(onPressed: () {
                    tabController.animateTo(0);
                  }, style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                  ), child: Text("다시 처음으로 돌아가기", style: TextStyle(fontSize: 16),)
                  ),
                ],
              ),
            ),
          ]),
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedBuilder(animation: tabController.animation!, builder: (context, child) {
              return Padding(
                padding: EdgeInsets.only(bottom: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                    List.generate(4, (index) => Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: index == tabController.animation!.value.round() ? Colors.black : Colors.grey
                        ),
                      ),
                    ),)
                  ,

                ),
              );
            },),
          ),
          SafeArea(

            child: Padding(
              padding: EdgeInsets.only(left: 10, top: 10),
              child: IconButton(onPressed: () {
                Navigator.of(context).pop();
              }, icon: Icon(Icons.arrow_back_ios, size: 32,)),
            ),
          )
        ],
      ),



      
    );
  }
}
