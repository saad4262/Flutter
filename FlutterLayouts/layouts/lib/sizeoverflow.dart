import 'package:flutter/material.dart';

class OverflowExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SizedOverflowBox Example')),
      body: Center(
        child: Container(
          color: Colors.grey[300],
          width: 200,
          height: 200,
          child: SizedOverflowBox(
            size: Size(100, 100), // this is the layout size it takes
            child: Container(
              width: 150, // child is larger than the size
              height: 150,
              color: Colors.blue,
              child: Center(child: Text("Overflows!")),
            ),
          ),
        ),
      ),
    );
  }
}