import 'package:flutter/material.dart';
import 'package:mypoj/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int days = 30;
    String name  = "codepur";
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalogue App"),
      ),
      body: Center(
        child: Container(
            child: Text("Welcome to $days days of flutter with $name")
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
