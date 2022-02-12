import 'package:get/get.dart';
import 'package:getxlearning2/GetViewAndGetWidget/controllers/count_controller.dart';

class ScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CountController());
  }
}
