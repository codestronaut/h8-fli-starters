import 'package:flutter/material.dart';

class TransactionHistoryPage extends StatelessWidget {
  const TransactionHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Icon(
            Icons.history_outlined,
            color: Colors.brown.shade300,
            size: 64.0,
          ),
        ),
      ),
    );
  }
}
