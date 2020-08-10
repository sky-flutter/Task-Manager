import 'package:flutter/material.dart';
import 'package:task_manager/utils/style.dart';
import 'package:task_manager/widget/home_appbar.dart';

import '../month_page.dart';
import '../today_page.dart';

class MyTask extends StatefulWidget {
  @override
  _MyTaskState createState() => _MyTaskState();
}

class _MyTaskState extends State<MyTask> with SingleTickerProviderStateMixin {
  TabController tabController;
  PageController pageController;
  var todayPage = TodayPage();
  var monthPage = MonthPage();
  int selectedTaskValue = 3;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
    tabController.addListener(() {});
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        title: "Work List",
        leading: Container(),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text(
                    "InCompleted Tasks",
                    style: CustomTextStyle.styleMedium,
                  ),
                  value: 1,
                ),
                PopupMenuItem(
                  child: Text(
                    "Completed Tasks",
                    style: CustomTextStyle.styleMedium,
                  ),
                  value: 2,
                ),
                PopupMenuItem(
                  child: Text(
                    "All Tasks",
                    style: CustomTextStyle.styleMedium,
                  ),
                  value: 3,
                ),
              ];
            },
            onSelected: (value) {
              setState(() {
                selectedTaskValue = value;
              });
            },
            initialValue: selectedTaskValue,
            offset: Offset(
                0,
                selectedTaskValue == 3
                    ? 300
                    : selectedTaskValue == 2 ? 200 : 100),
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            icon: Icon(Icons.format_list_numbered),
          )
        ],
        bottomMenu: PreferredSize(
          preferredSize: Size(double.infinity, 96),
          child: DefaultTabController(
            length: 2,
            child: TabBar(
                onTap: (index) {
                  pageController.animateToPage(index,
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeInOut);
                },
                controller: tabController,
                labelStyle: CustomTextStyle.styleMedium.copyWith(fontSize: 18),
                indicatorColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor: Colors.white38,
                tabs: [
                  Tab(
                    child: Text(
                      "Today",
                    ),
                  ),
                  Tab(
                    child: Text("Month",),
                  ),
                ]),
          ),
        ),
      ).build(),
      body: Container(
        child: PageView(
          controller: pageController,
          onPageChanged: (page) {
            setState(() {
              tabController.index = page;
            });
          },
          children: [todayPage, monthPage],
        ),
      ),
    );
  }
}
