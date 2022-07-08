import 'package:get/get.dart';
import 'package:qubehealth/pages/splashscreen/controller/slpashscreen_controller.dart';
import 'package:qubehealth/services/navigation_service.dart';
import 'package:qubehealth/services/theme_service.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NavigationService());
    Get.put(ThemeService());
    Get.put(SplashScreenController());
  }
}
