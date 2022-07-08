import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeService {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  saveThemeStatus(bool isLightTheme) async {
    SharedPreferences pref = await _prefs;
    //pref.setBool('theme', isLightTheme.value);
    pref.setBool('theme', isLightTheme);
  }

  Future<ThemeMode> getThemeStatus() async {
    var isLight = _prefs.then((SharedPreferences prefs) {
      return prefs.getBool('theme') ?? true;
    }).obs;
    var theme = await isLight.value ? ThemeMode.light : ThemeMode.dark;
    Get.changeThemeMode(theme);
    return theme;
  }
}
