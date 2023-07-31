import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_loan/frontend/widgets/floating-action-button/floating_action_button.dart';
import 'package:finance_loan/frontend/widgets/home-widgets/loan_data.dart';
import 'package:finance_loan/frontend/widgets/home-widgets/tab_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.userId}) : super(key: key);
  final String userId; // The current user's ID

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabTitles = ['Owed To Me', 'Borrowed'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
    getCurrentUser();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {}); // Rebuild the widget to update the AppBar title
  }

  late String userId; //Declare variable to store the user ID

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void getCurrentUser() {
    if (!_auth.currentUser!.isAnonymous) {
      final User user = _auth.currentUser!;
      userId = user.uid;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabWidget(
              tabController: _tabController,
              tabTitles: _tabTitles,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _getTabContent('Lend', userId),
                  _getTabContent('Borrow', userId),
                ],
              ),
            ),
            const MyFloatingActionButton(),
          ],
        ),
      ),
    );
  }

  Widget _getTabContent(String loanType, String userId) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('loans')
          .where('loanType', isEqualTo: loanType)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        final loanDocs = snapshot.data?.docs ?? [];
        if (loanDocs.isEmpty) {
          return EmptyLoanMessage(); // Show the message widget when loanDocs is empty
        }

        return LoanCardsList(userId: userId, loanType: loanType);
      },
    );
  }
}

class EmptyLoanMessage extends StatelessWidget {
  const EmptyLoanMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'No loan details found.\nAdd a new loan by tapping the + button below.',
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
