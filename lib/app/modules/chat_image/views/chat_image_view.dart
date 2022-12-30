import 'package:chat_gpt_flutter/app/common/headers.dart';
import 'package:chat_gpt_flutter/app/modules/chat_image/views/widgets/image_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/search_text_field_widget.dart';
import '../controllers/chat_image_controller.dart';

class ChatImageView extends GetView<ChatImageController> {
  const ChatImageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // controller.getGenerateImages("cat");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.withOpacity(0.8),
        title: const Text('Chat GPT Images'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() => Center(
                child: controller.state.value == ApiState.loading
                    ? const CircularProgressIndicator()
                    : controller.state.value == ApiState.success
                        ? ImageCard(images: controller.images)
                        : controller.state.value == ApiState.notFound
                            ? const Center(
                                child: Text("Search what ever you want."),
                              )
                            : Center(
                                child: Text(
                                  "Image Generation Failed!",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle().copyWith(height: 2),
                                ),
                              ))),
          ),
          const SizedBox(height: 8),
          SearchTextFieldWidget(
            color: Colors.orange.withOpacity(0.8),
            textEditingController: controller.searchTextController,
            onTap: () {
              controller
                  .getGenerateImages(controller.searchTextController.text);
            },
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
