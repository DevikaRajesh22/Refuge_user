import 'package:flutter/material.dart';

class NoGlowBehaviorScroll extends StatelessWidget {
  final Widget child;

  const NoGlowBehaviorScroll({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoGlowBehavior(),
      child: child,
    );
  }
}

//to disable the scroll glow effect
class NoGlowBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
