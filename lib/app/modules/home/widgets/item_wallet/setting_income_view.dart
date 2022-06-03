import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_getx_template/app/modules/home/widgets/item_wallet/bottom_sheet_wallet_controller.dart';
import 'package:flutter_getx_template/app/modules/login/view/login_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../common/values/styles/app_text_style.dart';
import '../../../register/widgets/item_register_text_field.dart';

class SettingIncomeView extends StatelessWidget {
  const SettingIncomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemWalletBottomSheetStartController>(
        builder: (controller) {
      return Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
              SizedBox(height: 60.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    'Please fill your in come\'s information',
                    style: AppTextStyle.textBoldStyle
                        .copyWith(color: const Color(0xffFD409A), fontSize: 18),
                    minFontSize: 6,
                  ),
                  SizedBox(width: 20),
                ],
              ),
              SizedBox(height: 20.sp),
            ]),
            Stack(
              children: [
                Positioned(
                  right: 20,
                  child: Bounceable(
                    onTap: () {
                      controller.isChosenDragIncome = true.obs;
                      controller.update();
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          image: controller.inComeChosenImage != ''
                              ? DecorationImage(
                                  image: AssetImage(
                                      controller.inComeChosenImage.value))
                              : null,
                          color: Color(0xffBDBDBD),
                          borderRadius: BorderRadius.all(Radius.circular(16))),
                    ),
                  ),
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  SizedBox(height: 60),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, bottom: 15, top: 15),
                    child: Text(
                      'Name',
                      style: AppTextStyle.textNormalStyle
                          .copyWith(fontSize: 16, color: Colors.black),
                    ),
                  ),
                  ItemRegisterTextField(
                    hintText: 'Name',
                    errorStatus: false,
                    textInputType: TextInputType.number,
                    controller: TextEditingController(text: ''),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, bottom: 15, top: 15),
                    child: Text(
                      'Description',
                      style: AppTextStyle.textNormalStyle
                          .copyWith(fontSize: 16, color: Colors.black),
                    ),
                  ),
                  ItemRegisterTextField(
                    hintText: 'Description',
                    errorStatus: false,
                    textInputType: TextInputType.number,
                    controller: TextEditingController(text: ''),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, bottom: 15, top: 15),
                    child: Text(
                      'Amount',
                      style: AppTextStyle.textNormalStyle
                          .copyWith(fontSize: 16, color: Colors.black),
                    ),
                  ),
                  ItemRegisterTextField(
                    hintText: 'Amount',
                    errorStatus: false,
                    textInputType: TextInputType.number,
                    controller: TextEditingController(text: ''),
                  ),
                  SizedBox(height: 20.sp),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 16.sp, left: 16.sp),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              // ignore: use_full_hex_values_for_flutter_colors
                              color: const Color(0x000000).withOpacity(0.1),
                              spreadRadius: 0,
                              blurRadius: 40,
                              offset: const Offset(
                                  0, 4), // changes position of shadow
                            ),
                          ],
                        ),
                        child: ItemButtonW700(
                            text: "Submit",
                            colorText: const Color(0xffFD409A),
                            onTap: () {
                              controller.isDetailIncome = false.obs;
                              controller.update();
                            }),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.sp),
                  Center(
                    child: Bounceable(
                      onTap: () {
                        controller.isDetailIncome = false.obs;
                        controller.update();
                      },
                      child: Text(
                        'Back',
                        style: AppTextStyle.textLightStyle.copyWith(
                            fontSize: 32, color: Colors.black.withOpacity(0.5)),
                      ),
                    ),
                  ),
                ]),
              ],
            ),
          ]);
    });
  }
}
