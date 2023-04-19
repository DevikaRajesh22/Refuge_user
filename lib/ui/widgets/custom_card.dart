import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final Function()? onPressed;
  final Color? color;
  const CustomCard({
    super.key,
    required this.child,
    this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(30),
      elevation: 0,
      color: color ?? Colors.blue[50],
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onPressed,
        child: child,
      ),
    );
  }
}
