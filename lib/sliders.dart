import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'calculate_model.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class Sliders{
  static Widget getLoanSlider(CalculateModel calculateModel) {
    return SfSliderTheme(
      data: SfSliderThemeData(
          thumbRadius: 11,
          activeLabelStyle: TextStyle(
              fontSize: 10,
              color: Colors.grey.shade400,
              fontWeight: FontWeight.w600),
          inactiveLabelStyle: TextStyle(
              fontSize: 10,
              color: Colors.grey.shade400,
              fontWeight: FontWeight.w600),
          inactiveDividerColor: Colors.grey.shade700,
          activeDividerColor: Colors.green),
      child: SfSlider(
        thumbIcon: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(1.5),
            child: Image.asset("assets/icon.png"),
          ),
        ),
        minorTicksPerInterval: 1,
        stepSize: 1,
        activeColor: Colors.pink.shade600,
        inactiveColor: Colors.grey.shade400,
        min: 0.0,
        max: 100.0,
        interval: 25,
        showLabels: true,
        showTicks: true,
        value: calculateModel.loanValue,
        onChanged: (dynamic newValue) {
          if (newValue < 1) {
            return;
          }
          calculateModel.loanValue =
              num.parse((newValue as double).toStringAsFixed(1)).toDouble();
        },
      ),
    );
  }

  static Widget getTenureSlider(CalculateModel calculateModel) {
    return SfSliderTheme(
      data: SfSliderThemeData(
          thumbRadius: 11,
          activeLabelStyle: TextStyle(
              fontSize: 10,
              color: Colors.grey.shade400,
              fontWeight: FontWeight.w500),
          inactiveLabelStyle: TextStyle(
              fontSize: 10,
              color: Colors.grey.shade400,
              fontWeight: FontWeight.w500),
          inactiveDividerColor: Colors.grey.shade100,
          activeDividerColor: Colors.green),
      child: SfSlider(
        thumbIcon: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(1.5),
            child: Image.asset("assets/icon.png"),
          ),
        ),
        minorTicksPerInterval: 1,
        stepSize: 1,
        activeColor: Colors.pink.shade600,
        inactiveColor: Colors.grey.shade400,
        min: 0.0,
        max: 30.0,
        interval: 5,
        showLabels: true,
        showTicks: true,
        value: calculateModel.tenureValue,
        onChanged: (dynamic newValue) {
          if (newValue < 1) {
            return;
          }
          calculateModel.tenureValue = (newValue as double).truncateToDouble();
        },
      ),
    );
  }

  static Widget getInterestSlider(CalculateModel calculateModel) {
    return SfSliderTheme(
      data: SfSliderThemeData(
          thumbRadius: 11,
          activeLabelStyle: TextStyle(
              fontSize: 10,
              color: Colors.grey.shade400,
              fontWeight: FontWeight.w500),
          inactiveLabelStyle: TextStyle(
              fontSize: 10,
              color: Colors.grey.shade400,
              fontWeight: FontWeight.w500),
          inactiveDividerColor: Colors.grey.shade600,
          activeDividerColor: Colors.green),
      child: SfSlider(
        thumbIcon: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(1.5),
            child: Image.asset("assets/icon.png"),
          ),
        ),
        minorTicksPerInterval: 1,
        stepSize: 0.1,
        activeColor: Colors.pink.shade600,
        inactiveColor: Colors.grey.shade400,
        min: 0.0,
        max: 20,
        interval: 5,
        showLabels: true,
        showTicks: true,
        value: calculateModel.interestRate,
        onChanged: (dynamic newValue) {
          if (newValue < 1) {
            return;
          }
          calculateModel.interestRate =
              num.parse((newValue as double).toStringAsFixed(1)).toDouble();
        },
      ),
    );
  }
}