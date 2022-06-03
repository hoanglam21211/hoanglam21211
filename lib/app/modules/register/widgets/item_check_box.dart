import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/util/exports.dart';

import '../../../common/values/styles/app_text_style.dart';

class ItemCheckBox extends StatelessWidget {
  final bool isReceivedNews;
  const ItemCheckBox({Key? key, this.isReceivedNews = false}) : super(key: key);

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
              border: isReceivedNews
                  ? null
                  : Border.all(
                      width: 2,
                      color: const Color(0xFF3A2752).withOpacity(0.7)),
              borderRadius: const BorderRadius.all(
                Radius.circular(2),
              ),
              color: isReceivedNews ? const Color(0xFF1890FF) : Colors.white,
            ),
            child: Center(
              child: SizedBox(
                  height: 7.83,
                  width: 9.62,
                  child: Image.asset('assets/images/check.png')),
            ),
          ),
          const SizedBox(width: 12),
          SizedBox(
            width: 1.sw - 90,
            child: Text(
                'Receive BIZBOOKLY information and promotions by email.',
                maxLines: 2,
                softWrap: true,
                style: AppTextStyle.textNormalStyle
                    .copyWith(color: const Color(0xFF3A2752).withOpacity(0.7))),
          )
        ],
      ),
    );
  }
}
