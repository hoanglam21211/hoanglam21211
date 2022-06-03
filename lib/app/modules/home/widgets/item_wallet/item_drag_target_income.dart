import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/modules/home/widgets/item_wallet/bottom_sheet_wallet_controller.dart';
import 'package:flutter_getx_template/app/modules/home/widgets/item_wallet/pop_up_detail_wallet.dart';
import 'package:get/get.dart';

import '../../../../common/values/styles/app_text_style.dart';

class ItemDragTargetInCome extends StatelessWidget {
  final String image;
  final String name;
  const ItemDragTargetInCome({Key? key, required this.image, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemWalletBottomSheetStartController>(
        builder: (controller) {
      return DragTarget(
        builder: (
          BuildContext context,
          List<dynamic> accepted,
          List<dynamic> rejected,
        ) {
          return Container(
              height: 100,
              width: 60,
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  color: Colors.pink.withOpacity(0.2),
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Container(
                      height: 60,
                      width: 100,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                          image: DecorationImage(
                              image: AssetImage(
                                image,
                              ),
                              fit: BoxFit.fill))),
                  SizedBox(height: 10),
                  Text(
                    name,
                    style: AppTextStyle.textMediumStyle
                        .copyWith(fontSize: 16, color: Colors.black),
                  )
                ],
              ));
        },
        onWillAccept: (data) {
          return true;
        },
        onAccept: (data) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  scrollable: true,
                  title: Text('Confirm Income'),
                  // content: Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Form(
                  //     child: Column(
                  //       children: <Widget>[
                  //         TextFormField(
                  //           decoration: InputDecoration(
                  //             labelText: 'Name',
                  //             icon: Icon(Icons.account_box),
                  //           ),
                  //         ),
                  //         TextFormField(
                  //           decoration: InputDecoration(
                  //             labelText: 'Description',
                  //             icon: Icon(Icons.email),
                  //           ),
                  //         ),
                  //         TextFormField(
                  //           decoration: InputDecoration(
                  //             labelText: 'Amount',
                  //             icon: Icon(Icons.message),
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  actions: [
                    RaisedButton(
                        child: Text("Cancle"),
                        onPressed: () {
                          Get.back();
                          // your code
                        }),
                    RaisedButton(
                        child: Text("Submit"),
                        onPressed: () {
                          controller.isChosenDragIncome = false.obs;
                          controller.inComeChosenImage = image.obs;
                          controller.update();
                          Get.back();
                          // your code
                        })
                  ],
                );
              });
        },
      );
    });
  }
}
