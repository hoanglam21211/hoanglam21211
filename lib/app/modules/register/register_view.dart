import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_getx_template/app/common/values/styles/app_text_style.dart';
import 'package:flutter_getx_template/app/modules/login/view/login_view.dart';
import 'package:flutter_getx_template/app/modules/register/controller/register_controller.dart';
import 'package:flutter_getx_template/app/modules/register/widgets/item_dots.dart';
import 'package:flutter_getx_template/app/modules/register/widgets/item_register_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    var heightAppbar = AppBar().preferredSize.height;
    // ignore: unused_element
    bool _keyboardIsVisible() {
      return !(MediaQuery.of(context).viewInsets.bottom == 0.0);
    }

    return GetBuilder<RegisterController>(
      init: RegisterController(),
      builder: (controller) => (GestureDetector(
        onTap: () => {
          FocusScope.of(context).requestFocus(FocusNode()),
        },
        child: Scaffold(
          extendBodyBehindAppBar: true,
          extendBody: true,
          appBar: AppBar(
            centerTitle: true,
            leadingWidth: 72,
            leading: Bounceable(
              onTap: () => Get.off(
                const LoginView(),
                transition: Transition.circularReveal,
                duration: const Duration(milliseconds: 500),
              ),
              child: SizedBox(
                height: 50.sp,
                width: 50.sp,
                child: Icon(
                  Icons.close_outlined,
                  color: Colors.black,
                  size: 20.sp,
                ),
              ),
            ),
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
            height: 1.sh,
            padding: EdgeInsets.only(top: heightAppbar + 40),
            decoration:const  BoxDecoration(
              color: Color(0xff85D7FC),
                image: DecorationImage(
                    image: AssetImage('assets/images/pic.jpg'),
                    fit: BoxFit.cover)
                ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 43),
                  // const ItemTextFieldLabel(label: 'First Name'),
                  Obx(
                    () => ItemRegisterTextField(
                      controller: controller.firstNameController.value,
                      hintText: 'First Name',
                      errorStatus:
                          controller.messageFirstNameError!.value != '',
                    ),
                  ),
                  Obx(() {
                    // ignore: unrelated_type_equality_checks
                    if (controller.messageFirstNameError != '') {
                      return Container(
                          margin: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 40),
                          child: Text(
                              controller.messageFirstNameError.toString(),
                              style: AppTextStyle.textNormalStyle
                                  .copyWith(color: const Color(0xffFD409A))));
                    } else {
                      return SizedBox(height: 20.sp);
                    }
                  }),
                  // const ItemTextFieldLabel(label: 'Last Name'),
                  ItemRegisterTextField(
                    hintText: 'Last Name',
                    errorStatus: controller.messageLastNameError!.value != '',
                    controller: controller.lastNameController.value,
                  ),
                  Obx(() {
                    // ignore: unrelated_type_equality_checks
                    if (controller.messageLastNameError != '') {
                      return Container(
                        margin: EdgeInsets.only(
                            top: 10.sp, bottom: 10.sp, left: 40.sp),
                        child: Text(controller.messageLastNameError.toString(),
                            style: AppTextStyle.textNormalStyle
                                .copyWith(color: const Color(0xffFD409A))),
                      );
                    } else {
                      return SizedBox(height: 20.sp.sp);
                    }
                  }),
                  // const ItemTextFieldLabel(label: 'Address'),
                  ItemRegisterTextField(
                      hintText: 'Address',
                      controller: controller.addressController.value,
                      errorStatus: controller.messageAddressError!.value != '',
                      textInputType: TextInputType.streetAddress),
                  Obx(() {
                    // ignore: unrelated_type_equality_checks
                    if (controller.messageAddressError != '') {
                      return Container(
                        margin: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 40),
                        child: Text(controller.messageAddressError.toString(),
                            style: AppTextStyle.textNormalStyle
                                .copyWith(color: const Color(0xffFD409A))),
                      );
                    } else {
                      return SizedBox(height: 20.sp);
                    }
                  }),
                  // const ItemTextFieldLabel(label: 'Email'),
                  ItemRegisterTextField(
                      hintText: 'Email',
                      controller: controller.emailController.value,
                      errorStatus: controller.messageEmailError!.value != '',
                      textInputType: TextInputType.emailAddress),
                  Obx(() {
                    // ignore: unrelated_type_equality_checks
                    if (controller.messageEmailError != '') {
                      return Container(
                          margin: EdgeInsets.only(
                              top: 10.sp, bottom: 10.sp, left: 40),
                          child: Text(controller.messageEmailError.toString(),
                              style: AppTextStyle.textNormalStyle
                                  .copyWith(color: const Color(0xffFD409A))));
                    } else {
                      return SizedBox(height: 20.sp);
                    }
                  }),
                  // const ItemTextFieldLabel(label: 'Phone Number'),
                  ItemRegisterTextField(
                    hintText: 'Phone Number',
                    errorStatus:
                        controller.messagePhoneNumberError!.value != '',
                    controller: controller.phoneNumberController.value,
                    textInputType: TextInputType.phone,
                    maxLength: 10,
                  ),
                  Obx(() {
                    // ignore: unrelated_type_equality_checks
                    if (controller.messagePhoneNumberError != '') {
                      return Container(
                        margin: EdgeInsets.only(
                            top: 10.sp, bottom: 30.sp, left: 40.sp),
                        child: Text(
                            controller.messagePhoneNumberError.toString(),
                            style: AppTextStyle.textNormalStyle
                                .copyWith(color: const Color(0xffFD409A))),
                      );
                    } else {
                      return SizedBox(height: 20.sp);
                    }
                  }),
                  Container(
                    margin: const EdgeInsets.only(
                      right: 30,
                      left: 40,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          // ignore: use_full_hex_values_for_flutter_colors
                          color: const Color(0x000000).withOpacity(0.1),
                          spreadRadius: 0,
                          blurRadius: 40,
                          offset:
                              const Offset(0, 4), // changes position of shadow
                        ),
                      ],
                    ),
                    child: ItemButtonW700(
                      text: 'Continue',
                      colorText: const Color(0xFFFD409A),
                      onTap: () {
                        controller.submitStage2();
                      },
                    ),
                  ),
                  SizedBox(height: 20.sp),
                  Center(
                    child: Bounceable(
                      onTap: () => Get.to(const LoginView(),
                          transition: Transition.circularReveal,
                          duration: const Duration(milliseconds: 500)),
                      child: Text('I already have an account',
                          style: AppTextStyle.textNormalStyle.copyWith(
                            color: const Color(0xFF796C89),
                          )),
                    ),
                  ),
                  SizedBox(height: 20.sp),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const ItemDots(
                          color: Color(0xFF5C61F4),
                        ),
                        SizedBox(width: 5.sp),
                        const ItemDots(
                          color: Color(0xFFEBF0FF),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
