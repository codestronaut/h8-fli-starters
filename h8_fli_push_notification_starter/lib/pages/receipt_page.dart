import 'package:flutter/material.dart';

class ReceiptPage extends StatelessWidget {
  const ReceiptPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Icon(
            Icons.receipt_outlined,
            color: Colors.brown.shade300,
            size: 64.0,
          ),
        ),
      ),
    );
  }
}
