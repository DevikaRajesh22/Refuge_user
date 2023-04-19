import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Function() onPressed;
  final IconData iconData;
  final Color? color;
  const CustomIconButton({
    super.key,
    required this.onPressed,
    required this.iconData,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Icon(
          iconData,
          color: color ?? Colors.blue[900],
        ),
      ),
    );
  }
}
