import 'package:flutter/material.dart';
import 'package:tab_bar/const/tabs.dart';

class BasicAppbarTabbarScreen extends StatelessWidget {
  const BasicAppbarTabbarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController( // 일반적으로는 DefaultTabController를 사용하는거보다 직접 controller를 주입하는 경우가 더 많음
        length: TabInfo.TABS.length,
        child: Scaffold(
      appBar: AppBar(
        title: Text("BasicAppBarScreen"),
        bottom: PreferredSize( // PreferredSize의 child는 widget이기 때문에 Row로 감싸주고 TabBar를 자유롭게 tabbar를 꼼수로 디자인할 수 있다
            preferredSize: Size.fromHeight(80),

            child: Row(

              children: [
                Expanded(
                  child: TabBar(

                      indicatorColor: Colors.red, // 선택된 탭의 바의 색을 지정 해줌
                      indicatorWeight: 4, // 두꺼워짐
                      indicatorSize: TabBarIndicatorSize.tab, // 탭 크기 만큼 탭 인디케이터 크기가 늘어남
                      isScrollable: true, // 스크롤이 가능하게 해줌 기본값 false를 하면 깨지게 됨
                      labelColor: Colors.blue, // 선택된 탭의 색
                      unselectedLabelColor: Colors.grey, // 선택되지 않은 탭의 색
                      labelStyle: TextStyle( // 선택된 탭의 스타일 지정
                          fontWeight: FontWeight.bold
                      ),
                      unselectedLabelStyle: TextStyle( // 선택되지 않은 탭의 스타일 지정
                          fontSize: 10
                      ),

                      tabs: TabInfo.TABS.map((e) => Tab(icon: Icon(e.icon), text: e.label,),).toList()
                      // tabs: [...TabInfo.TABS, ...TabInfo.TABS, ...TabInfo.TABS,] .map((e) => Tab(icon: Icon(e.icon), child: Text(e.label),),).toList()
                  ),
                ),
              ],
            ),
        ),
      ),
      body: TabBarView(
          physics: NeverScrollableScrollPhysics(), // 옆으로 스와이프가 불가능하게 해줌
          // children: [...TabInfo.TABS, ...TabInfo.TABS, ...TabInfo.TABS,] .map((e) => Center(child: Icon(e.icon)),).toList()
          children: TabInfo.TABS.map((e) => Center(child: Icon(e.icon)),).toList(),
      )
    ));
  }
}
