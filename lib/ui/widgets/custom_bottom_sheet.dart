import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:staylit/widgets/custom_button.dart';
import 'package:staylit/widgets/custom_drop_down_button.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({
    super.key,
  });

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  String? selectedDate, selectedTime, selectedFloor, selectedRoom;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Book',
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            'Book your service',
            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
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
                      DateTime dateTime =
                          DateTime(1, 1, 1, pickedTime.hour, pickedTime.minute);
                      selectedTime = DateFormat(
                        'hh:mm a',
                      ).format(dateTime);
                    }
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomDropDownButton(
                  hintText: 'Select Floor',
                  selectedValue: selectedFloor,
                  dropDownMenuItem: const [
                    DropdownMenuItem(
                      value: 'floor1',
                      child: Text(
                        'Floor 1',
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'floor2',
                      child: Text(
                        'Floor 2',
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'floor3',
                      child: Text(
                        'Floor 3',
                      ),
                    ),
                    DropdownMenuItem(
                      value: 'floor4',
                      child: Text(
                        'Floor 4',
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    selectedFloor = value;
                    setState(() {});
                  },
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: CustomDropDownButton(
                  hintText: 'Select Room',
                  selectedValue: selectedRoom,
                  dropDownMenuItem: const [
                    DropdownMenuItem(
                      value: '10',
                      child: Text(
                        '10',
                      ),
                    ),
                    DropdownMenuItem(
                      value: '11',
                      child: Text(
                        '11',
                      ),
                    ),
                    DropdownMenuItem(
                      value: '12',
                      child: Text(
                        '12',
                      ),
                    ),
                    DropdownMenuItem(
                      value: '13',
                      child: Text(
                        '13',
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    selectedRoom = value;
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            onTap: () {},
            label: 'Book Now',
          ),
        ],
      ),
    );
  }
}
