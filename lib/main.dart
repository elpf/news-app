import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mobile_codelab_md2/dependency_injection.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
  DependencyInjection.init();
}
