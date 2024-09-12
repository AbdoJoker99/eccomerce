import 'package:flutter/material.dart';

class Favoritetab extends StatelessWidget {
  const Favoritetab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FavouitTab",
          style: TextStyle(color: Colors.blue),
        ),
      ),
    );
  }
}
