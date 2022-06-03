import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_getx_template/app/common/values/styles/app_text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class IncomeView extends StatelessWidget {
  const IncomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 1.sh - 256,
        child: ListView(
          children: [
            ItemIncome(
                amount: ' 200.000đ',
                from: 'VCB',
                name: 'Lương tháng',
                description: 'lương '),
            ItemIncome(
                amount: ' 600.000đ',
                from: 'VCB',
                name: 'Bố mẹ cho',
                description: 'mừng tuổi'),
            ItemIncome(
                amount: ' 1.200.000đ',
                from: 'VCB',
                name: 'Trúng vé số',
                description: 'lương '),
            ItemIncome(
                amount: '3.200.000đ',
                from: 'VCB',
                name: 'Lương viết bài blog',
                description: 'lương '),
            ItemIncome(
                amount: '2.200.000đ',
                from: 'VCB',
                name: 'Tiền lãi cho vay',
                description: 'lương '),
            ItemIncome(
                amount: ' 200.000đ',
                from: 'VCB',
                name: 'Lợi nhuận từ bán hàng online',
                description: 'lương '),
            ItemIncome(
                amount: ' 100.000.000đ',
                from: 'VCB',
                name: 'Làm dự án ngoài',
                description: 'lương '),
          ],
        ));
  }
}

class ItemIncome extends StatelessWidget {
  final String amount;
  final String name;
  final String description;
  final String from;
  final Function()? onTap;
  const ItemIncome(
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
      onTap: onTap,
      child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                  width: 2, color: Color(0xffCBE438).withOpacity(0.2)),
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
                  style: AppTextStyle.textSemiBoldStyle
                      .copyWith(fontSize: 14, color: Colors.black),
                ),
                SizedBox(height: 20),
                Text(
                  description,
                  style: AppTextStyle.textLightStyle
                      .copyWith(fontSize: 14, color: Colors.black),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Icon(
                      PhosphorIcons.wallet,
                      size: 20.0,
                    ),
                    SizedBox(width: 10),
                    Text('Wallet: $from',
                        style: AppTextStyle.textMediumStyle
                            .copyWith(fontSize: 14, color: Colors.black)),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Icon(
                      PhosphorIcons.money,
                      color: Color(0xff009C22),
                      size: 20.0,
                    ),
                    SizedBox(width: 10),
                    Text(
                      '+$amount',
                      style: AppTextStyle.textSemiBoldStyle
                          .copyWith(fontSize: 14, color: Color(0xff009C22)),
                    ),
                  ],
                ),
              ],
            )
          ])),
    );
  }
}
