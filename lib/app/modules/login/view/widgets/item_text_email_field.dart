import 'package:flutter/material.dart';

import '../../../../common/values/styles/app_text_style.dart';

class ItemTextEmailField extends StatefulWidget {
  final String hintText;
  // final FocusNode focus;
  final String? Function(String?)? validation;
  final Function(String?)? onSaved;
  final bool isVisibleField;
final Function (String)? onChanged ; 
  final dynamic onTap;
  final TextEditingController controller;
  const ItemTextEmailField(
      {Key? key,
      required this.hintText,
      // required this.focus,
      this.validation,
      this.isVisibleField = true,
      this.onSaved,
      this.onChanged,
      required this.controller,
      required this.onTap})
      : super(key: key);

  @override
  State<ItemTextEmailField> createState() => _ItemTextFieldState();
}

class _ItemTextFieldState extends State<ItemTextEmailField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      margin: const EdgeInsets.only(right: 30, left: 30),
      decoration: BoxDecoration(
        // ignore: use_full_hex_values_for_flutter_colors
        color: Color(0xffFF97C9).withOpacity(0.5),
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: TextFormField(
        onSaved: widget.onSaved,
        keyboardType: TextInputType.emailAddress,
        cursorColor: Colors.white,
        style: AppTextStyle.textNormalStyle.copyWith(
          fontSize: 16,
        ),
        // direct screen

        // focusNode: widget.focus,
        onChanged : widget.onChanged! ,
        obscureText: !widget.isVisibleField,
        onTap: widget.onTap,
        controller: widget.controller,
        validator: widget.validation,
        decoration: InputDecoration(
          // ignore: use_full_hex_values_for_flutter_colors
          fillColor: const Color(0xFFFFFF),
          border: InputBorder.none,
          hintText: widget.hintText,
          prefixStyle: AppTextStyle.textNormalStyle,
          hintStyle: AppTextStyle.textNormalStyle.copyWith(fontSize: 16),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,

          contentPadding:
              const EdgeInsets.only(left: 25, bottom: 11, top: 11, right: 16),
        ),
      ),
    );
  }
}
