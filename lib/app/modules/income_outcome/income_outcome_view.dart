import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_getx_template/app/common/values/styles/app_text_style.dart';
import 'package:flutter_getx_template/app/modules/income_outcome/bottom_sheet_income_outcome/bottom_sheet_income_outcome.dart';
import 'package:flutter_getx_template/app/modules/income_outcome/income/income_view.dart';
import 'package:flutter_getx_template/app/modules/income_outcome/income_outcome_controller.dart';
import 'package:flutter_getx_template/app/modules/income_outcome/outcome/outcome_view.dart';
import 'package:get/get.dart';

class IncomeOutcomeView extends StatelessWidget {
  const IncomeOutcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFF97C9).withOpacity(0.2),
      body: GetBuilder<InComeOutComeController>(
          init: InComeOutComeController(),
          builder: (controller) {
            return Column(children: [
              SizedBox(height: 60),
              Obx(() {
                return Column(
                  children: [
                    Text('Total Balance',
                        style: AppTextStyle.textNormalStyle
                            .copyWith(fontSize: 20, color: Colors.white)),
                    Text(
                        '\$ ${controller.tabIndex == 0.obs ? '+25.000.000đ' : '-20.000.000đ'}',
                        style: AppTextStyle.textBoldStyle.copyWith(
                            fontSize: 20,
                            color: controller.tabIndex == 0.obs
                                ? Color(0xff009C22)
                                : Color(0xffFD409A))),
                  ],
                );
              }),
              Padding(
                padding: EdgeInsets.only(
                  left: 60,
                  top: 30,
                  bottom: 20,
                ),
                child: Row(
                  children: [
                    Bounceable(
                      onTap: () {
                        controller.tabIndex = 0.obs;
                        controller.update();
                      },
                      child: Obx(() {
                        return Text('In Come',
                            style: AppTextStyle.textBoldStyle.copyWith(
                                fontSize: 20,
                                color: controller.tabIndex == 0.obs
                                    ? Color(0xff5C61F4)
                                    : Colors.white));
                      }),
                    ),
                    SizedBox(width: 50),
                    Bounceable(
                      onTap: () {
                        controller.tabIndex = 1.obs;
                        controller.update();
                      },
                      child: Obx(() {
                        return Text('Out come',
                            style: AppTextStyle.textBoldStyle.copyWith(
                                fontSize: 20,
                                color: controller.tabIndex.value == 1
                                    ? Color(0xff5C61F4)
                                    : Colors.white));
                      }),
                    ),
                    SizedBox(width: 50),
                    Bounceable(
                      onTap: () {
                        WidgetsBinding.instance
                            ?.addPostFrameCallback((_) async {
                          await showModalBottomSheet<dynamic>(
                              context: context,
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              builder: (builder) {
                                return BottomSheetIncomeOutCome();
                              });
                        });
                      },
                      child: CircleAvatar(
                          radius: 16, child: Icon(Icons.add, size: 20)),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10, left: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage('assets/images/bg.jpg'),
                        fit: BoxFit.cover,
                        opacity: 0.2),
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: IndexedStack(
                  index: controller.tabIndex.value,
                  children: const [
                    IncomeView(),
                    OutComeView(),
                    // SettingView(),
                    //   // AlertsPage(),
                    //   // AccountPage(),
                  ],
                ),
              ),
            ]);
          }),
    );
  }
}
