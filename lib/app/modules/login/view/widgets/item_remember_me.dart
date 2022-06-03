import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/values/styles/app_text_style.dart';

class ItemCheckBoxRememberMe extends StatelessWidget {
  final bool isActive;
  const ItemCheckBoxRememberMe({Key? key, this.isActive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 31, left: 31),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 16,
            width: 16,
            decoration: BoxDecoration(
              border: isActive
                  ? null
                  : Border.all(
                      width: 2,
                      color: const Color(0xFFFD409A).withOpacity(0.6)),
              borderRadius: const BorderRadius.all(
                Radius.circular(2),
              ),
              color: isActive
                  ? const Color(0xFFFD409A).withOpacity(0.6)
                  : Colors.white,
            ),
            child: Center(
              child: SizedBox(
                  height: 7.83,
                  width: 9.62,
                  // child: Image.asset('assets/images/check.png')
                  
                  
                  ),
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 1.sw - 90,
            child: Text('Remember me',
                maxLines: 2,
                softWrap: true,
                style: AppTextStyle.textNormalStyle
                    .copyWith(color: Color(0xffFF97C9), fontSize: 16.sp)),
          ),
        ],
      ),
    );
  }
}
