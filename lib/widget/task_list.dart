import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:task_manager/ui/home/task/task_details.dart';
import 'package:task_manager/utils/colors.dart';
import 'package:task_manager/utils/style.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        padding: EdgeInsets.only(bottom: 72),
        itemBuilder: (context, index) {
          if (index % 6 == 0) {
            return headerItem();
          }
          return contentItem(index, index % 2 == 0);
        },
        itemCount: 12,
      ),
    );
  }

  headerItem() {
    return Container(
      padding: EdgeInsets.only(top: 16),
      child: Text(
        "TODAY, AUG 4/2018",
        style: CustomTextStyle.styleMedium
            .copyWith(color: Colors.grey, fontSize: 14),
      ),
    );
  }

  contentItem(index, bool isRejected) {
    return GestureDetector(
      onTap: (){
        Get.to(TaskDetails());
      },
      child: Container(
        margin: EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade100,
                  offset: Offset(0, 100),
                  blurRadius: 1,
                  spreadRadius: 100)
            ]),
        child: Slidable(
          actionExtentRatio: 0.25,
          actionPane: SlidableStrechActionPane(),
          secondaryActions: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
            ),
            IconSlideAction(
              onTap: () {},
              color: isRejected ? CustomColors.colorRed : CustomColors.colorBlue,
              iconWidget: Container(
                  child: Icon(
                Icons.mode_edit,
                color: Colors.white,
              )),
              caption: "Edit",
            ),
            IconSlideAction(
              onTap: () {},
              color: isRejected ? CustomColors.colorRed : CustomColors.colorBlue,
              iconWidget: Container(
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              caption: "Delete",
            ),
          ],
          child: Container(
            padding: EdgeInsets.only(top: 16, bottom: 16, left: 16),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 16),
                  width: 16,
                  height: 16,
                  alignment: Alignment.center,
                  child: isRejected
                      ? Icon(
                          Icons.check_circle,
                          size: 18,
                          color: Colors.red,
                        )
                      : Icon(
                          Icons.radio_button_unchecked,
                          color: Colors.blue,
                          size: 18,
                        ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Go fishing with Stephen",
                        style: CustomTextStyle.styleSemiBold.copyWith(
                            color: isRejected ? Colors.grey : Colors.black,
                            decoration: isRejected
                                ? TextDecoration.lineThrough
                                : TextDecoration.none),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "09:00 AM",
                        style: CustomTextStyle.styleMedium.copyWith(
                            color: Colors.grey,
                            decoration: isRejected
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            fontSize: 12),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 20,
                  width: 4,
                  color:
                      isRejected ? CustomColors.colorRed : CustomColors.colorBlue,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
