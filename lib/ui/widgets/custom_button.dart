import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Function() onTap;
  final Color? riskLevelColor;
  final bool isNormalButton;
  const CustomButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.riskLevelColor,
    this.isNormalButton = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
        color: const Color(0xFF0077B6),
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: isNormalButton
              ? Center(
                  child: Text(
                    label,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                )
              : Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: riskLevelColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      label,
                      style: Theme.of(context).textTheme.button!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
