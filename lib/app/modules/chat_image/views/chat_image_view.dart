import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_gpt_flutter/app/common/headers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

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
      body: Center(
        child: Obx(() => controller.state.value == ApiState.loading
            ? const CircularProgressIndicator()
            : controller.state.value == ApiState.success
                ? MasonryGridView.builder(
                    gridDelegate:
                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    mainAxisSpacing: 3,
                    crossAxisSpacing: 3,
                    itemCount: controller.images.length,
                    itemBuilder: (context, index) {
                      final generatedImage = controller.images[index];

                      return Card(
                        child: CachedNetworkImage(
                          imageUrl: generatedImage.url,
                          fit: BoxFit.cover,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.grey.withOpacity(.3),
                                    highlightColor: Colors.grey,
                                    child: Container(
                                      height: 220,
                                      width: 130,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                    ),
                                  )),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      );
                    })
                : Container()),
      ),
    );
  }
}
