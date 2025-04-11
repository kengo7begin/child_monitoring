import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_project/view_model/raspi_table_view_model.dart';

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
    final text = ref.watch(raspiTableViewModelProvider('1'));
    return Center(child: Text(text.toString()));
  }
}
