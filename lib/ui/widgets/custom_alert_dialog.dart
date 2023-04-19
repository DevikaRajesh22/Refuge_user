import 'package:flutter/material.dart';

import 'custom_button.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title, message;
  final Widget? content;
  final String? primaryButtonLabel, secondaryButtonLabel;
  final Function()? primaryOnPressed, secondaryOnPressed;
  final bool isLoading;
  final double width;
  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.message,
    this.primaryButtonLabel,
    this.secondaryButtonLabel,
    this.primaryOnPressed,
    this.secondaryOnPressed,
    this.content,
    this.width = 350,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        width: width,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.close,
                          color: Colors.black26,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    message,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  content != null
                      ? const Divider(
                          thickness: 1,
                          height: 20,
                        )
                      : const SizedBox(height: 15),
                  content ?? const SizedBox(),
                  content != null
                      ? const Divider(
                          thickness: 1,
                          height: 20,
                        )
                      : const SizedBox(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      secondaryButtonLabel != null
                          ? Expanded(
                              child: CustomButton(
                                color: Colors.blue[50],
                                labelColor: Colors.blue[900],
                                label: secondaryButtonLabel ?? '',
                                onPressed: secondaryOnPressed ??
                                    () {
                                      Navigator.pop(context);
                                    },
                              ),
                            )
                          : const SizedBox(),
                      SizedBox(
                          width: secondaryButtonLabel != null &&
                                  primaryButtonLabel != null
                              ? 10
                              : 0),
                      primaryButtonLabel != null
                          ? Expanded(
                              child: CustomButton(
                                label: primaryButtonLabel ?? '',
                                labelColor: Colors.white,
                                onPressed: primaryOnPressed ??
                                    () {
                                      Navigator.pop(context);
                                    },
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ],
              ),
              isLoading
                  ? Material(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(20),
                      elevation: 10,
                      child: const Padding(
                        padding: EdgeInsets.all(100.0),
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
