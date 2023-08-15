import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:quickalert/quickalert.dart';

class EditLoan extends StatefulWidget {
  final String userId;
  final String documentId;
  final String? fullName;
  final String? phoneNumber;
  final String? email;
  final String? loanType;
  final double? loanAmount;
  final String? description;
  final DateTime? loanDate;
  final DateTime? dueDate;
  final XFile? image;

  const EditLoan({
    Key? key,
    required this.userId,
    this.fullName,
    this.phoneNumber,
    this.email,
    this.loanType,
    this.loanAmount,
    this.description,
    this.loanDate,
    this.dueDate,
    this.image,
    required this.documentId,
  }) : super(key: key);

  @override
  _EditLoanState createState() => _EditLoanState();
}

class _EditLoanState extends State<EditLoan> {
  // Declare the variables to store the user input
  String? _fullName;
  String? _phoneNumber;
  String? _email;
  String? _loanType;
  double? _loanAmount;
  String? _description;
  DateTime? _loanDate;
  DateTime? _dueDate;

  XFile? _image;

  // Declare the controllers for the text fields
  final _fullNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _emailController = TextEditingController();
  final _loanAmountController = TextEditingController();
  final _descriptionController = TextEditingController();

  // Declare the form key for validation
  final _formKey = GlobalKey<FormState>();

  // Declare the image picker
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    // Initialize the controllers with existing data
    _fullNameController.text = widget.fullName ?? '';
    _phoneNumberController.text = widget.phoneNumber ?? '';
    _emailController.text = widget.email ?? '';

    _descriptionController.text = widget.description ?? '';
    _loanAmountController.text = widget.loanAmount?.toString() ?? '';
    _loanType = widget.loanType ?? 'Lend';
    _loanDate = widget.loanDate;
    _dueDate = widget.dueDate;
    _image = widget.image;
  }

  Future<void> updateLoanData(
      String documentId, Map<String, dynamic> data) async {
    try {
      // Get a reference to the user's document in the 'users' collection
      final userDocRef =
          FirebaseFirestore.instance.collection('users').doc(widget.userId);

      // Get a reference to the specific loan document in the 'loans' subcollection
      final loanDocRef = userDocRef.collection('loans').doc(documentId);

      // Update the data in Firestore
      await loanDocRef.update(
        data,
      );

      EasyLoading.showSuccess('Data updated successfully!');

      // Print a message to the console (optional)
      print('Data updated successfully!');
    } catch (e) {
      QuickAlert.show(
        context: context,
        type: QuickAlertType.error,
        text: 'Error updating data. Please try again.',
      );

      // Print the error message to the console (optional)
      print('Error updating data: $e');
    }
  }
