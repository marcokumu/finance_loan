import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_loan/frontend/trends/graph.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:finance_loan/frontend/trends/pie_chart.dart'; // Import the radial bar chart widget

class Transactions extends StatefulWidget {
  const Transactions({Key? key}) : super(key: key);

  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String userId;

  @override
  void initState() {
    super.initState();
    fetchUserId();
  }

  Future<void> fetchUserId() async {
    final user = _auth.currentUser;
    if (user != null) {
      setState(() {
        userId = user.uid;
      });
    } else {
      // Handle case when the user is not logged in
      // For now, you can show an error or redirect to the login screen
      print('User not logged in.');
    }
  }

  Future<List<TransactionData>> _getDataFromFirebase() async {
    final userDocRef =
        FirebaseFirestore.instance.collection('users').doc(userId);
    final loansSnapshot = await userDocRef.collection('loans').get();

    Map<String, double> monthToBorrowMap = {};
    Map<String, double> monthToLendMap = {};

    // Initialize the maps with all 12 months
    for (int month = 1; month <= 12; month++) {
      monthToBorrowMap['${DateTime.now().year}-$month'] = 0.0;
      monthToLendMap['${DateTime.now().year}-$month'] = 0.0;
    }

    for (var loanDoc in loansSnapshot.docs) {
      final loanData = loanDoc.data();
      final loanDate = loanData['createdAt']
          as Timestamp; 
      final lend = loanData['loanType'] == 'Lend'
          ? loanData['loanAmount'] as double
          : 0.0;
      final borrow = loanData['loanType'] == 'Borrow'
          ? loanData['loanAmount'] as double
          : 0.0;

      final month = '${loanDate.toDate().year}-${loanDate.toDate().month}';

      monthToBorrowMap[month] = monthToBorrowMap[month]! + borrow;
      monthToLendMap[month] = monthToLendMap[month]! + lend;
    }

    List<TransactionData> data = [];
    monthToBorrowMap.forEach((month, borrow) {
      final lend = monthToLendMap[month] ?? 0;
      data.add(TransactionData(month: month, borrow: borrow, lend: lend));
    });

    return data;
  }

 @override
Widget build(BuildContext context) {
  if (userId.isEmpty) {
    // Show loading or error state while fetching the user ID
    return const Center(child: CircularProgressIndicator());
  }

  return FutureBuilder<List<TransactionData>>(
    future: _getDataFromFirebase(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return Center(child: Text('Error: ${snapshot.error}'));
      } else {
        // Calculate total amount borrowed and total amount lent
        double totalBorrow = 0;
        double totalLend = 0;
        for (var data in snapshot.data!) {
          totalBorrow += data.borrow;
          totalLend += data.lend;
        }

        return SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Transaction Summary',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  child: Card(child: BarGraph(data: snapshot.data ?? [])),
                ),
                Container(
                  padding: const EdgeInsets.all(12),
                  child: Card(
                    child:
                        RadialBarChart(totalBorrow: totalBorrow, totalLend: totalLend),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    },
  );
}}
