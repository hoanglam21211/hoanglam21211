import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_getx_template/app/modules/register/controller/register_controller.dart';
import 'package:flutter_getx_template/app/modules/register/widgets/item_otp.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/values/styles/app_text_style.dart';

class OTPView extends StatefulWidget {
  const OTPView({Key? key}) : super(key: key);

  @override
  State<OTPView> createState() => _OTPViewState();
}

TextEditingController controller = TextEditingController(text: "");
String thisText = "";
int pinLength = 4;
bool hasError = false;

@override
void dispose() {
  controller.dispose();
}

class _OTPViewState extends State<OTPView> {
  @override
  Widget build(BuildContext context) {
    var heightAppbar = AppBar().preferredSize.height;
    // final passwordController = TextEditingController(text: '');

    return GetBuilder<RegisterController>(
      builder: (controller) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
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
                  Icons.arrow_back,
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
              'Verify',
              style: AppTextStyle.textTitleStyle
                  .copyWith(color: Colors.black, fontSize: 18.sp),
            ),
          ),
          body: Container(
            height: 1.sh,
            padding: EdgeInsets.only(top: heightAppbar + 40),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background_register.jpg'),
                    fit: BoxFit.cover)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // const BizBooklyContainer(),
                  Container(
                    margin: const EdgeInsets.only(right: 31, left: 31),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 43),
                        Text(
                          'Enter the 6 digits code that you received on your mailbox.',
                          style: AppTextStyle.textNormalStyle.copyWith(
                              fontSize: 18,
                              color: const Color(
                                0xFF4F4F4F,
                              ),
                              height: 1.5),
                        ),
                        const ItemOTP(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
