import 'package:flutter/material.dart';

import '../../../common/values/styles/app_text_style.dart';

class ItemPasswordRegisterTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final bool errorStatus;
  const ItemPasswordRegisterTextField(
      {Key? key,
      this.onChanged,
      this.errorStatus = false,
      required this.controller,
      required this.hintText})
      : super(key: key);

  @override
  State<ItemPasswordRegisterTextField> createState() =>
      _ItemPasswordRegisterTextFieldState();
}

@override
bool _passwordVisible = false;

void initState(_passwordVisible) {
  _passwordVisible = false;
}

class _ItemPasswordRegisterTextFieldState
    extends State<ItemPasswordRegisterTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      margin: const EdgeInsets.only(right: 30, left: 30),
      decoration: BoxDecoration(
        // ignore: use_full_hex_values_for_flutter_colors
        color: widget.errorStatus
            ? const Color(0xFFFFCCCC)
            : const Color(0xFFFCF7FE),
        border: widget.errorStatus
            ? Border.all(
                color: const Color(0xFFFD4040),
                width: 1,
              )
            : null,

        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        cursorColor: Colors.black,
        style: AppTextStyle.textNormalStyle.copyWith(
          fontSize: 16,
          color: const Color(0xFF3A2752).withOpacity(0.68),
        ),
        onTap: () {},
        obscureText: !_passwordVisible,
        controller: widget.controller,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          // ignore: use_full_hex_values_for_flutter_colors
          fillColor: const Color(0xFFFFFF).withOpacity(0.15),
          border: InputBorder.none,
          hintText: widget.hintText,

          // prefixStyle: AppTextStyle.textNormalStyle,
          hintStyle: AppTextStyle.textNormalStyle.copyWith(
            fontSize: 16,
            color: const Color(0xFF3A2752).withOpacity(0.68),
          ),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          suffixIcon: IconButton(
            icon: SizedBox(
              height: 30,
              width: 30,
              child: Icon(
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: const Color(0xFFDCDBDB),
                size: 17,
              ),
            ),
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
          contentPadding:
              const EdgeInsets.only(left: 25, bottom: 11, top: 13, right: 16),
        ),
      ),
    );
  }
}
