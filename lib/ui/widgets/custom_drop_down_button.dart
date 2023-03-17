import 'package:flutter/material.dart';

class CustomDropDownButton extends StatelessWidget {
  final List<DropdownMenuItem> dropDownMenuItem;
  final Function(String value) onChanged;
  final String hintText;
  final String? selectedValue;
  const CustomDropDownButton({
    Key? key,
    required this.dropDownMenuItem,
    required this.onChanged,
    required this.hintText,
    this.selectedValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: DropdownButton(
          borderRadius: BorderRadius.circular(20),
          elevation: 0,
          value: selectedValue,
          dropdownColor: Colors.white,
          underline: const SizedBox(),
          iconSize: 26,
          iconEnabledColor: Colors.black,
          isExpanded: true,
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
          hint: Text(
            hintText,
          ),
          items: dropDownMenuItem,
          onChanged: (value) {
            onChanged(value);
          },
        ),
      ),
    );
  }
}
