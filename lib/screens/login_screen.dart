import 'package:flutter/material.dart';
import 'package:my_plant/constants.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
        backgroundColor: Constants.primaryColor,
      ),
    );
  }
}
