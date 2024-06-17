import 'dart:convert';

import 'package:http/http.dart' as http;

class PaymentService {
  static final shared = PaymentService._();

  PaymentService._();

  final String _url = 'https://gateway.pay2ola.kz/transactions/payments';
  final String _username = 'your_username'; // Replace with your username
  final String _password = 'your_password'; // Replace with your password

  Future<http.Response> makePayment() async {
    final String basicAuth =
        'Basic ${base64Encode(utf8.encode('$_username:$_password'))}';
    final Map<String, dynamic> requestBody = {
      "request": {
        "amount": 100,
        "currency": "USD",
        "description": "Test transaction",
        "test": true,
        "credit_card": {
          "number": "4200000000000000",
          "holder": "John Doe",
          "exp_month": "05",
          "exp_year": "2026"
        }
      }
    };

    final response = await http.post(
      Uri.parse(_url),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': basicAuth,
      },
      body: jsonEncode(requestBody),
    );

    return response;
  }
}
