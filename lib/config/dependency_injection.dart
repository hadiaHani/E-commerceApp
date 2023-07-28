import 'package:ecommerce_admin_app_firebase/features/main/presenration/controller/main_controller.dart';
import 'package:ecommerce_admin_app_firebase/features/search/presentation/controller/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

final instance = GetIt.instance;

initModule() async {
  WidgetsFlutterBinding.ensureInitialized();
}

initMain() {
  Get.put<MainController>(
    MainController(),
  );
}

initSearch() {
  Get.put<SearchGController>(
    SearchGController(),
  );
}
