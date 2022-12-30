import 'package:get/get.dart';

import '../controllers/chat_text_controller.dart';

class ChatTextBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatTextController>(
      () => ChatTextController(),
    );
  }
}
