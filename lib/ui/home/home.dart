import 'package:awesome_speed_dial/awesome_speed_dial.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/ui/home/fab_menu_option/add_note.dart';
import 'package:task_manager/ui/home/pages/my_task.dart';
import 'package:task_manager/ui/home/pages/profile.dart';
import 'package:task_manager/ui/home/pages/project.dart';
import 'package:task_manager/ui/home/pages/quick_notes.dart';

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
        floatingActionButton: AwesomeSpeedDial(
          colorStartAnimation: Colors.black,
          colorEndAnimation: Colors.black,
          fabButtons: [
            FloatingActionButton(
              key: Key("btn3"),
              onPressed: () {},
              heroTag: "btn3",
              child: Icon(Icons.add),
              backgroundColor: Colors.black,
              tooltip: "Add Task",
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddNote()));
              },
              child: FloatingActionButton(
                key: Key("btn1"),
                onPressed: null,
                heroTag: "btn1",
                backgroundColor: Colors.black,
                child: Icon(Icons.note_add),
                tooltip: "Add Quick Note",
              ),
            ),
            FloatingActionButton(
              key: Key("btn2"),
              onPressed: () {
                Get.off(AddNote());
              },
              heroTag: "btn2",
              backgroundColor: Colors.black,
              child: Icon(Icons.playlist_add_check),
              tooltip: "Add Check List",
            )
          ],
          animatedIconData: AnimatedIcons.menu_close,
        ));
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
