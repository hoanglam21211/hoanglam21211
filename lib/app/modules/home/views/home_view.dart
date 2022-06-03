import 'package:flutter/material.dart';
import 'package:flutter_getx_template/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_getx_template/app/modules/home_page/view/home_page.dart';
import 'package:flutter_getx_template/app/modules/income_outcome/income_outcome_view.dart';
import 'package:flutter_getx_template/app/modules/setting/view/setting_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // @override
  // initState() {
  //   HomeController controller = Get.put(HomeController());
  //   controller.initState();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // DateTime preBackpress = DateTime.now();

    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            // body:Test(),
            body: IndexedStack(
              index: controller.tabIndex.value,
              children: const [
                HomePage(),
                // SettingView(),
                // HistoryView(),
                IncomeOutcomeView(),
                // SettingView(),
                //   // AlertsPage(),
                //   // AccountPage(),
              ],
            ),

            bottomNavigationBar: Container(
              padding: const EdgeInsets.only(top: 6),
              color: Colors.black.withOpacity(0.04),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
                child: Container(
                  height: 68 + ScreenUtil().bottomBarHeight,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(0, -12),
                        blurRadius: 37.0,
                        spreadRadius: 0.0,
                      ), //BoxShadow
                    ],
                  ),
                  child: BottomNavigationBar(
                    unselectedItemColor: const Color(0xFFBDBDBD),
                    selectedItemColor: const Color(0xFFFD409A),
                    onTap: (index) {
                      controller.changeTabIndex(index);
                    },
                    currentIndex: controller.tabIndex.value,
                    showSelectedLabels: true,
                    showUnselectedLabels: true,
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: Colors.white,
                    elevation: 0,
                    items: [
                      _bottomNavigationBarItem(
                        icon: PhosphorIcons.house,
                        label: 'Home',
                      ),
                      // _bottomNavigationBarItem(
                      //   icon: PhosphorIcons.clockCounterClockwise,
                      //   label: 'History',
                      // ),
                      _bottomNavigationBarItem(
                        icon: PhosphorIcons.bellSimple,
                        label: 'Nofitication',
                      ),
                      _bottomNavigationBarItem(
                        icon: PhosphorIcons.user,
                        label: 'Setting',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  _bottomNavigationBarItem({IconData? icon, String? label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
