import 'package:flutter/material.dart';

class CustomRadioButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Function() onPressed;
  const CustomRadioButton({
    Key? key,
    required this.label,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          isSelected ? Icons.check_circle_rounded : Icons.circle_outlined,
          color: isSelected ? Colors.blue : Colors.grey,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(label),
      ],
    );
  }
}
