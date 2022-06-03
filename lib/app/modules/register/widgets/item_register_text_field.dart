import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx_template/app/common/values/styles/app_text_style.dart';

class ItemRegisterTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function()? onEditingComplete;
  final Function(String)? onFieldSubmitted;
  final int maxLength;
  final Function(String)? onChanged;
  final bool errorStatus;
  final String hintText;
  final TextInputType textInputType;
  const ItemRegisterTextField(
      {Key? key,
      required this.hintText,
      this.onFieldSubmitted,
      this.errorStatus = false,
      this.onChanged,
      this.onEditingComplete,
      this.maxLength = 30,
      required this.controller,
      this.textInputType = TextInputType.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      margin: const EdgeInsets.only(right: 30, left: 30),
      decoration: BoxDecoration(
          // ignore: use_full_hex_values_for_flutter_colors
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          color:
              errorStatus ? const Color(0xFFFFCCCC) : const Color(0xFFFCF7FE),
          border: errorStatus
              ? Border.all(
                  color: const Color(0xFFFD4040),
                  width: 1,
                )
              : null),
      child: TextFormField(
        keyboardType: textInputType,
        cursorColor: const Color(0xFF3A2752).withOpacity(0.68),
        controller: controller,
        style: AppTextStyle.textMediumStyle.copyWith(
          fontSize: 16,
          color: const Color(0xFF3A2752).withOpacity(0.68),
        ),
        // direct screenonChangedonChanged
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        onFieldSubmitted: onFieldSubmitted,
        // maxLength: maxLength,
        inputFormatters: [
          LengthLimitingTextInputFormatter(maxLength),
        ], // focusNode: widget.focus,
        // style: AppTextStyle.textNormalStyle,
        // obscureText: !_passwordVisible,
        // onTap: widget.onTap,
        // controller: widget.controller,
        decoration: InputDecoration(
          // ignore: use_full_hex_values_for_flutter_colors
          fillColor: const Color(0xFFFFFF).withOpacity(0.15),
          border: InputBorder.none,
          hintText: hintText,

          // prefixStyle: AppTextStyle.textNormalStyle,
          hintStyle: AppTextStyle.textNormalStyle.copyWith(
              color: const Color(0xFF3A2752).withOpacity(0.68), fontSize: 16),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          // errorText: errorText,
          contentPadding:
              const EdgeInsets.only(left: 25, bottom: 11, top: 11, right: 16),
        ),
      ),
    );
  }
}
