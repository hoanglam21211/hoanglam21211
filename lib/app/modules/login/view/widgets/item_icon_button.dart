import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_getx_template/app/common/values/styles/app_text_style.dart';

// ignore: must_be_immutable
class ItemIconButton extends StatelessWidget {
  final String text;
  final Function() onTap;
  final String image;
  const ItemIconButton({
    Key? key,
    required this.text,
    required this.image,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bounceable(

      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 30, right: 30),
        child: Stack(
          children: [
            Container(
              height: 48,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                color: Colors.white,
              ),
              child: Center(
                child: Text(
                  text,
                  style: AppTextStyle.textNormalStyle.copyWith(
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      color: const Color(0xFF1C2439)),
                ),
              ),
            ),
            Positioned(
              left: 40,
              top: 14,
              child: SizedBox(
                width: 20,
                height: 20,
                child: Image.asset('assets/images/$image'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
