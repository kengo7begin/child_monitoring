import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget fullScreenLoading(BuildContext context) {
  return Center(
    child: SpinKitWave(
      color: Theme.of(context).primaryColorLight,
    ),
  );
}
