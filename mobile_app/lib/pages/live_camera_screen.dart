import 'package:flutter/material.dart';
import 'package:flutter_mjpeg/flutter_mjpeg.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:new_project/widgets/button.dart';

class LiveCameraScreen extends StatefulWidget {
  const LiveCameraScreen({
    super.key,
  });

  @override
  _LiveCameraScreenState createState() => _LiveCameraScreenState();
}

class _LiveCameraScreenState extends State<LiveCameraScreen> {
  late bool isLive;

  @override
  void initState() {
    super.initState();
    isLive = false;
  }

  void _activateLiveCamera() {
    setState(() {
      isLive = true;
    });
  }

  void _deactivateLiveCamera() {
    setState(() {
      isLive = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Child monitoring camera'),
      ),
      body: ListView(children: [
        const SizedBox(
          height: 50,
        ),
        Center(
            child: Container(
          height: 320,
          color: Theme.of(context).colorScheme.onBackground,
          child: Mjpeg(
            isLive: isLive,
            loading: (context) => SpinKitWave(
              color: Theme.of(context).primaryColorLight,
            ),
            stream: 'http://192.168.11.5:8080/?action=stream',
            error: (contet, error, stack) {
              return Center(
                child: Text(
                  'Live camera is stopping',
                  style: TextStyle(
                    fontSize: 25,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                ),
              );
            },
          ),
        )),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(
                  onPressed: _activateLiveCamera,
                  buttonText: 'Start',
                  buttonColor: Theme.of(context).colorScheme.primary),
              const SizedBox(
                width: 30,
              ),
              Button(
                  onPressed: _deactivateLiveCamera,
                  buttonText: 'Stop',
                  buttonColor: Theme.of(context).colorScheme.error),
            ],
          ),
        )
      ]),
    );
  }
}
