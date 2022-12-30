

class ImageGenerationModel {
  final num created;
  final List<ImageGenerationData> data;

  ImageGenerationModel({required this.created, required this.data});

  factory ImageGenerationModel.fromJson(Map<String, dynamic> json) {
    final imageGenerationItems = json['data'] as List;
    List<ImageGenerationData> imagesData = imageGenerationItems
        .map((singleItem) => ImageGenerationData.fromJson(singleItem))
        .toList();

    return ImageGenerationModel(
      data: imagesData,
      created: json['created'],
    );
  }
}

class ImageGenerationData{
  final String url;

  ImageGenerationData({required this.url});


  factory ImageGenerationData.fromJson(Map<String,dynamic> json){
    return ImageGenerationData(url: json['url'],);
  }
}