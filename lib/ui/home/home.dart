import 'package:flutter/material.dart';
import 'package:task_manager/ui/home/pages/my_task.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget myTask;
  Widget selectedWidget;

  int menuIndex = 0;

  @override
  void initState() {
    super.initState();
    myTask = MyTask();
    selectedWidget = myTask;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
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
                  setState(() {});
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
                  setState(() {});
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
                        setState(() {});
                      })),
              Expanded(
                  child: IconButton(
                      icon: Icon(Icons.person,
                          color: menuIndex == 3 ? Colors.black : Colors.grey),
                      onPressed: () {
                        menuIndex = 3;
                        setState(() {});
                      })),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
      ),
    );
  }
}
