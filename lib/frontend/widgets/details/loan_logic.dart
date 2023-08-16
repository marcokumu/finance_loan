import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoanDetailsLogic {
  static void showDeleteConfirmationDialog(
    BuildContext context,
    String userId,
    String documentId,
  ) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Loan'),
          content: const Text('Are you sure you want to delete this loan?'),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                deleteLoan(userId, documentId);
                Navigator.pop(context); // Close the confirmation dialog
                Navigator.pop(context); // Navigate back to the previous page
                // Alternatively, you can show a SnackBar here to indicate successful deletion
                EasyLoading.showSuccess('Loan deleted successfully!');
              },
            ),
          ],
        );
      },
    );
  }

  static void deleteLoan(String userId, String documentId) {
    final loanDocRef = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('loans')
        .doc(documentId);

    loanDocRef.delete().then((value) {
      // Deletion successful
    }).catchError((error) {
      // Error occurred during deletion
    });
  }
}
