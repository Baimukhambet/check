import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool _isProcessing = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mockPaymentProcessing();
  }

  void _mockPaymentProcessing() {
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isProcessing = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !_isProcessing ? AppBar() : null,
      body: Center(
        child: _isProcessing ? CircularProgressIndicator() : Text("Оплачено!"),
      ),
    );
  }
}
