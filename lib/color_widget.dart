import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorWidget extends StatelessWidget {
  final Widget child;

  const ColorWidget({required this.child});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue.shade900, Colors.lightBlue.shade500])),
        child: child);
  }
}
