import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  Background();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/the_background.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
