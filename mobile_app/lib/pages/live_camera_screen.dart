import 'package:flutter/material.dart';
import 'package:flutter_mjpeg/flutter_mjpeg.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:new_project/api/start_live_camera.dart';
import 'package:new_project/api/stop_live_camera.dart';
import 'package:new_project/widgets/button.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class LiveCameraScreen extends StatefulWidget {
  const LiveCameraScreen({
    super.key,
  });

  @override
  _LiveCameraScreenState createState() => _LiveCameraScreenState();
}

class _LiveCameraScreenState extends State<LiveCameraScreen> {
  late bool isLive;
  late bool isProgress;

  @override
  void initState() {
    super.initState();
    isLive = false;
    isProgress = false;
  }

  Future<void> _activateLiveCamera() async {
    setState(() {
      isProgress = true;
    });
    final status = await startLiveCamera();
    if (status == '200') {
      setState(() {
        isLive = true;
      });
    }
    setState(() {
      isProgress = false;
    });
  }

  Future<void> _deactivateLiveCamera() async {
    setState(() {
      isProgress = true;
    });
    final status = await stopLiveCamera();
    if (status == '200') {
      setState(() {
        isLive = false;
      });
    }
    setState(() {
      isProgress = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    WakelockPlus.enable();
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
          child: isProgress
              ? SpinKitWave(
                  color: Theme.of(context).primaryColorLight,
                )
              : Mjpeg(
                  isLive: isLive,
                  loading: (context) => SpinKitWave(
                    color: Theme.of(context).primaryColorLight,
                  ),
                  stream: 'http://192.168.11.5:8080/?action=stream',
                  error: (contet, error, stack) {
                    return Center(
                      child: Text(
                        isLive
                            ? 'You cannot connect'
                            : 'Live camera is stopping',
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
                buttonColor: Theme.of(context).colorScheme.primary,
                isProgress: isProgress,
              ),
              const SizedBox(
                width: 30,
              ),
              Button(
                onPressed: _deactivateLiveCamera,
                buttonText: 'Stop',
                buttonColor: Theme.of(context).colorScheme.error,
                isProgress: isProgress,
              ),
            ],
          ),
        )
      ]),
    );
  }
}
