import 'dart:async';

import 'package:finance_loan/frontend/widgets/home-widgets/loan_card.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:rxdart/rxdart.dart';

class LoanCardsList extends StatefulWidget {
  final String userId; // The current user's ID
  final String loanType; // The type of loan to display

  const LoanCardsList({required this.userId, required this.loanType, Key? key})
      : super(key: key);

  @override
  _LoanCardsListState createState() => _LoanCardsListState();
}

class _LoanCardsListState extends State<LoanCardsList>
    with AutomaticKeepAliveClientMixin {
  late BehaviorSubject<QuerySnapshot> _snapshotSubject;
  late StreamSubscription<QuerySnapshot> _subscription;
  bool _isLoading = true; // Flag to track initial loading

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _snapshotSubject = BehaviorSubject<QuerySnapshot>();
    _subscribeToStream();
  }

  @override
  void dispose() {
    _snapshotSubject.close();
    _subscription.cancel();
    super.dispose();
  }

  void _subscribeToStream() {
    final stream = FirebaseFirestore.instance
        .collection('users')
        .doc(widget.userId)
        .collection('loans')
        .snapshots();

    _subscription = stream.listen((snapshot) {
      _snapshotSubject.add(snapshot);
      if (_isLoading) {
        // Delay hiding the loading indicator to give a smooth experience
        Timer(const Duration(milliseconds: 500), () {
          if (mounted) {
            // Check if the widget is still mounted before updating the state
            setState(() {
              _isLoading = false;
            });
          }
        });
      }
    }, onError: (error) {
      // Will handle stream error here
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Must call super.build(context) in build method

    if (_isLoading) {
      // Show the circular indicator until the initial data is loaded
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return StreamBuilder<QuerySnapshot>(
      stream:
          _snapshotSubject.stream, // Use the cached stream from BehaviorSubject
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          // Return an empty container if still waiting for data
          return Container();
        }

        // Retrieve the loan documents from the snapshot
        final List<DocumentSnapshot> loanDocs = snapshot.data!.docs;

        // Separate loanDocs based on the loanType provided to the widget
        final filteredLoanDocs = loanDocs
            .where((doc) => doc['loanType'] == widget.loanType)
            .toList();

        return AnimationLimiter(
          child: ListView.builder(
            itemCount: filteredLoanDocs.length,
            itemBuilder: (context, index) {
              final loanDocument = filteredLoanDocs[index];
              final loanData =
                  filteredLoanDocs[index].data() as Map<String, dynamic>;
              final documentId = loanDocument.id;

              // Perform explicit null checks and handle null values
              final fullName = loanData['fullName'] as String?;
              final loanType = loanData['loanType'] as String?;
              final loanAmount = loanData['loanAmount'] as double?;
              final description = loanData['description'] as String?;
              final email = loanData['email'] as String?;
              final phoneNumber = loanData['phoneNumber'] as String?;
              final loanDate = loanData['loanDate'] as Timestamp?;
              final dueDate = loanData['dueDate'] as Timestamp?;

              if (fullName == null ||
                  loanType == null ||
                  loanAmount == null ||
                  description == null ||
                  loanDate == null ||
                  dueDate == null ||
                  phoneNumber == null ||
                  email == null ||
                  loanData['imageUrl'] == null) {
                // Handle the case where some required data is null
                return Container(); // You can return an empty container or an error widget here
              }
