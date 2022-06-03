import 'package:flutter/material.dart';

import '../../../../common/values/styles/app_text_style.dart';

class ItemDragableIncome extends StatelessWidget {
  final String name;
  const ItemDragableIncome({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Draggable(
      child: Container(
          height: 60,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  // ignore: use_full_hex_values_for_flutter_colors
                  color: const Color(0x000000).withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: 40,
                  offset: const Offset(0, 4), // changes position of shadow
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppTextStyle.textMediumStyle
                      .copyWith(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
          ])),
      feedback: Container(
          height: 60,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  // ignore: use_full_hex_values_for_flutter_colors
                  color: const Color(0x000000).withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: 40,
                  offset: const Offset(0, 4), // changes position of shadow
                ),
              ],
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppTextStyle.textMediumStyle
                      .copyWith(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ])),
      childWhenDragging: Container(
          // width: 50,
          // height: 50,
          // color: Colors.black,
          ),
      data: [2, "Knight"],
    );
  }
}
