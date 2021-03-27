import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../constants.dart';

class ProgressIndicator extends StatelessWidget {
  ProgressIndicator({this.currentStep});

  final int currentStep;

  @override
  Widget build(BuildContext context) {
    return StepProgressIndicator(
      totalSteps: 3,
      currentStep: currentStep,
      size: 8,
      padding: 0,
      selectedColor: kPurpleThemeColour,
      unselectedColor: Color(0x256200EE),
      roundedEdges: Radius.circular(10),
    );
  }
}
