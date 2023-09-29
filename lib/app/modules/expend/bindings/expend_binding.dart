import 'package:get/get.dart';

import '../controllers/expend_controller.dart';

class ExpendBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExpendController>(
      () => ExpendController(),
    );
  }
}
