import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../../common/headers.dart';
import '../../../common/search_text_field_widget.dart';
import '../controllers/chat_text_controller.dart';

class ChatTextView extends GetView<ChatTextController> {
  const ChatTextView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChatTextView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(children: [
          Expanded(
            child: Obx(() => controller.state.value == ApiState.loading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: controller.messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      final textData = controller.messages[index];
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                textData.text,
                                style: const TextStyle(fontSize: 18),
                              ),
                              const SizedBox(height: 30),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        Share.share(textData.text);
                                      },
                                      child: const Icon(Icons.share, size: 35)),
                                  InkWell(
                                      onTap: () {
                                        Clipboard.setData(
                                            ClipboardData(text: textData.text));
                                      },
                                      child: const Icon(Icons.copy, size: 35)),
                                ],
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      );
                    },
                  )),
          ),
          SearchTextFieldWidget(
              textEditingController: controller.searchTextController,
              onTap: () {
                controller
                    .getTextCompletion(controller.searchTextController.text);
              }),
          const SizedBox(height: 20),
        ]),
      ),
    );
  }
}
