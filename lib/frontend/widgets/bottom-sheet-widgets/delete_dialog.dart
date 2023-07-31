import 'package:flutter/material.dart';

class DeleteDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onDelete;

  const DeleteDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Roboto-Bold',
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        content,
        style: const TextStyle(
          fontFamily: 'Roboto',
          fontSize: 18,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Close the dialog
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context); // Close the dialog
            onDelete(); // Call the delete function
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.red,
          ),
          child: const Text('Delete'),
        ),
      ],
    );
  }
}
