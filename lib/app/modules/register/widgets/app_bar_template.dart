import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/values/styles/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarTemplate extends StatelessWidget {
  const AppBarTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var safePadding = MediaQuery.of(context).padding.top;

    return Column(
      children: [
        SizedBox(height: safePadding),
        Stack(children: [
          SizedBox(
            height: 40,
            child: Center(
              child: Text(
                'Register',
                style: AppTextStyle.textTitleStyle
                    .copyWith(color: Colors.black, fontSize: 18.sp),
              ),
            ),
          ),
          const Positioned(
              left: 30,
              top: 6,
              child: Icon(
                Icons.arrow_back_rounded,
              )),
        ]),
      ],
    );
  }
}
