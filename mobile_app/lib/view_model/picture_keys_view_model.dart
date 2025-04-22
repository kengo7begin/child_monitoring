import 'dart:async';
import 'dart:ffi';
import 'package:new_project/repositories/picture_metadata.dart';
import 'package:new_project/util/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'picture_keys_view_model.g.dart';

@Riverpod(keepAlive: true)
class PictureKeysViewModel extends _$PictureKeysViewModel {
  @override
  Future<List<String>> build(Int? limit, String? nextToken) async {
    final pictureMetadata = await ref
        .watch(pictureMetadataRepositoryProvider)
        .listPictureMetadata(limit, nextToken);

    final onAddPictureMetadataSubscription = ref
        .read(pictureMetadataRepositoryProvider)
        .onAddPictureMetadata()
        .listen(
      null,
      onError: (error, stackTrace) {
        logger.severe(
          'PictureKeysViewModel: onAddPictureMetadataSubscription subscription errored',
          error: error,
          stackTrace: stackTrace,
        );
      },
      onDone: () {
        logger.info(
          'PictureKeysViewModel: onAddPictureMetadataSubscription subscription closed',
        );
      },
    );

    onAddPictureMetadataSubscription.onData((data) async {
      final previousDataset = await future;
      final updatedList = [data.key, ...previousDataset];

      state = AsyncData(updatedList);
    });
    return pictureMetadata.items.map((item) => item.key).toList();
  }
}
