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

