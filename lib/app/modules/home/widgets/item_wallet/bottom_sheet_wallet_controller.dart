import 'package:flutter_getx_template/app/common/storage/storage.dart';
import 'package:flutter_getx_template/app/data/api_helper.dart';
import 'package:flutter_getx_template/app/modules/home/widgets/item_wallet/item_dragable_income.dart';
import 'package:flutter_getx_template/app/modules/home/widgets/item_wallet/item_dragable_outcome.dart';
import 'package:flutter_getx_template/app/modules/home/widgets/item_wallet/item_wallet_bottom_sheet.dart';
import 'package:flutter_getx_template/app/modules/income_outcome/income/income_view.dart';
import 'package:get/get.dart';

class ItemWalletBottomSheetStartController extends GetxController {
  RxBool isAddWallet = false.obs;
  RxBool isAddInCome = false.obs;
  RxBool isAddOutCome = false.obs;

  RxInt formStateIndex = 1.obs;
  RxBool isDetailIncome = false.obs;

  RxBool isChosenDragIncome = false.obs;
  RxString inComeChosenImage = ''.obs;
  late Rx<ItemDragableIncome> chosenItemIncome;
  late Rx<ItemDragableOutcome> chosenItemOutcome;
  RxBool isChosenDragOutcome = false.obs;
  RxString outComeChosenImage = ''.obs;
  RxBool isDetailOutcome = false.obs;
}
