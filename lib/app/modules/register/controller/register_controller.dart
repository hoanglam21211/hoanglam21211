// ignore_for_file: unrelated_type_equality_checks
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../register_stage_2_view.dart';

class RegisterController extends GetxController {
  final RegExp phone =
      RegExp(r'^(\+0?1\s)?((\d{3})|(\(\d{3}\)))?(\s|-)\d{3}(\s|-)\d{4}$');
  // final repositoryRegister = RegisterRepository();
  // final repositoryVerify = VerifyRepository();
  Rx<TextEditingController> firstNameController =
      TextEditingController(text: '').obs;
  Rx<TextEditingController> lastNameController =
      TextEditingController(text: '').obs;

  Rx<TextEditingController> addressController =
      TextEditingController(text: '').obs;

  Rx<TextEditingController> emailController =
      TextEditingController(text: '').obs;

  Rx<TextEditingController> phoneNumberController =
      TextEditingController(text: '').obs;
  Rx<TextEditingController> passwordController =
      TextEditingController(text: '').obs;

  Rx<TextEditingController> rePasswordController =
      TextEditingController(text: '').obs;
  Rx<Status> status = Status.init.obs;
  RxString? messageFirstNameError = ''.obs;
  RxString? messageLastNameError = ''.obs;
  RxString? messageAddressError = ''.obs;
  RxString? messageEmailError = ''.obs;
  RxString? messagePhoneNumberError = ''.obs;
  RxString? messagePasswordError = ''.obs;
  RxString? messageRePasswordError = ''.obs;
  RxString? messagePasswordMatchError = ''.obs;
  RxBool isReceivedNews = false.obs;
  void submitStage2() async {
    validateFirstName(firstNameController.value.text);
    validateLastName(lastNameController.value.text);
    validateAddress(addressController.value.text);
    validateEmail(emailController.value.text);
    validatePhone(phoneNumberController.value.text);
    if (messageFirstNameError == '' &&
        messageLastNameError == '' &&
        messageAddressError == '' &&
        messageEmailError == '' &&
        messagePhoneNumberError == '') {
      Get.to(
        const RegisterStage2View(),
        duration: const Duration(milliseconds: 0),
      );
    }
  }

  void onTap() {
    isReceivedNews.value = !isReceivedNews.value;
    update();
  }

  // void getStarted() async {
  //   status = Status.loading.obs;

  //   validatePassword(passwordController.value.text);
  //   validatePassword2(
  //     passwordv: passwordController.value.text,
  //     rePasswordv: rePasswordController.value.text,
  //   );
  //   // validatePasswordMatch(password: passwordEvent, rePassword: rePasswordEvent);
  //   if (messagePasswordError == '' && messageRePasswordError == '') {
  //     status = Status.loading.obs;
  //     try {
  //       final responseData = await repositoryRegister.submitRegister(
  //         password2: rePasswordController.value.text,
  //         password: passwordController.value.text,
  //         // address: address.toString(0),
  //         address: addressController.value.text,
  //         firstName: firstNameController.value.text,
  //         lastName: lastNameController.value.text,
  //         email: emailController.value.text,
  //         phoneNumber: '(123) 456-7890',
  //         isReceivedNews: isReceivedNews.value,
  //       );
  //       if (responseData.statusCode == 201) {
  //         status = Status.success.obs;

  //         Get.to(
  //           const OTPView(),
  //           duration: const Duration(milliseconds: 0),
  //         );
  //       } else {
  //         status = Status.error.obs;
  //         messagePasswordMatchError = 'Server Error'.obs;
  //       }
  //     } catch (e) {
  //       status = Status.error.obs;
  //     }
  //   }
  // }

  // void verifyUser(String? verifyCode) async {
  //   status = Status.loading.obs;
  //   try {
  //     final responseData = await repositoryVerify.submitVerify(
  //         email: emailController.value.text, verifyCode: verifyCode);

  //     if (responseData.statusCode == 202 || responseData.statusCode == 200) {
  //       status = Status.success.obs;
  //       Get.offAll(() => const LoginView(),
  //           transition: Transition.circularReveal,
  //           duration: const Duration(seconds: 1));
  //     } else {
  //       status = Status.error.obs;
  //     }
  //   } catch (e) {
  //     status = Status.error.obs;
  //   }
  // }

  validateFirstName(String? v) {
    if (v == '') {
      messageFirstNameError = 'This field can\'t be empty'.obs;
    } else if (v!.length < 2 || v.length > 15) {
      messageFirstNameError = 'First Name between 2 to 15 characters'.obs;
    } else {
      messageFirstNameError = ''.obs;
    }

    update();
  }

  validateLastName(String? v) {
    if (v == '') {
      messageLastNameError = 'This field can\'t be empty'.obs;
    } else if (v!.length < 2 || v.length > 15) {
      messageLastNameError = 'Last Name between 2 to 15 characters'.obs;
    } else {
      messageLastNameError = ''.obs;
    }

    update();
  }

  validateEmail(String? v) {
    if (v == '') {
      messageEmailError = 'This field can\'t be empty'.obs;
    } else if (!GetUtils.isEmail(v!)) {
      messageEmailError = 'Invalid Email'.obs;
    } else {
      messageEmailError = ''.obs;
    }
    update();
  }

  validateAddress(String? a) {
    if (a == '') {
      messageAddressError = 'This field can\'t be empty'.obs;
    } else if (a!.length < 5 || a.length > 30) {
      messageAddressError = 'Address between 5 to 30 characters'.obs;
    } else {
      messageAddressError = ''.obs;
    }
    update();
  }

  validatePhone(String? v) {
    if (v == '') {
      messagePhoneNumberError = 'This field can\'t be empty'.obs;
    } else if (v!.length != 10) {
      messagePhoneNumberError = 'Invalid Phone Number'.obs;
    } else if (phone.hasMatch(v)) {
      messagePhoneNumberError = 'Invalid Phone Number'.obs;
    } else {
      messagePhoneNumberError = ''.obs;
    }
    update();
  }

  validatePassword(String? v) {
    if (v == '') {
      messagePasswordError = 'This field can\'t be empty'.obs;

      status = Status.error.obs;
    } else if (v!.length < 8 || v.length > 15) {
      messagePasswordError = 'Password between 8 to 15 characters'.obs;

      status = Status.error.obs;
    } else {
      messagePasswordError = ''.obs;
    }

    update();
  }

  validatePassword2({String? passwordv, String? rePasswordv}) {
    if (rePasswordv == '') {
      messageRePasswordError = 'This field can\'t be empty'.obs;

      status = Status.error.obs;
    } else if (rePasswordv!.length < 8 || rePasswordv.length > 15) {
      messageRePasswordError = 'Password between 8 to 15 characters'.obs;

      status = Status.error.obs;
    } else if (passwordv != rePasswordv) {
      messageRePasswordError = 'Passwords not match'.obs;
    } else if (passwordv == rePasswordv) {
      messageRePasswordError = ''.obs;

    }

    update();
  }
}

enum Status {
  init,
  loading,
  success,
  error,
}
