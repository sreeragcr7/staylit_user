import 'package:flutter/material.dart';

import 'custom_card.dart';

class CustomButton extends StatelessWidget {
  final Function() onPressed;
  final String label;
  final Color? color, labelColor;
  final bool isLoading;
  final MainAxisSize mainAxisSize;
  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.label,
      this.color,
      this.labelColor,
      this.isLoading = false,
      this.mainAxisSize = MainAxisSize.max});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onPressed: onPressed,
      color: color ?? Colors.blueAccent,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: mainAxisSize,
          children: [
            isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 1.5,
                      color: Colors.white,
                    ),
                  )
                : Text(
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
