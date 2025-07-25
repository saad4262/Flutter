import 'package:flutter/material.dart';

class LimitedBoxExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LimitedBox Example')),
      body: Column(
        children: [
          Text('Above box'),
          LimitedBox(
            maxHeight: 100,
            child: Container(
              color: Colors.blue,
              height: 200, // Will be limited to 100
              child: Center(child: Text('Limited Height')),
            ),
          ),
          Text('Below box'),
        ],
      ),
    );
  }
}