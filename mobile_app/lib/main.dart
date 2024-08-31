import 'package:flutter/material.dart';
import 'package:flutter_mjpeg/flutter_mjpeg.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:new_project/api/try_to_call.dart';
import 'package:new_project/pages/live_camera_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LiveCameraScreen(),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     getData();
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: const Text('Child monitoring camera'),
//       ),
//       body: Center(
//           child: Mjpeg(
//         isLive: true,
//         loading: (context) => SpinKitWave(),
//         stream: 'http://192.168.11.5:8080/?action=stream',
//         error: (contet, error, stack) {
//           print(error);
//           return Text('Live camera is stopping.');
//         },
//       )),
//     );
//   }
// }
