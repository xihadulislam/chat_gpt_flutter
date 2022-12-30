import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import '../../../common/headers.dart';
import '../../../model/image_generation_model.dart';
import 'package:http/http.dart' as http;

class ChatImageController extends GetxController {
  //TODO: Implement ChatImageController

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  List<ImageGenerationData> images = [];

  var state = ApiState.notFound.obs;

  getGenerateImages(String query) async {
    print("call   " + query);

    state.value = ApiState.loading;
    images.clear();

    try {
      // ['256x256', '512x512', '1024x1024']
      Map<String, dynamic> rowParams = {
        "n": 10,
        "size": "256x256",
        "prompt": query,
      };

      final encodedParams = json.encode(rowParams);

      final response = await http.post(
        Uri.parse(endPoint("images/generations")),
        body: encodedParams,
        headers: headerBearerOption(OPEN_AI_KEY),
      );

      if (response.statusCode == 200) {
        images = ImageGenerationModel.fromJson(json.decode(response.body)).data;
        print("succccccccccccccccccccccccc ");
        state.value = ApiState.success;
      } else {
        print("Errorrrrrrrrrrrrrrr  ${response.body}");
        // throw ServerException(message: "Image Generation Server Exception");
        state.value = ApiState.error;
      }
    } catch (e) {
      print("Errorrrrrrrrrrrrrrr  ");
    } finally {
     // searchTextController.clear();
      update();
    }
  }

  TextEditingController searchTextController = TextEditingController();

  clearTextField() {
    searchTextController.clear();
  }
}
