import 'dart:async';
import 'package:new_project/repositories/pictures.dart';
import 'package:new_project/view_model/picture_keys_view_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pictures_view_model.g.dart';

@Riverpod(keepAlive: true)
class PicturesViewModel extends _$PicturesViewModel {
  @override
  Future<List<String>> build() async {
    final keys =
        await ref.watch(pictureKeysViewModelProvider(null, null).future);
// 全てのURLを再取得しにいっている
    final pictures =
        await ref.watch(picturesRepositoryProvider).getSignedUrl(keys);

    return pictures;
  }
}
