import 'package:ChatON/pages/chat/controller.dart';
import 'package:get/get.dart';

class ChatBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(()=>ChatController());
  }

}