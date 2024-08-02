import 'package:flutter/material.dart';

class WrongRoute extends StatelessWidget {
  const WrongRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Something went wrong!")),
    );
  }
}
