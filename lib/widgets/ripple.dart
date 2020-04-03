import 'package:flutter/material.dart';

class Ripple extends StatelessWidget {
  final Widget child;
  final GestureTapCallback onTap;

  Ripple({@required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Ink(
        child: InkWell(
          onTap: onTap,
          child: child,
        ),
      ),
    );
  }
}
