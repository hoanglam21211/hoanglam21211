import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_getx_template/app/common/values/app_images.dart';
import 'package:flutter_getx_template/app/common/values/styles/app_text_style.dart';
import 'package:flutter_getx_template/app/modules/home/views/home_view.dart';
import 'package:flutter_getx_template/app/modules/login/view/login_view.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../common/util/exports.dart';

class FlashView extends StatelessWidget {
  const FlashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime preBackpress = DateTime.now();

    return Scaffold(
      extendBody: true,
      body: Container(
          padding: const EdgeInsets.only(left: 25, right: 19),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/pig.jpg'),
                fit: BoxFit.cover,
                opacity: 0.7),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 0.13.sh),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      'FINANCIAL',
                      minFontSize: 130,
                      style: AppTextStyle.logoFont,
                    ),
                    AutoSizeText(
                      'WALLET',
                      minFontSize: 130,
                      style: AppTextStyle.logoFont,
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  ItemButtonW700(
                    colorButton:  Color(0xffFF97C9).withOpacity(1),
                    colorText: Colors.white,
                    onTap: () {
                      // Storage.saveValue("isLogin", false);
                      Get.offAll(() => const LoginView(),
                          transition: Transition.circularReveal,
                          duration: const Duration(milliseconds: 1000));
                    },
                    text: 'GET STARTED',
                  ),
                  const SizedBox(height: 14),
                  // ItemButton(
                  //     colorButton: Colors.white,
                  //     onTap: () {
                  //       Get.to(
                  //         const RegisterView(),
                  //         transition: Transition.circularReveal,
                  //         duration: const Duration(milliseconds: 500),
                  //       );
                  //     },
                  //     text: 'REGISTER',
                  //     colorText: AppColors.pink),
                  SizedBox(height: 0.05.sh),
                  // const Text(Strings.version,
                  //     style: TextStyle(
                  //         color: Colors.white,
                  //         fontSize: 12,
                  //         fontWeight: FontWeight.w700)),
                  SizedBox(height: 0.03.sh),
                ],
              ),
            ],
          )),
    );
  }
}
