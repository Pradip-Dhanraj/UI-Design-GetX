import 'package:get/get.dart';

class NavigationService {
  Future navigateToPage(
    String page, {
    dynamic args,
  }) async {
    // await Get.toNamed(
    //       page,
    //       arguments: args,
    //     );
    switch (page) {
      case "/setting":
        await Get.offAllNamed(
          page,
        );
        break;
      default:
        await Get.toNamed(
          page,
          arguments: args,
        );
    }
  }
}
