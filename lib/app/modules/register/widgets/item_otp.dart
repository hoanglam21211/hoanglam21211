import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/modules/register/controller/register_controller.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ItemOTP extends StatelessWidget {
  const ItemOTP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterController());
    final TextEditingController textEditingController =
        TextEditingController(text: '');
    return Form(
      // key: formKey,
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          child: PinCodeTextField(
            controller: textEditingController,
            appContext: context,
            backgroundColor: Colors.white,
            length: 6,
            animationType: AnimationType.fade,
            validator: (v) {
              if (v!.length < 3) {
                return "I'm from validator";
              } else {
                return null;
              }
            },
            pinTheme: PinTheme(
              inactiveColor: const Color(0xFFA9A9A9).withOpacity(0.6),
              inactiveFillColor: Colors.white,
              activeColor: const Color(0xFF4285F4).withOpacity(0.6),
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(10),
              fieldHeight: 51,
              fieldWidth: 43,
              selectedFillColor: Colors.white,
              selectedColor: const Color(0xFF4285F4).withOpacity(0.6),
              activeFillColor: Colors.white,
              errorBorderColor: Colors.red,
            ),
            cursorColor: const Color(0xFFA9A9A9).withOpacity(0.8),
            animationDuration: const Duration(milliseconds: 300),
            enableActiveFill: true,
            keyboardType: TextInputType.number,
            onCompleted: (v) {
              // controller.verifyUser(textEditingController.text);
            },
            beforeTextPaste: (text) {
              return true;
            },
            onChanged: (String value) {},
          )),
    );
  }
}
