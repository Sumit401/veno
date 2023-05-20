import 'package:assignment_wingman/reusableWidgets/appBar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: const Center(
        child: Text("HomeScreen",style: TextStyle(fontSize: 40)),
      ),
    );
  }
}
