import 'package:flutter/material.dart';

import 'package:finance_loan/frontend/widgets/bottom-sheet-widgets/loan_actions.dart';
import 'package:finance_loan/frontend/widgets/bottom-sheet-widgets/loan_buttons.dart';
import 'package:finance_loan/frontend/widgets/bottom-sheet-widgets/loan_dates.dart';
import 'package:finance_loan/frontend/widgets/bottom-sheet-widgets/loan_header.dart';
import 'package:finance_loan/frontend/widgets/bottom-sheet-widgets/share_button.dart';
import 'package:finance_loan/frontend/widgets/bottom-sheet-widgets/transaction_details.dart';

class BottomSheetContent extends StatelessWidget {
  final String? loanType;
  final String? profilePictureUrl;
  final String? name;
  final String? description;
  final int? loanAmount;
  final DateTime? dateOfLoan;
  final DateTime? paymentDueDate;

  const BottomSheetContent({
    super.key,
    required this.loanType,
    required this.profilePictureUrl,
    required this.name,
    required this.description,
    required this.loanAmount,
    required this.dateOfLoan,
    required this.paymentDueDate,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoanHeader(
              loanType: loanType,
              profilePictureUrl: profilePictureUrl,
              name: name,
              description: description,
            ),
            const SizedBox(height: 10),
            const Divider(thickness: 1),
            LoanActions(
              loanType: loanType!,
              // profilePictureUrl: profilePictureUrl!,
              name: name!,
              loanAmount: loanAmount!,
              dateOfLoan: dateOfLoan!,
              onDelete: () {
                Navigator.pop(context);
              },
            ),
            // SizedBox(height: 30),
            const Divider(thickness: 1),
            ShareButton(),
            TransactionDetails(
                collectedAmount: loanAmount,
                loanAmount: loanAmount,
                remainingAmount: loanAmount),
            const SizedBox(height: 10),
            LoanDates(
              dateOfLoan: dateOfLoan,
              paymentDueDate: paymentDueDate,
            ),
            const SizedBox(height: 10),
            const LoanButtons(),
          ],
        ),
      ),
    );
  }
}
