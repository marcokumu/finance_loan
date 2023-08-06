import 'package:flutter/material.dart';
import 'package:finance_loan/frontend/widgets/create-loan/create_new_loan.dart';

class MyFloatingActionButton extends StatefulWidget {
  const MyFloatingActionButton({Key? key}) : super(key: key);

  @override
  _MyFloatingActionButtonState createState() => _MyFloatingActionButtonState();
}

class _MyFloatingActionButtonState extends State<MyFloatingActionButton> {
  void _showBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('New User'),
                onTap: () {
                  // Do something for option 1
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewLoanExample(),
                    ),
                  );
                  // Close the bottom sheet
                  // Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.contacts),
                title: const Text('Add from Contact'),
                onTap: () {
                  // Do something for option 2
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewLoanExample(),
                    ),
                  );
                  // Close the bottom sheet
                  // Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: _showBottomSheet,
      child: const Icon(Icons.add),
    );
  }
}
