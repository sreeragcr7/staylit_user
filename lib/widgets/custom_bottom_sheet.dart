import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:staylit/widgets/custom_button.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({
    super.key,
  });

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  String? selectedDate, selectedTime;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Book Now',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  label: selectedDate ?? 'Select Date',
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100, 12, 12),
                    );

                    if (pickedDate != null) {
                      selectedDate =
                          DateFormat('dd/MM/yyyy').format(pickedDate);
                      setState(() {});
                    }
                  },
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: CustomButton(
                  label: selectedTime ?? 'Select Time',
                  onTap: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (pickedTime != null) {
                      // DateTime dateTime = DateTime.parse(formattedString)
                      // selectedTime = DateFormat(
                      //   'hh:mm a',
                      // ).format(pickedTime);
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
