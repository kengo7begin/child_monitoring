import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:new_project/pages/live_camera_screen.dart';
import 'package:new_project/pages/photo_history_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _currentPageIndex = 0;

  final _pages = <Widget>[const LiveCameraScreen(), const PhotoHistoryScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        selectedIndex: _currentPageIndex,
        animationDuration: const Duration(seconds: 10),
        elevation: 10,
        height: 100,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: const <Widget>[
          NavigationDestination(icon: Icon(Icons.camera_alt), label: 'camera'),
          NavigationDestination(icon: Icon(Icons.photo_album), label: 'photos'),
        ],
      ),
      body: _pages[_currentPageIndex],
    );
  }
}
