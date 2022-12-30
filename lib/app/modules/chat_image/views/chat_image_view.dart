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
    controller.getGenerateImages("cat");

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat GPT Images'),
        centerTitle: true,
      ),
      body: Obx(() => Column(
            children: [
              Expanded(
                child: Center(
                    child: controller.state.value == ApiState.loading
                        ? const CircularProgressIndicator()
                        : controller.state.value == ApiState.success
                            ? ImageCard(images: controller.images)
                            : Container()),
              ),
              const SizedBox(height: 8),
              SearchTextFieldWidget(
                textEditingController: controller.searchTextController,
                onTap: () {
                  controller
                      .getGenerateImages(controller.searchTextController.text);
                },
              ),
              const SizedBox(height: 12),
            ],
          )),
    );
  }
}
