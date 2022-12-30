import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

class ImageCard extends StatelessWidget {
  ImageCard({Key? key, this.images}) : super(key: key);

  var images;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        mainAxisSpacing: 3,
        crossAxisSpacing: 3,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Card(
            child: CachedNetworkImage(
              imageUrl: images[index].url,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  SizedBox(
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
                              borderRadius: BorderRadius.circular(4)),
                        ),
                      )),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          );
        });
  }
}
