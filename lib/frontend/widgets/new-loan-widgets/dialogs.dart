import 'package:flutter/material.dart';

class DialogUtils {
  static void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0), // Changed shape
          ),
          title: const Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green), // Added icon
              SizedBox(width: 8),
              Text('Success',
                  style: TextStyle(color: Colors.green)), // Changed color
            ],
          ),
          content: const Text('Data Saved Successfully'),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Changed color
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  static void showErrorDialog(BuildContext context, String errorMessage) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0), // Changed shape
          ),
          title: const Row(
            children: [
              Icon(Icons.error, color: Colors.red), // Added icon
              SizedBox(width: 8),
              Text('Error',
                  style: TextStyle(color: Colors.red)), // Changed color
            ],
          ),
          content: Text(errorMessage),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red, // Changed color
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'OK',
              ),
            ),
          ],
        );
      },
    );
  }
}
