import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/values/styles/app_text_style.dart';

class ItemTextPassword extends StatefulWidget {
  final String hintText;
  final bool isSuffixIcon;
  // final FocusNode focus;
  final String? Function(String?)? validation;
  final Function(String?)? onSaved;
  final Function(String)? onChanged;
  final dynamic onTap;
  final TextEditingController controller;
  const ItemTextPassword(
      {Key? key,
      required this.hintText,
      this.isSuffixIcon = false,
      // required this.focus,
      this.validation,
      this.onChanged,
      this.onSaved,
      required this.controller,
      required this.onTap})
      : super(key: key);

  @override
  State<ItemTextPassword> createState() => _ItemTextPasswordState();
}

@override
bool _passwordVisible = false;

void initState(_passwordVisible) {
  _passwordVisible = true;
}

class _ItemTextPasswordState extends State<ItemTextPassword> {
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
        // direct scrhfgheen
        onChanged: widget.onChanged,
        // focusNode: widget.focus,
        style: AppTextStyle.textNormalStyle.copyWith(fontSize: 16),
        obscureText: !_passwordVisible,
        onTap: widget.onTap,
        controller: widget.controller,
        validator: widget.validation,
        decoration: InputDecoration(
          // ignore: use_full_hex_values_for_flutter_colors
          fillColor:  Color(0xffFF97C9).withOpacity(0.8),
          border: InputBorder.none,
          hintText: widget.hintText,
          prefixStyle: AppTextStyle.textNormalStyle,
          hintStyle: AppTextStyle.textNormalStyle.copyWith(fontSize: 16),
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          suffixIcon: widget.isSuffixIcon
              ? IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                    color: _passwordVisible
                        ? Colors.white
                        : const Color(0xFFFFFFFF).withOpacity(0.3),
                    size: 17,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                )
              : null,
          contentPadding:
              const EdgeInsets.only(left: 25, bottom: 11, top: 11, right: 16),
        ),
      ),
    );
  }
}
