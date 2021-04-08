import 'package:flutter/material.dart';
import 'package:test_app/components/background.dart';
import '../components/loading_indicator.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Background(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(41.0),
              child: Center(
                child: LoadingIndicator(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
