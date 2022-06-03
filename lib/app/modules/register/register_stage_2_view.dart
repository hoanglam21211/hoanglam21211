import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';
import 'package:flutter_getx_template/app/modules/login/view/login_view.dart';
import 'package:flutter_getx_template/app/modules/register/controller/register_controller.dart';
import 'package:flutter_getx_template/app/modules/register/widgets/item_dots.dart';
import 'package:flutter_getx_template/app/modules/register/widgets/item_register_password.dart';
import 'package:get/get.dart';
// import 'package:bizbookly_customer_app/app/modules/authentication/register/widgets/item_register_text_field.dart';

import 'widgets/item_check_box.dart';

class RegisterStage2View extends StatelessWidget {
  const RegisterStage2View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double keyBoardHeight = MediaQuery.of(context).viewInsets.bottom;

    var heightAppbar = AppBar().preferredSize.height;

    return GetBuilder<RegisterController>(
      builder: (controller) => GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          extendBodyBehindAppBar: true,
          extendBody: true,
          appBar: AppBar(
            centerTitle: true,
            leadingWidth: 72,
            leading: Bounceable(
              onTap: () => Get.back(),
              child: const SizedBox(
                height: 50,
                width: 50,
                child: Icon(
                  Icons.close_outlined,
                  color: Colors.black,
                  size: 20,
                ),
              ),
            ),
            // iconTheme: const IconThemeData(
            //   color: Colors.black, //change your color here
            // ),
            // ignore: prefer_const_constructors, use_full_hex_values_for_flutter_colors
            backgroundColor: Color(0xFFFFFF),
            elevation: 0,
            title: Text(
              'Register',
              style: AppTextStyle.textTitleStyle
                  .copyWith(color: Colors.black, fontSize: 18.sp),
            ),
          ),
          body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/pic.jpg'),
                    fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: heightAppbar + 40),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            // const BizBooklyContainer(),
                            const SizedBox(height: 43),
                            ItemPasswordRegisterTextField(
                              hintText: 'Password',
                              errorStatus:
                                  controller.messagePasswordError != ''.obs,
                              controller: controller.passwordController.value,
                            ),
                            Obx(() {
                              // ignore: unrelated_type_equality_checks
                              if (controller.messagePasswordError != ''.obs) {
                                return Container(
                                    margin: const EdgeInsets.only(
                                        top: 10, bottom: 10, left: 40),
                                    child: Text(
                                        controller.messagePasswordError
                                            .toString(),
                                        style: AppTextStyle.textNormalStyle
                                            .copyWith(
                                                color:
                                                    const Color(0xffFD409A))));
                              } else {
                                return const SizedBox(height: 20);
                              }
                            }),
                            ItemPasswordRegisterTextField(
                              hintText: 'Confirm Password',
                              controller: controller.rePasswordController.value,
                              errorStatus:
                                  controller.messageRePasswordError != ''.obs,
                            ),
                            Obx(() {
                              // ignore: unrelated_type_equality_checks
                              if (controller.messageRePasswordError != ''.obs) {
                                return Container(
                                    margin: const EdgeInsets.only(
                                        top: 10, bottom: 10, left: 40),
                                    child: Text(
                                        controller.messageRePasswordError
                                            .toString(),
                                        style: AppTextStyle.textNormalStyle
                                            .copyWith(
                                                color:
                                                    const Color(0xffFD409A))));
                              } else {
                                return const SizedBox(height: 20);
                              }
                            }),
                            // Obx(() {
                            //   return Bounceable(
                            //     onTap: controller.onTap,
                            //     child: ItemCheckBox(
                            //         isReceivedNews:
                            //             controller.isReceivedNews.value),
                            //   );
                            // }),
                            const SizedBox(height: 20),
                            Container(
                              margin:
                                  const EdgeInsets.only(right: 30, left: 30),
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                    // ignore: use_full_hex_values_for_flutter_colors
                                    color:
                                        // ignore: use_full_hex_values_for_flutter_colors
                                        const Color(0x000000).withOpacity(0.1),
                                    spreadRadius: 0,
                                    blurRadius: 40,
                                    offset: const Offset(
                                        0, 4), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Obx(
                                () {
                                  // ignore: unrelated_type_equality_checks
                                  if (controller.status.value ==
                                      Status.loading) {
                                    return ItemButtonW700(
                                      text: 'Next',
                                      isLoading: true,
                                      colorText: const Color(0xFFFD409A),
                                      onTap: () {},
                                    );
                                  } else {
                                    return ItemButtonW700(
                                      text: 'Next',
                                      colorText: const Color(0xFFFD409A),
                                      onTap: () {
                                        // controller.getStarted();
                                      },
                                    );
                                  }
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            Bounceable(
                              onTap: () => Get.back(),
                              child: SizedBox(
                                height: 30,
                                width: 50,
                                child: Text(
                                  'Back',
                                  textAlign: TextAlign.center,
                                  style: AppTextStyle.textNormalStyle.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff85D7FC),
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 36),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  ItemDots(
                                    color: Color(0xFFEBF0FF),
                                  ),
                                  SizedBox(width: 5),
                                  ItemDots(
                                    color: Color(0xFF5C61F4),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Builder(
                  builder: (context) {
                    if (keyBoardHeight == 0) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 30),
                        child: Text(
                          'I already have an account',
                          style: AppTextStyle.textNormalStyle
                              .copyWith(color: const Color(0Xff796C89)),
                        ),
                      );
                    } else
                      // ignore: curly_braces_in_flow_control_structures
                      return Container();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
