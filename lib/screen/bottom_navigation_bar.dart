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
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black, // 선택된 아이템(탭)의 컬러
          unselectedItemColor: Colors.grey, // 선택되지 않은 아이템(탭)의 컬러
          showSelectedLabels: true, // 선택된 아이템의 레이블을 보일거냐?? (기본값 true)
          showUnselectedLabels: true, // 선택되지A 않은 아이템의 레이블을 보일거냐?? (기본값 false)

          currentIndex: tabController.index, // 현재 인덱스는 tabController에 있는 인덱스
          onTap: (value) { // 탭을 눌렀을때 매개변수로 누른 탭의 인덱스 정보가 들어가게 됨
            tabController.animateTo(value); // 탭을 받은 매개변수값(인덱스)으로 이동 해라
          },

          type: BottomNavigationBarType.fixed, // 선택된 아이콘이 확대 되지 않음
          // type: BottomNavigationBarType.shifting,(기본값) // 선택된 아이콘이 확대 됨
          items: TabInfo.TABS.map((e) => BottomNavigationBarItem(icon: Icon(e.icon), label: e.label),).toList()
      ),

    );
  }
}
