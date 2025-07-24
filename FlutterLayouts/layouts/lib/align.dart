import 'package:flutter/material.dart';

class AlignExample extends StatelessWidget {
  const AlignExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Align Widget Example")),
      body: Container(
        height: 300,
        width: double.infinity,
        color: Colors.pink[900],
        child: Align(
          alignment: Alignment.center, // 👈 Position of the child
          child: Container(
            height: 60,
            width: 60,
            color: Colors.green,
            child: const Center(
              child: Text("Box", style: TextStyle(color: Colors.white)),
            ),
          ),
        ),
      ),
    );
  }
}
