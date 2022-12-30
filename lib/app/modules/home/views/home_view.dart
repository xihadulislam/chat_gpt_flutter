import 'package:chat_gpt_flutter/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                const SizedBox(width: 8),
                Expanded(
                    child: makeCard(Icons.text_fields_sharp, "Text completion",
                        Colors.green.withOpacity(0.5), () {
                  Get.toNamed(Routes.CHAT_TEXT);
                })),
                Expanded(
                    child: makeCard(Icons.image, "Image generation",
                        Colors.orange.withOpacity(0.5), () {
                  Get.toNamed(Routes.CHAT_IMAGE);
                })),
                const SizedBox(width: 8),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const SizedBox(width: 8),
                Expanded(
                    child: makeCard(Icons.code, "Code completion",
                        Colors.deepPurple.withOpacity(0.5), () {
                  Get.snackbar(
                    "Coming soon!",
                    "",
                    borderRadius: 10,
                  );
                })),
                Expanded(
                    child: makeCard(Icons.auto_graph, "Embeddings",
                        Colors.blue.withOpacity(0.5), () {
                  Get.snackbar(
                    "Coming soon!",
                    "",
                    borderRadius: 10,
                  );
                })),
                const SizedBox(width: 8),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget makeCard(var image, var text, var color, var callback) {
    return InkWell(
      onTap: callback,
      child: Card(
        color: color,
        child: Center(
          child: SizedBox(
            height: 180,
            width: 180,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  image,
                  color: Colors.white,
                  size: 44,
                ),
                const SizedBox(height: 12),
                Text(
                  text,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
