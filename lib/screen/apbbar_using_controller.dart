import 'package:flutter/material.dart';

import '../const/tabs.dart';

class ApbbarUsingController extends StatefulWidget {
  const ApbbarUsingController({super.key});

  @override
  State<ApbbarUsingController> createState() => _ApbbarUsingControllerState();
}

class _ApbbarUsingControllerState extends State<ApbbarUsingController> with TickerProviderStateMixin { // 실제 한 프레임(틱)이 효율적으로 사용할 수 있게 해줌
  late final TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(
        length: TabInfo.TABS.length,
        vsync: this
    ); // vsync: this는 TickerProviderStateMixin을 사용해서 한틱당 한프레임당 효율적으로 컨트롤러를 사용할 수 있게 해주는 역할

    tabController.addListener(() { // tabController 값이 변경이 될때마다 addListener 안에 함수를 실행하게 됨
      setState(() {

      });
    },);
  }

  @override
  Widget build(BuildContext context) { // 이거 응용해서 온보딩 화면 만들수 있을듯
    return Scaffold(

      appBar: AppBar(
        title: Text("Appbar Using Controller"),
        bottom: TabBar(
          controller: tabController, // tabController을 사용했을 때 장점: tabController의 인덱스를 활용한 화면 이동 가능

            tabs: TabInfo.TABS.map((e) => Tab( icon: Icon(e.icon),text: e.label,) ).toList()
        ),
      ),
      body: Stack(
        children: [
          TabBarView(
            // physics: NeverScrollableScrollPhysics(),
            controller: tabController,
              children: TabInfo.TABS.map((e) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(e.icon),

                ],
              ),).toList()

          ),
          Align(
            alignment: Alignment.bottomCenter,

            child: Padding(
              padding: EdgeInsets.only(bottom: 100),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if(tabController.index != 0) //이것만 있는다고 버튼이 1일때 생기지 않음 왜냐면 true가 나와도 build가 새로 불리지 않기 때문임
                    ElevatedButton(onPressed: () {
                      tabController.animateTo(
                        tabController.index-1,
                      );
                    }, child: Text("이전")),
                  if(tabController.index != TabInfo.TABS.length-1)
                  ElevatedButton(onPressed: () {
                    tabController.animateTo(
                      tabController.index+1,
                    );
                  }, child: Text("다음")),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
