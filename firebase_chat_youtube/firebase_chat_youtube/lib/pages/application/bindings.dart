import 'package:ChatON/pages/sign_in/controller.dart';
import 'package:get/get.dart';

import 'controller.dart';

class ApplicationBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ApplicationController>(()=>ApplicationController());
  }

}