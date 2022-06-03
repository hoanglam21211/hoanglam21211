import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_getx_template/app/common/values/styles/app_text_style.dart';
import 'package:flutter_getx_template/app/modules/home/widgets/item_wallet/add_income_view.dart';
import 'package:flutter_getx_template/app/modules/home/widgets/item_wallet/add_outcome_view.dart';
import 'package:flutter_getx_template/app/modules/home/widgets/item_wallet/add_wallet_view.dart';
import 'package:flutter_getx_template/app/modules/home/widgets/item_wallet/bottom_sheet_wallet_controller.dart';
import 'package:flutter_getx_template/app/modules/home/widgets/item_wallet/drag_outcome_view.dart';
import 'package:flutter_getx_template/app/modules/home/widgets/item_wallet/drage_income_view.dart';
import 'package:flutter_getx_template/app/modules/home/widgets/item_wallet/item_dragable_income.dart';
import 'package:flutter_getx_template/app/modules/home/widgets/item_wallet/item_dragable_outcome.dart';
import 'package:flutter_getx_template/app/modules/home/widgets/item_wallet/pop_up_detail_wallet.dart';
import 'package:flutter_getx_template/app/modules/home/widgets/item_wallet/setting_income_view.dart';
import 'package:flutter_getx_template/app/modules/home/widgets/item_wallet/setting_outcome_view.dart';
import 'package:flutter_getx_template/app/modules/income_outcome/income/income_view.dart';
import 'package:flutter_getx_template/app/modules/income_outcome/outcome/outcome_view.dart';
import 'package:flutter_getx_template/app/modules/login/view/login_view.dart';
import 'package:flutter_getx_template/app/modules/register/widgets/item_register_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ItemWalletBottomSheetStart extends GetMaterialApp {
  const ItemWalletBottomSheetStart({Key? key}) : super(key: key);

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
                GetBuilder<ItemWalletBottomSheetStartController>(
                    init: ItemWalletBottomSheetStartController(),
                    builder: (controller) {
                      if (controller.isAddWallet.value) {
                        return AddWalletView();
                      } else if (controller.isAddInCome.value) {
                        return AddInComeView();
                      } else if (controller.isAddOutCome.value) {
                        return AddOutComeView();
                      } else {
                        return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 20.sp),
                              Column(children: [
                                Row(children: [
                                  SizedBox(width: 10),
                                  Obx(() {
                                    return CircleAvatar(
                                        backgroundColor:
                                            controller.formStateIndex == 1.obs
                                                ? Colors.pink
                                                : Colors.pink.withOpacity(0.2),
                                        radius: 15,
                                        child: Center(
                                            child: Text(
                                          '1',
                                          style: AppTextStyle.textNormalStyle
                                              .copyWith(
                                                  fontSize: 16,
                                                  color: Colors.white),
                                        )));
                                  }),
                                  SizedBox(width: 10),
                                  Obx(() {
                                    return CircleAvatar(
                                        backgroundColor:
                                            controller.formStateIndex == 2.obs
                                                ? Colors.pink
                                                : Colors.pink.withOpacity(0.2),
                                        radius: 15,
                                        child: Center(
                                            child: Text(
                                          '2',
                                          style: AppTextStyle.textNormalStyle
                                              .copyWith(
                                                  fontSize: 16,
                                                  color: Colors.white),
                                        )));
                                  }),
                                  SizedBox(width: 10),
                                  CircleAvatar(
                                      backgroundColor:
                                          controller.formStateIndex == 3.obs
                                              ? Colors.pink
                                              : Colors.pink.withOpacity(0.2),
                                      radius: 15,
                                      child: Center(
                                          child: Text(
                                        '3',
                                        style: AppTextStyle.textNormalStyle
                                            .copyWith(
                                                fontSize: 16,
                                                color: Colors.white),
                                      )))
                                ]),
                                SizedBox(height: 20.sp),
                              ]),
                              Column(
                                children: [
                                  Obx(() {
                                    if (controller.formStateIndex == 2.obs) {
                                      if (controller.isDetailIncome ==
                                          false.obs) {
                                        return Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                AutoSizeText(
                                                  'Please setting your In Come',
                                                  style: AppTextStyle
                                                      .textBoldStyle
                                                      .copyWith(
                                                          color: const Color(
                                                              0xffFD409A),
                                                          fontSize: 24),
                                                  minFontSize: 6,
                                                ),
                                                SizedBox(width: 20),
                                                Bounceable(
                                                  onTap: () {
                                                    controller
                                                            .isAddInCome.value =
                                                        !controller
                                                            .isAddInCome.value;
                                                    controller.update();
                                                  },
                                                  child: CircleAvatar(
                                                      radius: 20,
                                                      child: Icon(Icons.add,
                                                          size: 30)),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 20.sp),
                                            Container(
                                              height: 1.sh - 330,
                                              width: 1.sw,
                                              child: ListView(children: [
                                                // ItemDragable(),
                                                ItemIncome(
                                                    onTap: () {
                                                      controller
                                                              .isDetailIncome =
                                                          true.obs;
                                                      controller
                                                              .chosenItemIncome =
                                                          ItemDragableIncome(
                                                                  name:
                                                                      'Lương tháng')
                                                              .obs;
                                                      controller.update();
                                                    },
                                                    amount: ' 200.000đ',
                                                    from: 'VCB',
                                                    name: 'Lương tháng',
                                                    description: 'lương '),

                                                ItemIncome(
                                                    onTap: () {
                                                      controller
                                                              .isDetailIncome =
                                                          true.obs;
                                                      controller
                                                              .chosenItemIncome =
                                                          ItemDragableIncome(
                                                                  name:
                                                                      'Me cho')
                                                              .obs;
                                                      controller.update();
                                                    },
                                                    amount: ' 200.000đ',
                                                    from: 'VCB',
                                                    name: 'Me cho',
                                                    description: 'lương '),
                                                ItemIncome(
                                                    onTap: () {
                                                      controller
                                                              .isDetailIncome =
                                                          true.obs;
                                                      controller
                                                              .chosenItemIncome =
                                                          ItemDragableIncome(
                                                                  name: 'Li xi')
                                                              .obs;
                                                      controller.update();
                                                    },
                                                    amount: ' 200.000đ',
                                                    from: 'VCB',
                                                    name: 'Li xi',
                                                    description: 'lương '),
                                                ItemIncome(
                                                    onTap: () {
                                                      controller
                                                              .isDetailIncome =
                                                          true.obs;
                                                      controller
                                                              .chosenItemIncome =
                                                          ItemDragableIncome(
                                                                  name:
                                                                      'Tien thuong')
                                                              .obs;
                                                      controller.update();
                                                    },
                                                    amount: ' 200.000đ',
                                                    from: 'VCB',
                                                    name: 'Tien thuong',
                                                    description: 'lương '),
                                                // ItemDragTarget(name: 'Lương tháng',
                                                //     image:
                                                // 'assets/images/techcom_logo.png')
                                              ]),
                                            ),
                                            GetBuilder<
                                                    ItemWalletBottomSheetStartController>(
                                                builder: (controller) {
                                              return Column(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        right: 16.sp,
                                                        left: 16.sp,
                                                        top: 20.sp,
                                                        bottom: 30.sp),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  10)),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          // ignore: use_full_hex_values_for_flutter_colors
                                                          color: const Color(
                                                                  0x000000)
                                                              .withOpacity(0.1),
                                                          spreadRadius: 0,
                                                          blurRadius: 40,
                                                          offset: const Offset(
                                                              0,
                                                              4), // changes position of shadow
                                                        ),
                                                      ],
                                                    ),
                                                    child: ItemButtonW700(
                                                        text: "Next",
                                                        colorText: const Color(
                                                            0xffFD409A),
                                                        onTap: () {
                                                          if (controller
                                                                  .formStateIndex
                                                                  .value !=
                                                              3) {
                                                            controller
                                                                .formStateIndex
                                                                .value = controller
                                                                    .formStateIndex
                                                                    .value +
                                                                1;
                                                            controller.update();
                                                          }
                                                        }),
                                                  ),
                                                  Bounceable(
                                                    onTap: () {
                                                      if (controller
                                                              .formStateIndex
                                                              .value !=
                                                          1) {
                                                        controller
                                                            .formStateIndex
                                                            .value = controller
                                                                .formStateIndex
                                                                .value -
                                                            1;
                                                        controller.update();
                                                      }
                                                    },
                                                    child: Text(
                                                      'Back',
                                                      style: AppTextStyle
                                                          .textLightStyle
                                                          .copyWith(
                                                              fontSize: 16,
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.5)),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            }),
                                          ],
                                        );
                                      } else {
                                        if (controller.isChosenDragIncome ==
                                            false.obs) {
                                          return SettingIncomeView();
                                        } else {
                                          return DragIncomeView();
                                        }
                                      }
                                    } else if (controller.formStateIndex ==
                                        1.obs) {
                                      return Column(children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            AutoSizeText(
                                              'Please setting your Wallet',
                                              style: AppTextStyle.textBoldStyle
                                                  .copyWith(
                                                      color: const Color(
                                                          0xffFD409A),
                                                      fontSize: 24),
                                              minFontSize: 6,
                                            ),
                                            SizedBox(width: 20),
                                            Bounceable(
                                              onTap: () {
                                                controller.isAddOutCome.value =
                                                    !controller
                                                        .isAddOutCome.value;
                                                controller.update();
                                              },
                                              child: CircleAvatar(
                                                  radius: 20,
                                                  child: Icon(Icons.add,
                                                      size: 30)),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 20.sp),
                                        Container(
                                          height: 1.sh - 330,
                                          width: 1.sw,
                                          child: ListView(children: [
                                            ItemWallet(
                                                onTap: () {
                                                  functionDetailWalletPopUp(
                                                      context);
                                                },
                                                name: "Wallet",
                                                type: "sfad",
                                                image:
                                                    'assets/images/techcom_logo.png'),
                                            ItemWallet(
                                                onTap: () {
                                                  functionDetailWalletPopUp(
                                                      context);
                                                },
                                                name: "Wallet",
                                                type: "sfad",
                                                image:
                                                    'assets/images/bidv_logo.jpeg'),
                                            ItemWallet(
                                                onTap: () {
                                                  functionDetailWalletPopUp(
                                                      context);
                                                },
                                                name: "Wallet",
                                                type: "sfad",
                                                image:
                                                    'assets/images/TPBank_logo.jpeg'),
                                            ItemWallet(
                                                onTap: () {
                                                  functionDetailWalletPopUp(
                                                      context);
                                                },
                                                name: "Wallet",
                                                type: "sfad",
                                                image:
                                                    'assets/images/wallet.jpeg'),
                                            ItemWallet(
                                                onTap: () {
                                                  functionDetailWalletPopUp(
                                                      context);
                                                },
                                                name: "Wallet",
                                                type: "sfad",
                                                image:
                                                    'assets/images/wallet.jpeg'),
                                          ]),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              right: 16.sp,
                                              left: 16.sp,
                                              top: 20.sp,
                                              bottom: 30.sp),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
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
                                              text: "Next",
                                              colorText:
                                                  const Color(0xffFD409A),
                                              onTap: () {
                                                if (controller
                                                        .formStateIndex.value !=
                                                    3) {
                                                  controller.formStateIndex
                                                      .value = controller
                                                          .formStateIndex
                                                          .value +
                                                      1;
                                                  controller.update();
                                                }
                                              }),
                                        ),
                                      ]);
                                    } else if (controller.formStateIndex ==
                                        3.obs) {
                                      if (controller.isDetailOutcome ==
                                          false.obs) {
                                        return Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                AutoSizeText(
                                                  'Please setting your Out Come',
                                                  style: AppTextStyle
                                                      .textBoldStyle
                                                      .copyWith(
                                                          color: const Color(
                                                              0xffFD409A),
                                                          fontSize: 24),
                                                  minFontSize: 6,
                                                ),
                                                SizedBox(width: 20),
                                                Bounceable(
                                                  onTap: () {
                                                    controller
                                                            .isAddOutCome.value =
                                                        !controller
                                                            .isAddOutCome.value;
                                                    controller.update();
                                                  },
                                                  child: CircleAvatar(
                                                      radius: 20,
                                                      child: Icon(Icons.add,
                                                          size: 30)),
                                                )
                                              ],
                                            ),
                                            SizedBox(height: 20.sp),
                                            Container(
                                              height: 1.sh - 330,
                                              width: 1.sw,
                                              child: ListView(children: [
                                                // ItemDragable(),
                                                ItemOutCome(
                                                    onTap: () {
                                                      controller
                                                              .isDetailOutcome =
                                                          true.obs;
                                                      controller
                                                              .chosenItemOutcome =
                                                          ItemDragableOutcome(
                                                                  name:
                                                                      'Tra tien nha tháng')
                                                              .obs;
                                                      controller.update();
                                                    },
                                                    amount: ' 200.000đ',
                                                    from: 'VCB',
                                                    name: 'Lương tháng',
                                                    description: 'lương '),

                                                ItemOutCome(
                                                    onTap: () {
                                                      controller
                                                              .isDetailOutcome =
                                                          true.obs;
                                                      controller
                                                              .chosenItemOutcome =
                                                          ItemDragableOutcome(
                                                                  name:
                                                                      'Me cho')
                                                              .obs;
                                                      controller.update();
                                                    },
                                                    amount: ' 200.000đ',
                                                    from: 'VCB',
                                                    name: 'Me cho',
                                                    description: 'lương '),
                                                ItemOutCome(
                                                    onTap: () {
                                                      controller
                                                              .isDetailOutcome =
                                                          true.obs;
                                                      controller
                                                              .chosenItemOutcome =
                                                          ItemDragableOutcome(
                                                                  name: 'Li xi')
                                                              .obs;
                                                      controller.update();
                                                    },
                                                    amount: ' 200.000đ',
                                                    from: 'VCB',
                                                    name: 'Li xi',
                                                    description: 'lương '),
                                                ItemOutCome(
                                                    onTap: () {
                                                      controller
                                                              .isDetailOutcome =
                                                          true.obs;
                                                      controller
                                                              .chosenItemOutcome =
                                                          ItemDragableOutcome(
                                                                  name:
                                                                      'Tien thuong')
                                                              .obs;
                                                      controller.update();
                                                    },
                                                    amount: ' 200.000đ',
                                                    from: 'VCB',
                                                    name: 'Tien thuong',
                                                    description: 'lương '),
                                                // ItemDragTarget(name: 'Lương tháng',
                                                //     image:
                                                // 'assets/images/techcom_logo.png')
                                              ]),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  right: 16.sp,
                                                  left: 16.sp,
                                                  top: 20.sp,
                                                  bottom: 30.sp),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
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
                                                  text: "To Home Page",
                                                  colorText:
                                                      const Color(0xffFD409A),
                                                  onTap: () {
                                                    Get.back();
                                                  }),
                                            ),
                                            Bounceable(
                                              onTap: () {
                                                if (controller
                                                        .formStateIndex.value !=
                                                    1) {
                                                  controller.formStateIndex
                                                      .value = controller
                                                          .formStateIndex
                                                          .value -
                                                      1;
                                                  controller.update();
                                                }
                                              },
                                              child: Text(
                                                'Back',
                                                style: AppTextStyle
                                                    .textLightStyle
                                                    .copyWith(
                                                        fontSize: 16,
                                                        color: Colors.black
                                                            .withOpacity(0.5)),
                                              ),
                                            ),
                                          ],
                                        );
                                      } else {
                                        if (controller.isChosenDragOutcome ==
                                            false.obs) {
                                          return SettingOutComeView();
                                        } else {
                                          return DragOutcomeView();
                                        }
                                      }
                                    } else {
                                      return Container();
                                    }
                                  }),
                                ],
                              ),
                            ]);
                      }
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
  final Function() onTap;
  final String name;
  const ItemWallet(
      {Key? key,
      required this.image,
      required this.type,
      required this.name,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: onTap,
      child: Container(
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
          ])),
    );
  }
}
