import 'package:flutter/material.dart';
import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import './guns.dart';
import './home.dart';

void main() => runApp(FluidNavBarDemo());

class FluidNavBarDemo extends StatefulWidget {
  FluidNavBarDemo({required Key key}) : super(key: key);

  @override
  _FluidNavBarDemoState createState() => _FluidNavBarDemoState();
}

class _FluidNavBarDemoState extends State<FluidNavBarDemo> {
  Widget _child;

  @override
  void initState() {
    super.initState();
    _child = Home();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("ShotPlace"),
      ),
      backgroundColor: Color(0XFF75B7E1),
      extendBody: true,
      body: _child,
      bottomNavigationBar: FluidNavBar(
        icons: [
          FluidNavBarIcon(
              iconPath: 'assets/shot.svg',
              backgroundColor: Color(0xFFEC4143),
              extras: {'label': "ShotPlace"}),
          FluidNavBarIcon(
              iconPath: 'assets/guns.svg',
              backgroundColor: Color(0xFF4285F4),
              extras: {'label': "Guns"}),
        ],
        onChange: _handleNavigationBarChange,
        style: FluidNavBarStyle(iconUnselectedForegroundColor: Colors.white),
        scaleFactor: 1.5,
        itemBuilder: (icon, item) => Semantics(
          label: icon.extras["label"],
          child: item,
        ),
      ),
    ));
  }

  void _handleNavigationBarChange(int index) {
    setState(() {
      switch (index) {
        case 0:
          _child = Home();
          break;
        case 1:
          _child = Guns();
          break;
        default:
      }
    });
  }
}
