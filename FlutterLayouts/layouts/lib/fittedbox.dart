import 'package:flutter/material.dart';

class FittedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FittedBox Example")),
      body: Center(
        child: Container(
          color: Colors.blue[100],
          width: 200,
          height: 100,
          child: FittedBox(
            fit: BoxFit.contain, // Try BoxFit.cover, BoxFit.fill, etc.
            child: Text(
              'This is a very large text! FDN DSNDFSKNLDFKMLDFAKM',
              style: TextStyle(fontSize: 50, color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
