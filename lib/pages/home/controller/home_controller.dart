import 'package:get/get.dart';
import 'package:qubehealth/models/user_feeeling_model.dart';
import 'package:qubehealth/services/api_service.dart';

class HomeController extends GetxController {
  late ApiService apiservice;
  Rx<UserFeelingModel> data = UserFeelingModel().obs;
  RxString desc = ''.obs;
  RxString url = ''.obs;
  RxList<String> weekDays = List<String>.empty().obs;

  void onPageInitialized() async {
    apiservice = Get.find<ApiService>();
    var result = await apiservice.getUserFeelings();
    data.value = result;
    desc.value = result.data!.videoArr!.first.description!;
    url.value = result.data!.videoArr!.first.youtubeUrl!;
    url.value = url.value.split("=")[1];
    var week = await apiservice.getCalendar(7);
    weekDays.value = week;
  }

  Future<UserFeelingModel> loadHomeData() async {
    return await apiservice.getUserFeelings();
  }
}
