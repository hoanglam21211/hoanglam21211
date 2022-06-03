import 'package:flutter_getx_template/app/common/storage/storage.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt tabIndex = 0.obs;
  @override
  onInit() {
   
    super.onInit();
  }

  // final ApiHelper _apiHelper = ApiHelper.to;
  changeTabIndex(index) {
    tabIndex.value = index;
    update();
  }
  // final RxList _dataList = RxList();
  // List<dynamic> get dataList => _dataList;
  // set dataList(List<dynamic> dataList) => _dataList.addAll(dataList);

  // @override
  // void onReady() {
  //   super.onReady();

  //   getPosts();
  // }

  // void getPosts() {
  //   _apiHelper.getPosts().futureValue(
  //         (value) => dataList = value,
  //         retryFunction: getPosts,
  //       );
  // }

  void onEditProfileClick() {
    Get.back();
  }

  void onFaqsClick() {
    Get.back();
  }

  void onLogoutClick() {
    Storage.clearStorage();
    // Get.offAllNamed(Routes.HOME);
    //Specify the INITIAL SCREEN you want to display to the user after logout
  }
}
