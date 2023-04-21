import 'package:flutter/material.dart';

class LabelWithText extends StatelessWidget {
  final CrossAxisAlignment alignment;
  final String label, text;
  const LabelWithText({
    super.key,
    this.alignment = CrossAxisAlignment.start,
    required this.label,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black45,
              ),
        ),
        const SizedBox(height: 2.5),
        Text(
          text,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
        ),
      ],
    );
  }
}
