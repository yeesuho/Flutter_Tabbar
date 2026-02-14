import 'package:flutter/material.dart';

import '../const/tabs.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() => _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: TabInfo.TABS.length, vsync: this);
    tabController.addListener(() => setState(() {

    }),);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Navigation Bar Screen"),
      ),
      body: TabBarView(
        controller: tabController,
          children: TabInfo.TABS.map((e) => Icon(e.icon),
          ).
      toList()
      ),
      bottomNavigationBar: AnimatedBuilder( // 애니메이션 값에 따라 바텀탭바 아이콘 반응이 더 빠르게
        animation: tabController.animation!, // 애니메이션을 AnimatedBuilder에 넘겨서 그 값이 변할 때마다 다시 빌드하게 만드는 방식
        builder: (context, _) {
          final currentIndex = tabController.animation!.value.round(); // 현재의 인덱스를 저장하는 변수에 tabController의 animation.value(index는 현재 탭위치를 정수로 animation은 현재 탭위치를 실수로 표현)값을 round로 실수를 가까운 정수 값으로 반올림해서 0.0 에서 0.5 는 인덱스 0, 0.6에서 1.5는 인덱스 1 이런식으로 값을 가지게 됨 그래서 그냥 tabController.index보다 반응이 빠르게 됨
          // print(currentIndex);
          // print(tabController.animation!);
          // print(tabController.animation!.value);
          return BottomNavigationBar(
              selectedItemColor: Colors.black, // 선택된 아이템(탭)의 컬러
              unselectedItemColor: Colors.grey, // 선택되지 않은 아이템(탭)의 컬러
              showSelectedLabels: true, // 선택된 아이템의 레이블을 보일거냐?? (기본값 true)
              showUnselectedLabels: true, // 선택되지A 않은 아이템의 레이블을 보일거냐?? (기본값 false)

              currentIndex: currentIndex, // 현재 인덱스는 tabController에 있는 인덱스
              onTap: (value) { // 탭을 눌렀을때 매개변수로 누른 탭의 인덱스 정보가 들어가게 됨
                tabController.animateTo(value); // 탭을 받은 매개변수값(인덱스)으로 이동 해라
              },

              type: BottomNavigationBarType.fixed, // 선택된 아이콘이 확대 되지 않음
              // type: BottomNavigationBarType.shifting,(기본값) // 선택된 아이콘이 확대 됨
              items: TabInfo.TABS.map((e) => BottomNavigationBarItem(icon: Icon(e.icon), label: e.label),).toList()
          );
        },
      ),


      // bottomNavigationBar: BottomNavigationBar(
      //     selectedItemColor: Colors.black, // 선택된 아이템(탭)의 컬러
      //     unselectedItemColor: Colors.grey, // 선택되지 않은 아이템(탭)의 컬러
      //     showSelectedLabels: true, // 선택된 아이템의 레이블을 보일거냐?? (기본값 true)
      //     showUnselectedLabels: true, // 선택되지A 않은 아이템의 레이블을 보일거냐?? (기본값 false)
      //
      //     currentIndex: tabController.index, // 현재 인덱스는 tabController에 있는 인덱스
      //     onTap: (value) { // 탭을 눌렀을때 매개변수로 누른 탭의 인덱스 정보가 들어가게 됨
      //       tabController.animateTo(value); // 탭을 받은 매개변수값(인덱스)으로 이동 해라
      //     },
      //
      //     type: BottomNavigationBarType.fixed, // 선택된 아이콘이 확대 되지 않음
      //     // type: BottomNavigationBarType.shifting,(기본값) // 선택된 아이콘이 확대 됨
      //     items: TabInfo.TABS.map((e) => BottomNavigationBarItem(icon: Icon(e.icon), label: e.label),).toList()
      // );

    );
  }
}
