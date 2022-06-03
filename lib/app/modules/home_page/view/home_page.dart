import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/common/values/styles/app_text_style.dart';
import 'package:flutter_getx_template/app/modules/home/widgets/item_bottle.dart';
import 'package:flutter_getx_template/app/modules/home/widgets/item_wallet/item_wallet_bottom_sheet.dart';
import 'package:flutter_getx_template/app/modules/income_outcome/outcome/outcome_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  initState() {
    _modalBottomSheetMenu(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bg.jpg'),
                  opacity: 0.2,
                  fit: BoxFit.cover)),
          child: Center(
            child: Column(children: [
              Container(
                height: 230,
                width: 1.sw,
                decoration: BoxDecoration(
                    color: Color(0xffFF97C9).withOpacity(0.5),
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 40, left: 20),
                      child: Text('Wallet',
                          style: AppTextStyle.textBoldStyle
                              .copyWith(fontSize: 25, color: Colors.white)),
                    ),
                    Container(
                        height: 110,
                        margin: EdgeInsets.only(top: 20, bottom: 20),
                        width: 1.sw,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            ItemWalletHomePage(
                              color: Colors.white,
                              colorWallet: Colors.green,
                            ),
                            ItemWalletHomePage(
                              color: Colors.white,
                              colorWallet: Colors.yellow,
                            ),
                            ItemWalletHomePage(
                              color: Colors.white,
                              colorWallet: Colors.red,
                            ),
                            ItemWalletHomePage(
                              color: Colors.white,
                              colorWallet: Colors.blue,
                            ),
                            ItemWalletHomePage(
                              color: Colors.white,
                              colorWallet: Colors.orange,
                            ),
                            ItemWalletHomePage(
                              color: Colors.white,
                              colorWallet: Colors.purple,
                            ),
                            ItemWalletHomePage(
                              color: Colors.white,
                              colorWallet: Colors.pink,
                            ),
                            ItemWalletHomePage(
                              color: Colors.white,
                              colorWallet: Colors.amberAccent,
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              SizedBox(height: 30),
              AutoSizeText(
                'Jars',
                minFontSize: 50,
                style: AppTextStyle.logoFont,
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.only(right: 20, left: 20, top: 20),
                width: 1.sw,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    ItemBottle(
                      percent: 0.1,
                      color: Colors.red,
                      isDanger: true,
                      iconData: PhosphorIcons.forkKnife,
                    ),
                    ItemBottle(
                      percent: 0.2,
                      color: Colors.orange,
                      isDanger: false,
                      iconData: PhosphorIcons.books,
                    ),
                    ItemBottle(
                      percent: 0.8,
                      color: Colors.yellow,
                      isDanger: true,
                      iconData: PhosphorIcons.gameController,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 20, left: 20, top: 100),
                width: 1.sw,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    ItemBottle(
                        percent: 0.3,
                        color: Colors.blue,
                        isDanger: false,
                        iconData: PhosphorIcons.thumbsUp),
                    ItemBottle(
                      percent: 0.4,
                      color: Colors.lightBlue,
                      isDanger: true,
                      iconData: PhosphorIcons.coins,
                    ),
                    ItemBottle(
                      percent: 0.6,
                      color: Colors.green,
                      isDanger: true,
                      iconData: PhosphorIcons.hourglassSimpleMedium,
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}

void _modalBottomSheetDetail(context) {
  showModalBottomSheet<dynamic>(
      context: context,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      builder: (builder) {
        return ItemWalletBottomSheetStart();
      });
}

void _modalBottomSheetMenu(context) {
  WidgetsBinding.instance?.addPostFrameCallback((_) async {
    await showModalBottomSheet<dynamic>(
        context: context,
        isScrollControlled: true,
        isDismissible: false,
        enableDrag: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        builder: (builder) {
          return ItemWalletBottomSheetStart();
        });
  });
}

class ItemWalletHomePage extends StatelessWidget {
  final Color color;
  final Color colorWallet;
  const ItemWalletHomePage(
      {Key? key, required this.color, required this.colorWallet})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 110,
        height: 110,
        padding: EdgeInsets.all(
          10,
        ),
        margin: EdgeInsets.only(right: 10, left: 10),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ], color: color, borderRadius: BorderRadius.all(Radius.circular(16))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              margin: EdgeInsets.only(right: 5, left: 5),
              decoration: BoxDecoration(
                  color: colorWallet,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child:
                  Icon(PhosphorIcons.wallet, size: 20.0, color: Colors.white),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Wallet: ACB',
                        style: AppTextStyle.textBoldStyle
                            .copyWith(color: Color(0xff223263))),
                    SizedBox(height: 5),
                    Text('200.000 d',
                        style: AppTextStyle.textMediumStyle
                            .copyWith(color: Color(0xff223263))),
                  ]),
            )
          ],
        ));
  }
}
