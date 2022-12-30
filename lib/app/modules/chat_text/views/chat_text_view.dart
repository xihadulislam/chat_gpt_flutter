import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
        child: Text(
          'ChatTextView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
