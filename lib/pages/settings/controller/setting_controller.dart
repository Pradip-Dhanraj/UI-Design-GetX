import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qubehealth/services/navigation_service.dart';
import 'package:qubehealth/services/theme_service.dart';

class SettingController extends GetxController {
// ignore: prefer_final_fields
  RxBool isLightTheme = true.obs;
  late ThemeService theme;

  Future onPageInitialized() async {
    theme = Get.find<ThemeService>();
    var currentMode = await theme.getThemeStatus();
    isLightTheme.value = (currentMode == ThemeMode.light);
  }

  navigateToPage(String path) async {
    var nav = Get.find<NavigationService>();
    await nav.navigateToPage(path);
  }

  void setThemeManually(bool val) {
    isLightTheme.value = val;
    Get.changeThemeMode(
      isLightTheme.value ? ThemeMode.light : ThemeMode.dark,
    );
    theme.saveThemeStatus(val);
  }
}
