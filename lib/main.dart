import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx_template/app/common/values/strings.dart';
import 'package:flutter_getx_template/app/common/values/styles/theme.dart';
import 'package:flutter_getx_template/app/routes/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app/common/util/initializer.dart';

const String MATERIAL_SCREEN = "/material_screen";
const String CUPERTINO_SCREEN = "/cupertino_screen";
void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  // runApp(const MyApp());
  // Initializer.instance.init(() {
  runApp(const MyApp());
  // });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      BoxConstraints(
        maxWidth: Get.width,
        maxHeight: Get.height,
      ),
      designSize: Get.size,
    );

    return GetMaterialApp(
      title: Strings.appName,
      debugShowCheckedModeBanner: false,
      // theme: AppTheme.theme,

      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      // initialBinding: InitialBindings(),
      // builder: (_, child) => BaseWidget(a
      //   child: child ?? const SizedBox.shrink(),
      // ),
    );
  }
}
