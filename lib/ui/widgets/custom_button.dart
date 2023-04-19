import 'package:flutter/material.dart';

import 'custom_card.dart';

class CustomButton extends StatelessWidget {
  final Function() onPressed;
  final String label;
  final Color? color, labelColor;
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.color,
    this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onPressed: onPressed,
      color: color ?? Colors.blue[900],
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: labelColor ?? Colors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
