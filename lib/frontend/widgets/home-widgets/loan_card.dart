import 'package:finance_loan/frontend/widgets/bottom-sheet-widgets/bottom_sheet_container.dart';
import 'dart:math';
import 'package:finance_loan/frontend/widgets/details/loan_details.dart';
import 'package:finance_loan/frontend/widgets/details/loan_details_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LoanCard extends StatefulWidget {
  final String userId;
  final String fullName;
  final String description;
  final String phoneNumber;
  final String email;
  final String profilePic;
  final String loanType;
  final double amount;
  final DateTime loanDate;
  final double loanAmount;
  final DateTime date;
  final DateTime dueDate;
  final String documentId;

  const LoanCard({
    Key? key,
    required this.documentId,
    required this.fullName,
    required this.description,
    required this.email,
    required this.phoneNumber,
    required this.profilePic,
    required this.loanDate,
    required this.loanType,
    required this.amount,
    required this.loanAmount,
    required this.date,
    required this.dueDate,
    required this.userId,
  }) : super(key: key);

  @override
  _LoanCardState createState() => _LoanCardState();
}

class _LoanCardState extends State<LoanCard> {
  bool get isLoanDue => widget.dueDate.isBefore(DateTime.now());

  String getFormattedDate(DateTime date) {
    return DateFormat('MMM dd, yyyy').format(date);
  }

  String getFormattedAmount(double amount) {
  String getFormattedAmount(double loanAmount) {
    final formatter = NumberFormat('#,##0.00', 'en_US');
    return formatter.format(amount);
    return formatter.format(loanAmount);
  }
  // ... (other methods and build method)
  

  void _showLoanDetailsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return BottomSheetContent(
          loanType: widget.loanType,
          profilePictureUrl: widget.profilePic,
          name: widget.fullName,
          description: widget.description,
          loanAmount: widget.amount.toInt(),
          dateOfLoan: widget.date,
          paymentDueDate: widget.dueDate,
        );
      },
  void _showLoanDetailsPage(BuildContext context) {
    // Created a LoanDetails object to pass to the LoanDetailsPage
    final loanDetails = LoanDetails(
      fullName: widget.fullName,
      imageUrl: widget.profilePic,
      phoneNumber: widget.phoneNumber,
      email: widget.email,
      loanType: widget.loanType,
      loanAmount: widget.loanAmount,
      createdAt: widget.date,
      dueDate: widget.dueDate,
      loanDate: widget.date,
      description: widget.description,
      userId: widget.userId,
      documentId: widget.documentId,
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoanDetailsPage(loanDetails: loanDetails),
      ),
    );
  }

  // Function to generate a random color
  Color getRandomColor() {
    final random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 34, 40, 77).withOpacity(0.2),
        borderRadius: BorderRadius.circular(30),
        // boxShadow: [
        //   BoxShadow(
        //     color: Color.fromARGB(255, 37, 36, 36).withOpacity(0.5),
        //     spreadRadius: 1,
        //     blurRadius: 3,
        //     offset: const Offset(0, 3),
        //   ),
        // ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Column 1: Profile Picture
          Column(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.3),
                ),
                child: Icon(Icons.person, size: 40, color: Colors.white),
              ),
            ],
          ),
          SizedBox(width: 10),
          // Column 2: Details (Name, Description, Amount)
          Expanded(
            // flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.fullName,
                  style: const TextStyle(
                    letterSpacing: 1,
                    color: Colors.white,
                    fontFamily: 'Roboto-Bold',
                    fontSize: 18,
                    wordSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  widget.description,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color.fromARGB(255, 218, 207, 207),
                    fontFamily: 'Roboto-Regular',
                    fontSize: 15,
                    wordSpacing: 1,
                  ),
                ),
                const SizedBox(height: 5),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: Text(
                        'Ksh. ${getFormattedAmount(widget.amount)}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          // Column 3: Due Date and Details Button
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.warning_amber_rounded,
                color: Colors.red,
              ),
              Text(
                'Due: ${getFormattedDate(widget.dueDate)}',
                style: TextStyle(
                  fontFamily: 'Roboto-Regular',
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(255, 190, 184, 184),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Implement logic to show more info about the debtor/creditor
                    _showLoanDetailsBottomSheet(context);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                  ),
                  child: const Text('Details',
                      style: TextStyle(
                          fontSize: 18, fontFamily: 'Roboto-Regular')),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
