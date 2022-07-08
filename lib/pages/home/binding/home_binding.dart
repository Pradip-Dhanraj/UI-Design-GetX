
import 'package:get/get.dart';
// ignore: unnecessary_import
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:qubehealth/pages/home/controller/home_controller.dart';
import 'package:qubehealth/services/api_service.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiService());
    Get.put(HomeController());
  }
}
