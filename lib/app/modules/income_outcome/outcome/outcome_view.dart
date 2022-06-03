import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_getx_template/app/common/values/styles/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OutComeView extends StatelessWidget {
  const OutComeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 1.sh - 256,
        child: ListView(
          children: [
            ItemOutCome(
                amount: ' 200.000đ',
                from: 'VCB',
                name: 'Trả tiền trọ',
                description: 'lương '),
            ItemOutCome(
                amount: ' 600.000đ',
                from: 'VCB',
                name: 'Mua khóa học trên Udemy',
                description: 'mừng tuổi'),
            ItemOutCome(
                amount: ' 1.200.000đ',
                from: 'NHS',
                name: 'Mua quyển Đắc nhân tâm',
                description: 'lương '),
            ItemOutCome(
                amount: '3.200.000đ',
                from: 'ACB',
                name: 'Đầu tư Finhay',
                description: 'lương '),
            ItemOutCome(
                amount: '2.200.000đ',
                from: 'Momo',
                name: 'Tiền ăn',
                description: 'lương '),
            ItemOutCome(
                amount: ' 200.000đ',
                from: 'BIDV',
                name: 'Lợi nhuận từ bán hàng online',
                description: 'lương '),
            ItemOutCome(
                amount: ' 100.000.000đ',
                from: 'VCB',
                name: 'Làm dự án ngoài',
                description: 'lương '),
          ],
        ));
  }
}

class ItemOutCome extends StatelessWidget {
  final String amount;
  final String name;
  final String description;
  final String from;
  final Function()? onTap ;
  const ItemOutCome(
      {Key? key,
      required this.amount,
      required this.name,
       this.onTap,
      required this.description,
      required this.from})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap : onTap, 
      child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  // ignore: use_full_hex_values_for_flutter_colors
                  color: const Color(0x000000).withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: 40,
                  offset: const Offset(0, 4), // changes position of shadow
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: AppTextStyle.textMediumStyle
                      .copyWith(fontSize: 16, color: Colors.black),
                ),
                SizedBox(height: 20),
                Text(
                  description,
                  style: AppTextStyle.textNormalStyle
                      .copyWith(fontSize: 14, color: Colors.black),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Wallet: $from',
                    style: AppTextStyle.textSemiBoldStyle
                        .copyWith(fontSize: 14, color: Colors.black)),
                const SizedBox(height: 20),
                Text(
                  '-$amount',
                  style: AppTextStyle.textSemiBoldStyle
                      .copyWith(fontSize: 14, color: Color(0xffFD409A)),
                ),
              ],
            )
          ])),
    );
  }
}
