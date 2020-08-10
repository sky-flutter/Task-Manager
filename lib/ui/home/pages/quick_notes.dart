import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_manager/utils/style.dart';

class QuickNotes extends StatefulWidget {
  @override
  _QuickNotesState createState() => _QuickNotesState();
}

class _QuickNotesState extends State<QuickNotes> {
  Random random = new Random(255);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(.10),
      appBar: AppBar(
        elevation: 2,
        centerTitle: true,
        title: Text(
          "Quick Notes",
          style: CustomTextStyle.styleSemiBold.copyWith(fontSize: 18),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: ListView.builder(
          padding: EdgeInsets.only(bottom: 16),
          itemBuilder: (context, index) {
            return notesItem(index);
          },
          itemCount: 6,
        ),
      ),
    );
  }

  Widget notesItem(int index) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, top: 16),
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(.01), offset: Offset(0, 100))],
          color: Colors.white,
          borderRadius: BorderRadius.circular(8)),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 16),
            height: 3,
            decoration: BoxDecoration(
                color: Color.fromRGBO(random.nextInt(255), random.nextInt(255),
                    random.nextInt(255), 1),
                borderRadius: BorderRadius.circular(4)),
            width: MediaQuery.of(context).size.width / 2.5,
          ),
          Column(
            children: [
              Visibility(
                visible: index % 2 == 0,
                child: Container(
                  padding:
                      EdgeInsets.only(top: 24, bottom: 24, left: 16, right: 16),
                  child: Text(
                    "Meeting with Jessica in Central Park at 10.30 AM",
                    style: CustomTextStyle.styleMedium.copyWith(fontSize: 16),
                  ),
                ),
              ),
              Visibility(
                  visible: index % 2 == 1,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 16, top: 24),
                          child: Text(
                            "Home work today",
                            style: CustomTextStyle.styleMedium,
                          ),
                        ),
                        ListView.builder(
                          padding: EdgeInsets.only(left: 6),
                          primary: false,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return noteSubItem();
                          },
                          itemCount: 3,
                        )
                      ],
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }

  noteSubItem() {
    return Container(
      child: Row(
        children: [
          Checkbox(
            value: false,
            onChanged: (checked) {},
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          Text("Buy a milk")
        ],
      ),
    );
  }
}
