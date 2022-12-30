import 'package:get/get.dart';

import '../controllers/chat_image_controller.dart';

class ChatImageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatImageController>(
      () => ChatImageController(),
    );
  }
}
