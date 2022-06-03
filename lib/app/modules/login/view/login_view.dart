import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_getx_template/app/common/values/app_colors.dart';
import 'package:flutter_getx_template/app/common/values/styles/app_text_style.dart';
import 'package:flutter_getx_template/app/modules/home/views/home_view.dart';
import 'package:flutter_getx_template/app/modules/login/controllers/login_controller.dart';
import 'package:flutter_getx_template/app/modules/login/view/widgets/item_icon_button.dart';
import 'package:flutter_getx_template/app/modules/login/view/widgets/item_remember_me.dart';
import 'package:flutter_getx_template/app/modules/login/view/widgets/item_separator.dart';
import 'package:flutter_getx_template/app/modules/login/view/widgets/item_text_email_field.dart';
import 'package:flutter_getx_template/app/modules/login/view/widgets/item_text_password_field.dart';
import 'package:flutter_getx_template/app/modules/register/register_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    var showKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;

    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) {
          return GestureDetector(
            onTap: () => {
              FocusScope.of(context).requestFocus(FocusNode()),
            },
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              extendBody: true,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 1.sh,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              'assets/images/pig.jpg',
                            ),
                            fit: BoxFit.cover,
                            opacity: 0.7),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 200),
                          Center(
                            child: AutoSizeText(
                              'FINANCIAL',
                              minFontSize: 100,
                              style: AppTextStyle.logoFont,
                            ),
                          ),
                          // ignore: unrelated_type_equality_checks

                          Container(
                            margin: EdgeInsets.only(top: (0.065).sh),
                            child: ItemTextEmailField(
                              hintText: 'Email',
                              onChanged: (a) {
                                controller.messageEmailError = ''.obs;
                                controller.messagePasswordError = ''.obs;
                                controller.update();
                              },
                              controller: controller.emailTextController.value,
                              onTap: () {},
                            ),
                          ),
                          Obx(() {
                            // ignore: unrelated_type_equality_checks
                            if (controller.messageEmailError != '') {
                              return Container(
                                  margin: const EdgeInsets.only(
                                      top: 10, bottom: 10, left: 40),
                                  child: Text(
                                      controller.messageEmailError.toString(),
                                      style: AppTextStyle.textNormalStyle
                                          .copyWith(
                                              color: const Color(0xffFD409A))));
                            } else {
                              return const SizedBox(height: 20);
                            }
                          }),

                          ItemTextPassword(
                            onTap: () {},
                            onChanged: (a) {
                              controller.messageEmailError = ''.obs;
                              controller.messagePasswordError = ''.obs;
                              controller.update();
                            },
                            controller: controller.passwordTextController.value,
                            hintText: 'Password',
                            isSuffixIcon: true,
                          ),
                          Obx(() {
                            // ignore: unrelated_type_equality_checks
                            if (controller.messagePasswordError != '') {
                              return Container(
                                  margin: const EdgeInsets.only(
                                      top: 10, bottom: 10, left: 40),
                                  child: Text(
                                    controller.messagePasswordError.toString(),
                                    // style: AppTextStyle.textNormalStyle
                                    //     .copyWith(
                                    //         color: const Color(0xffFD409A))
                                  ));
                            } else {
                              return const SizedBox(height: 20);
                            }
                          }),
                          Bounceable(
                            onTap: () => controller.isRememberChangeState(),
                            child: ItemCheckBoxRememberMe(
                                isActive: controller.isRememberMe.value),
                          ),
                          const SizedBox(height: 20),
                          //Button Login
                          Container(
                            margin: const EdgeInsets.only(
                              left: 30,
                              right: 30,
                            ),
                            child: ItemButtonW700(
                              isLoading: controller.status ==
                                  Rx<Status>(Status.loading),
                              colorText: Colors.white,
                              colorButton: Color(0xffFF97C9).withOpacity(1),
                              text: "Log In",
                              onTap: () {
                                Get.offAll(
                                  const HomeView(),
                                  transition: Transition.circularReveal,
                                  duration: const Duration(milliseconds: 500),
                                );
                                // controller.submitLogin(
                                //     email: controller
                                //         .emailTextController.value.text,
                                //     password: controller
                                //         .passwordTextController.value.text);
                              },
                            ),
                          ),

                          Column(
                            children: [
                              // Bounceable(
                              //   onTap: () {
                              //     // Get.to(const RetrievePassworView());
                              //   },
                              //   child: Container(
                              //     margin: const EdgeInsets.only(top: 18),
                              //     child: Text(
                              //       'Forgot password?',
                              //       style: AppTextStyle.textNormalStyle
                              //           .copyWith(color: Color(0xffFF97C9)),
                              //     ),
                              //   ),
                              // ),
                              // //Divider Dot
                              // Container(
                              //   margin: const EdgeInsets.only(
                              //       top: 18, left: 63, right: 63),
                              //   child: const Separator(
                              //       color: Colors.white, height: 1),
                              // ),
                              // Container(
                              //   margin:
                              //       const EdgeInsets.only(top: 18, bottom: 18),
                              //   child: Text(
                              //     'Continue with',
                              //     style: AppTextStyle.textNormalStyle
                              //         .copyWith(color: Color(0xffFF97C9)),
                              //   ),
                              // ),
                              // ItemIconButton(
                              //   text: 'FACEBOOK',
                              //   onTap: () {},
                              //   image: 'Facebook.png',
                              // ),
                              // const SizedBox(height: 12),
                              // ItemIconButton(
                              //   text: 'GOOGLE',
                              //   onTap: () {},
                              //   image: 'Google.png',
                              // ),
                              // const SizedBox(height: 12),

                              // ItemIconButton(
                              //   text: 'APPLE',
                              //   onTap: () {},
                              //   image: 'Apple.png',
                              // ),
                            ],
                          )
                        ],
                      ),
                    ),
                    showKeyboard
                        ? Container()
                        : Positioned(
                            bottom: 0,
                            child: Bounceable(
                              onTap: () => Get.off(
                                const RegisterView(),
                                transition: Transition.circularReveal,
                                duration: const Duration(milliseconds: 500),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    'Register',
                                    style: AppTextStyle.textBoldStyle
                                        .copyWith(fontSize: 18),
                                  ),
                                  // const SizedBox(height: 10),
                                  // Text(Strings.version,
                                  // style: AppTextStyle.textNormalStyle),
                                  const SizedBox(height: 24),
                                ],
                              ),
                            ),
                          ),
                    Positioned(
                      top: 30,
                      left: 10,
                      child: Bounceable(
                        onTap: () => Get.offAll(
                          const HomeView(),
                          transition: Transition.circularReveal,
                          duration: const Duration(milliseconds: 500),
                        ),
                        child: const SizedBox(
                          height: 50,
                          width: 50,
                          child: Icon(
                            Icons.close_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

// ignore: must_be_immutable
class ItemButtonW700 extends StatelessWidget {
  final String text;
  final Color colorButton;
  final Color colorText;
  final Function() onTap;
  final bool isLoading;
  const ItemButtonW700(
      {Key? key,
      this.isLoading = false,
      required this.text,
      required this.onTap,
      this.colorButton = Colors.white,
      this.colorText = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: isLoading ? () {} : onTap,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          color: colorButton,
        ),
        child: Center(
          child: isLoading
              ? const SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                      strokeWidth: 3, color: Color(0xffFD409A)))
              : Text(
                  text,
                  style: AppTextStyle.textBoldStyle.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      color: colorText),
                ),
        ),
      ),
    );
  }
}
