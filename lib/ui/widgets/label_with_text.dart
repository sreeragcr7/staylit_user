import 'package:flutter/material.dart';

class LabelWithText extends StatelessWidget {
  final String label, text;
  final CrossAxisAlignment crossAxisAlignment;
  const LabelWithText({
    super.key,
    required this.label,
    required this.text,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Colors.grey[600],
                fontWeight: FontWeight.w400,
              ),
        ),
        const SizedBox(
          height: 3,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}
