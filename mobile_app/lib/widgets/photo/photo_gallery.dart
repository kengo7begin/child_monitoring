import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:new_project/widgets/photo/full_screen_photo.dart';

class PhotoGallery extends StatefulWidget {
  final List<String> imageUrls;

  const PhotoGallery({super.key, required this.imageUrls});

  @override
  State<PhotoGallery> createState() => _PhotoGalleryState();
}

class _PhotoGalleryState extends State<PhotoGallery>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true; // 🔥 状態を保持する

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GridView.builder(
      padding: const EdgeInsets.all(4),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: widget.imageUrls.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => FullScreenImageViewer(
                imageUrls: widget.imageUrls,
                initialIndex: index,
              ),
            ));
          },
          child: ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: CachedNetworkImage(
                imageUrl: widget.imageUrls[index],
                fit: BoxFit.cover,
                fadeInDuration: const Duration(milliseconds: 100),
                // placeholder: (context, url) => const Center(
                //     child: CircularProgressIndicator(strokeWidth: 2)),
                // errorWidget: (context, url, error) => const Icon(Icons.error),
              )),
        );
      },
    );
  }
}
