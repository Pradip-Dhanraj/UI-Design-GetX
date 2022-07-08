import 'package:get/get.dart';
import 'package:qubehealth/pages/settings/controller/setting_controller.dart';
import 'package:qubehealth/services/navigation_service.dart';
import 'package:qubehealth/services/theme_service.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(ThemeService());
    Get.put(SettingController());
    Get.put(NavigationService());
  }
}
