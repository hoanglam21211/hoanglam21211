import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/modules/home/widgets/item_wallet/item_drag_target_income.dart';
import 'package:get/get.dart';

import 'bottom_sheet_wallet_controller.dart';

class DragIncomeView extends StatelessWidget {
  const DragIncomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemWalletBottomSheetStartController>(
        builder: (controller) {
      return Column(
        children: [
          Container(
              height: 1.sh - 282,
              width: 1.sw,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    controller.chosenItemIncome.value,
                    Container(
                      height: 1.sh - 200,
                      width: 1.sw / 5 * 2,
                      child: ListView(children: const [
                        ItemDragTargetInCome(
                            name: 'BIDV',
                            image: 'assets/images/techcom_logo.png'),
                        ItemDragTargetInCome(
                            name: 'BIDV',
                            image: 'assets/images/bidv_logo.jpeg'),
                        ItemDragTargetInCome(
                            name: 'BIDV',
                            image: 'assets/images/techcom_logo.png'),
                        ItemDragTargetInCome(
                            name: 'BIDV',
                            image: 'assets/images/TPBank_logo.jpeg'),
                        ItemDragTargetInCome(
                            name: 'BIDV',
                            image: 'assets/images/techcom_logo.png'),
                        ItemDragTargetInCome(
                            name: 'BIDV',
                            image: 'assets/images/techcom_logo.png'),
                      ]),
                    )
                  ])),
          SizedBox(height: 30),
          Bounceable(
            onTap: () {
              controller.isChosenDragIncome = false.obs;
              controller.update();
            },
            child: Text(
              'Back',
              style: AppTextStyle.textLightStyle
                  .copyWith(fontSize: 16, color: Colors.black.withOpacity(0.5)),
            ),
          ),
        ],
      );
    });
  }
}
