import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DueDatePicker extends StatelessWidget {
  final DateTime? selectedDate;
  final Function(DateTime?) onDateSelected;

  const DueDatePicker({super.key, 
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'DUE DATE',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: () {
            _selectDueDate(context);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              // border: Border.all(),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              selectedDate != null
                  ? DateFormat.yMMMd().format(selectedDate!)
                  : 'Select Due Date',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Define the function to select the due date
  void _selectDueDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (pickedDate != null) {
      onDateSelected(pickedDate);
    }
  }
}
