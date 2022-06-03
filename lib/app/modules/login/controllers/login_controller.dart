// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/storage/storage.dart';
import 'package:flutter_getx_template/app/modules/home/views/home_view.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // final repository = LoginRepository();
  RxString? messageEmailError = ''.obs;
  RxString? messagePasswordError = ''.obs;
  Rx<Status> status = Rx<Status>(Status.init);
  RxBool isRememberMe = false.obs;
  RxString? emailgx = ''.obs;
  RxString? passwordgx = ''.obs;
  var emailTextController = TextEditingController(text: '').obs;
  var passwordTextController = TextEditingController(text: '').obs;
  @override
  onInit() {
    // String password = Storage.getValue(
    //   'password',
    // );

    // String email = Storage.getValue(
    //   'email',
    // );
    // passwordTextController.value.text = password;
    // emailTextController.value.text = email;
    super.onInit();
  }

  // void submitLogin({required String email, required String password}) async {
  //   status = Rx<Status>(Status.loading);

  //   validateEmail(email);
  //   validatePassword(password);
  //   emailgx = email.obs;
  //   passwordgx = password.obs;
  //   if (messageEmailError == '' && messagePasswordError == '') {
  //     try {
  //       // final responseData = await repository.submitRequestLogin(
  //       //     email: email, password: password);

  //       // ignore: unnecessary_null_comparison
  //       if (responseData.statusCode == 201) {
  //         status = Rx<Status>(Status.success);

  //         if (isRememberMe == true) {
  //           Storage.saveValue('password', password);
  //           Storage.saveValue('email', email);
  //           Storage.saveValue('isRememberMe', true);
  //         } else if (isRememberMe == false) {
  //           Storage.saveValue('isRememberMe', false);
  //           Storage.removeValue('password');
  //           Storage.removeValue('email');
  //         }
  //         await Storage.saveValue('isLogin', true);
  //         await Storage.saveValue('token', responseData.data!.accessToken);
  //         Get.offAll(() => const HomeView(),
  //             transition: Transition.circularReveal,
  //             duration: const Duration(milliseconds: 500));
  //       } else if (responseData.statusCode == 401) {
  //         status = Rx<Status>(Status.error);

  //         messagePasswordError = 'Wrong email or password'.obs;
  //       } else {
  //         status = Rx<Status>(Status.error);

  //         messagePasswordError = 'Invalid Account'.obs;
  //       }
  //       // if (responseData) {
  //       //   status = Rx<Status>(Status.error);
  //       //
  //       //   messagePasswordError = 'Network Error'.obs;
  //       // }
  //     } catch (networkError) {
  //       status = Rx<Status>(Status.error);
  //       messagePasswordError = 'Network Error'.obs;
  //     }
  //     update();
  //   }
  // }

  validateEmail(String? email) {
    if (email == '') {
      messageEmailError = 'This field can\'t be empty'.obs;
      status = Rx<Status>(Status.error);
    } else if (!GetUtils.isEmail(email!)) {
      messageEmailError = 'Invalid Email'.obs;
      status = Rx<Status>(Status.error);
    } else {
      messageEmailError = ''.obs;
    }
    update();
  }

  validatePassword(String? password) {
    if (password == '') {
      messagePasswordError = 'This field can\'t be empty'.obs;
      status = Rx<Status>(Status.error);
    } else if (password!.length < 8 || password.length > 15) {
      messagePasswordError = 'Password must between 8 to 15 characters'.obs;
      status = Rx<Status>(Status.error);
    } else {
      messagePasswordError = ''.obs;
    }
    update();
  }

  isRememberChangeState() {
    isRememberMe.value = !isRememberMe.value;
    update();
  }

  // loginRememberMe() async {
  //   String password = Storage.getValue(
  //     'password',
  //   );
  //   String email = Storage.getValue(
  //     'email',
  //   );
  //   try {
  //     final responseData =
  //         await repository.submitRequestLogin(email: email, password: password);

  //     // ignore: unnecessary_null_comparison
  //     if (responseData.statusCode == 201) {
  //       status = Rx<Status>(Status.success);

  //       Storage.saveValue('password', password);
  //       Storage.saveValue('email', email);
  //       Storage.saveValue('isLogin', true);
  //       Storage.saveValue("token", responseData.data!.accessToken);

  //       Get.offAll(() => const HomeView(),
  //           transition: Transition.circularReveal,
  //           duration: const Duration(milliseconds: 500));
  //     } else {
  //       errorLoginRememberMe();
  //     }
  //   } catch (networkError) {
  //     Get.offAll(() => const HomeView(),
  //         transition: Transition.circularReveal,
  //         duration: const Duration(milliseconds: 500));
  //   }
  //   update();
  // }

  // errorLoginRememberMe() {
  //   Get.offAll(const LoginView(),
  //       transition: Transition.circularReveal,
  //       duration: const Duration(milliseconds: 500));
  // }
}

enum Status {
  init,
  loading,
  success,
  error,
}
