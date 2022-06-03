import 'package:flutter_getx_template/app/modules/home/bindings/home_binding.dart';
import 'package:flutter_getx_template/app/modules/home/views/home_view.dart';
import 'package:flutter_getx_template/app/modules/home/widgets/item_wallet/bottom_sheet_wallet_binding.dart';
import 'package:flutter_getx_template/app/modules/home/widgets/item_wallet/item_wallet_bottom_sheet.dart';
import 'package:flutter_getx_template/app/modules/login/flash_view/flash_view.dart';
import 'package:flutter_getx_template/app/modules/login/view/login_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

abstract class AppPages {
  const AppPages._();

  static const INITIAL = Routes.FLASH_VIEW;

  static final routes = [
    GetPage(
      name: _Paths.FLASH_VIEW,
      page: () => const FlashView(),
    ),
    GetPage(
      name: _Paths.WALLET_BOTTOM_SHEET,
      page: () => const ItemWalletBottomSheetStart(),
      // binding: ItemWalletBottomSheetBinding(),
    ),
    // GetPage(
    //   name: _Paths.HOME,
    //   page: () => const HomeView(),
    //   binding: HomeBinding(),
    // ),
  ];
}
