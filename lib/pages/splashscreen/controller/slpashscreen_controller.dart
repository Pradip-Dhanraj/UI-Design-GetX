import 'package:get/get.dart';
import 'package:qubehealth/services/navigation_service.dart';
import 'package:qubehealth/services/theme_service.dart';

class SplashScreenController extends GetxController {
  navigateToPage(String path) async {
    var nav = Get.find<NavigationService>();
    await nav.navigateToPage(path);
  }

  void onPageInitialized() async {
    var theme = Get.find<ThemeService>();
    await theme.getThemeStatus();
  }
}
