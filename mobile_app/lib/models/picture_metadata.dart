import 'package:freezed_annotation/freezed_annotation.dart';

part 'picture_metadata.freezed.dart';

@freezed
class PictureMetadata with _$PictureMetadata {
  const factory PictureMetadata(
      {required String id,
      required String key,
      required String createdAt}) = _PictureMetadata;
}

@freezed
class PictureMetadataConnection with _$PictureMetadataConnection {
  const factory PictureMetadataConnection({
    required List<PictureMetadata> items,
    String? nextToken,
  }) = _PictureMetadataConnection;
}
