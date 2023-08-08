import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import the intl package

class DateTileBuilder extends StatefulWidget {
  const DateTileBuilder({Key? key, required String title, required Future<void> Function(BuildContext context) onTap, DateTime? date}) : super(key: key);

  @override
  _DateTileBuilderState createState() => _DateTileBuilderState();
}

class _DateTileBuilderState extends State<DateTileBuilder> {
  DateTime? dateOfLoan; // Declare a state variable for the date of loan
  DateTime? paymentDueDate; // Declare a state variable for the payment due date

  Future<void> selectDateOfLoan(BuildContext context, DateTime? date) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != date) {
      setState(() {
        dateOfLoan = picked; // Update the state variable
      });
    }
  }

  Future<void> selectPaymentDueDate(
      BuildContext context, DateTime? date) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != date) {
      setState(() {
        paymentDueDate = picked; // Update the state variable
      });
    }
  }

  Widget buildDateTile(
    BuildContext context, // Pass the context as a parameter
    String title,
    DateTime? date, // Pass the date as a parameter
    Function(BuildContext, DateTime?)
        onTap, // Pass the onTap function as a parameter
  ) {
    return Expanded(
      child: ListTile(
        leading: const Icon(Icons.calendar_today),
        title: Text(
          date == null
              ? title
              : '$title: ${DateFormat('dd-MM-yyyy').format(date)}', // Use ternary operator and DateFormat
        ),
        onTap: () => onTap(context, date), // Pass the date as a parameter
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildDateTile(context, 'Date of Loan', dateOfLoan,
            selectDateOfLoan), // Pass the state variable and the function
        buildDateTile(context, 'Payment Due Date', paymentDueDate,
            selectPaymentDueDate), // Pass the state variable and the function
      ],
    );
  }
}
