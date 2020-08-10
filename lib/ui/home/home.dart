import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/ui/home/fab_menu_option/add_check_list.dart';
import 'package:task_manager/ui/home/fab_menu_option/add_note.dart';
import 'package:task_manager/ui/home/fab_menu_option/add_task.dart';
import 'package:task_manager/ui/home/pages/my_task.dart';
import 'package:task_manager/ui/home/pages/profile.dart';
import 'package:task_manager/ui/home/pages/project.dart';
import 'package:task_manager/ui/home/pages/quick_notes.dart';
import 'package:task_manager/utils/style.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget myTask;
  Widget dashboardWidget = Project();
  Widget quickNoteWidget = QuickNotes();
  Widget profileWidget = Profile();
  Widget selectedWidget;
  int menuIndex = 0;
  GlobalKey keyFab = GlobalKey();
  bool isFabClicked = false;

  @override
  void initState() {
    super.initState();
    myTask = MyTask();
    selectedWidget = myTask;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: selectedWidget,
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          notchMargin: 8,
          shape: CircularNotchedRectangle(),
          child: Padding(
            padding: EdgeInsets.only(top: 12, bottom: 12),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: IconButton(
                  icon: Icon(Icons.check_circle,
                      color: menuIndex == 0 ? Colors.black : Colors.grey),
                  onPressed: () {
                    menuIndex = 0;
                    getMenuItem();
                  },
                )),
                Expanded(
                    child: IconButton(
                  icon: Icon(
                    Icons.dashboard,
                    color: menuIndex == 1 ? Colors.black : Colors.grey,
                  ),
                  onPressed: () {
                    menuIndex = 1;
                    getMenuItem();
                  },
                )),
                Expanded(
                  child: SizedBox(),
                ),
                Expanded(
                    child: IconButton(
                        icon: Icon(Icons.receipt,
                            color: menuIndex == 2 ? Colors.black : Colors.grey),
                        onPressed: () {
                          menuIndex = 2;
                          getMenuItem();
                        })),
                Expanded(
                    child: IconButton(
                        icon: Icon(Icons.person,
                            color: menuIndex == 3 ? Colors.black : Colors.grey),
                        onPressed: () {
                          menuIndex = 3;
                          getMenuItem();
                        })),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showTaskMenuDialog();
          },
          backgroundColor: Colors.black,
          child: Icon(Icons.add),
        ));
  }

  showTaskMenuDialog() {
    var alertDialog = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      content: Wrap(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  child: FlatButton(
                    child: Text(
                      "Add Task",
                      style: CustomTextStyle.styleSemiBold,
                    ),
                    onPressed: () {
                      Get.back();
                      Get.to(AddTask());
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: FlatButton(
                    child: Text(
                      "Add Quick Notes",
                      style: CustomTextStyle.styleSemiBold,
                    ),
                    onPressed: () {
                      Get.back();
                      Get.to(AddNote());
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  child: FlatButton(
                    child: Text(
                      "Add Check List",
                      style: CustomTextStyle.styleSemiBold,
                    ),
                    onPressed: () {
                      Get.back();
                      Get.to(AddCheckList());
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    showDialog(context: context, builder: (context) => alertDialog);
  }

  getMenuItem() {
    if (menuIndex == 0 && selectedWidget != myTask) {
      selectedWidget = myTask;
      setState(() {});
    } else if (menuIndex == 1 && selectedWidget != dashboardWidget) {
      selectedWidget = dashboardWidget;
      setState(() {});
    } else if (menuIndex == 2 && selectedWidget != quickNoteWidget) {
      selectedWidget = quickNoteWidget;
      setState(() {});
    } else {
      if (selectedWidget != profileWidget) {
        selectedWidget = profileWidget;
        setState(() {});
      }
    }
  }
}
