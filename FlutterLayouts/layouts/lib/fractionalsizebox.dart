import 'package:flutter/material.dart';

class FractionExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FractionallySizedBox Example')),
      body: Center(
        child: Container(
          color: Colors.grey[300],
          height: 200,
          width: 200,
          child: FractionallySizedBox(
            widthFactor: 0.5, // 50% of parent width (i.e., 100)
            heightFactor: 0.5, // 50% of parent height (i.e., 100)
            child: Container(
              color: Colors.blue,
              child: Center(child: Text("50% size")),
            ),
          ),
        ),
      ),
    );
  }
}
