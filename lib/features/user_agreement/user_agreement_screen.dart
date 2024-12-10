import 'package:flutter/material.dart';
import 'package:tabletap/constants/text_constants.dart';

class UserAgreementScreen extends StatelessWidget {
  const UserAgreementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Center(child: Text(TextConstants.userAgreementText)),
      )),
    );
  }
}
