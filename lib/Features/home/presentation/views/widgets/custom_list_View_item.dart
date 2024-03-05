import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class FeaturedListViewItem extends StatelessWidget {
  const FeaturedListViewItem({super.key,required this.imageUrl});
final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio:2.6/4 ,
        child:CachedNetworkImage(
          imageUrl: imageUrl,fit: BoxFit.fill,
          placeholder: (context, url) => const Center(child: CircularProgressIndicator(),),
          errorWidget: (context, url, error) {
            return const Icon(Icons.error_outline_outlined);
          },
        )
      ),
    );
  }
}
