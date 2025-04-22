import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_project/view_model/pictures_view_model.dart';
import 'package:new_project/widgets/full_screen_loading.dart';
import 'package:new_project/widgets/photo/photo_gallery.dart';

class PhotoHistoryScreen extends ConsumerStatefulWidget {
  const PhotoHistoryScreen({
    super.key,
  });
  @override
  ConsumerState<PhotoHistoryScreen> createState() => _PhotoHistoryScreenState();
}

class _PhotoHistoryScreenState extends ConsumerState<PhotoHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final signedUrls = ref.watch(picturesViewModelProvider);
    bool isFirstLoad = signedUrls.isLoading && !signedUrls.hasValue;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Photo gallery'),
        ),
        body: isFirstLoad
            ? fullScreenLoading(context)
            : PhotoGallery(imageUrls: signedUrls.value!));
  }
}
