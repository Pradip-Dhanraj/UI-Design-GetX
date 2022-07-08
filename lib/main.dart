import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qubehealth/configs/theme.dart';
import 'package:qubehealth/pages/home/binding/home_binding.dart';
import 'package:qubehealth/pages/home/view/home_screen.dart';
import 'package:qubehealth/pages/settings/view/settings_screen.dart';
import 'package:qubehealth/pages/splashscreen/binding/splashscreen_binding.dart';
import 'package:qubehealth/pages/splashscreen/view/splashscreen.dart';
import 'pages/settings/binding/setting_binding.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'QubeHealth App',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      getPages: [
        GetPage(
            name: "/home",
            page: () => const HomeScreen(),
            binding: HomeBinding()),
        GetPage(
          name: "/splashscreen",
          page: () => const SplashScreen(),
          binding: SplashScreenBinding(),
        ),
        GetPage(
          name: "/setting",
          page: () => const SettingScreen(),
          binding: SettingBinding(),
        ),
      ],
      initialRoute: "/splashscreen",
    );
  }
}
