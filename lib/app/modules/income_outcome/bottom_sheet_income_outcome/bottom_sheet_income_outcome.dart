import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_getx_template/app/common/values/styles/app_text_style.dart';
import 'package:flutter_getx_template/app/modules/home/widgets/item_wallet/bottom_sheet_wallet_controller.dart';
import 'package:flutter_getx_template/app/modules/income_outcome/income_outcome_controller.dart';
import 'package:flutter_getx_template/app/modules/login/view/login_view.dart';
import 'package:flutter_getx_template/app/modules/register/widgets/item_register_password.dart';
import 'package:flutter_getx_template/app/modules/register/widgets/item_register_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BottomSheetIncomeOutCome extends GetMaterialApp {
  const BottomSheetIncomeOutCome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      child: SafeArea(
        child: Container(
            padding: EdgeInsets.only(
              top: 10.sp,
              left: 24.sp,
              right: 10.sp,
              bottom: 24.sp,
            ),
            height: 1.sh - 50,
            width: 1.sw,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: Stack(
              children: [
                Positioned(
                    right: 0.sp,
                    top: 20.sp,
                    child: Bounceable(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(Icons.close))),
                GetBuilder<InComeOutComeController>(builder: (controller) {
                  return Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(children: [
                          SizedBox(height: 60.sp),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AutoSizeText(
                                'Please fill your ${controller.tabIndex == 0.obs ? 'in come\'s' : 'out come\'s'} information',
                                style: AppTextStyle.textBoldStyle.copyWith(
                                    color: const Color(0xffFD409A),
                                    fontSize: 18),
                                minFontSize: 6,
                              ),
                              SizedBox(width: 20),
                            ],
                          ),
                          SizedBox(height: 20.sp),
                        ]),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, bottom: 15, top: 15),
                                child: Text(
                                  controller.tabIndex == 0.obs
                                      ? 'Come from'
                                      : 'Pay for',
                                  style: AppTextStyle.textNormalStyle.copyWith(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ),
                              ItemRegisterTextField(
                                hintText: controller.tabIndex == 0.obs
                                    ? 'Come from'
                                    : 'Pay for',
                                errorStatus: false,
                                textInputType: TextInputType.number,
                                controller: TextEditingController(text: ''),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, bottom: 15, top: 15),
                                child: Text(
                                  'Description',
                                  style: AppTextStyle.textNormalStyle.copyWith(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ),
                              ItemRegisterTextField(
                                hintText: 'Description',
                                errorStatus: false,
                                textInputType: TextInputType.number,
                                controller: TextEditingController(text: ''),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, bottom: 15, top: 15),
                                child: Text(
                                  'Amount',
                                  style: AppTextStyle.textNormalStyle.copyWith(
                                      fontSize: 16, color: Colors.black),
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
                                    margin: EdgeInsets.only(
                                        right: 16.sp, left: 16.sp),
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                          // ignore: use_full_hex_values_for_flutter_colors
                                          color: const Color(0x000000)
                                              .withOpacity(0.1),
                                          spreadRadius: 0,
                                          blurRadius: 40,
                                          offset: const Offset(0,
                                              4), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: ItemButtonW700(
                                        text: "Submit",
                                        colorText: const Color(0xffFD409A),
                                        onTap: () {
                                          Get.back();
                                        }),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, bottom: 15, top: 15),
                                    child: Bounceable(
                                      onTap: () {},
                                      child: Text(
                                        'Back',
                                        style: AppTextStyle.textLightStyle
                                            .copyWith(
                                                fontSize: 16,
                                                color: Colors.black
                                                    .withOpacity(0.5)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30.sp),
                            ]),
                      ]);
                }),
              ],
            )),
      ),
    );
  }
}

class ItemWallet extends StatelessWidget {
  final String image;
  final String type;
  final String name;
  const ItemWallet(
      {Key? key, required this.image, required this.type, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(right: 10, left: 20, bottom: 40),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            children: [
              Text(
                name,
                style: AppTextStyle.textBoldStyle
                    .copyWith(fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: 20),
              Text(
                type,
                style: AppTextStyle.textNormalStyle
                    .copyWith(fontSize: 14, color: Colors.black),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    boxShadow: [
                      BoxShadow(
                        // ignore: use_full_hex_values_for_flutter_colors
                        color: const Color(0x000000).withOpacity(0.05),
                        spreadRadius: 0,
                        blurRadius: 40,
                        offset:
                            const Offset(0, 4), // changes position of shadow
                      ),
                    ], //
                  ),
                  child: Image.asset(image)),
              SizedBox(width: 20),
              Bounceable(
                onTap: () {},
                child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 15,
                    child: Icon(Icons.add, size: 15)),
              )
            ],
          ),
        ]));
  }
}
