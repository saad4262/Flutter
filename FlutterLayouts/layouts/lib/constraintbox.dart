import 'package:flutter/material.dart';

class ConstrainedBoxExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ConstrainedBox Example')),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 50, maxHeight: 100),
          child: Container(
            color: Colors.orange,
            child: Text(
              'This is a very long message that might overflow the box',
              style: TextStyle(color: Colors.white),
              overflow: TextOverflow.ellipsis, // show ...
            ),
          ),
        ),

        // child: ConstrainedBox(
        //   constraints: BoxConstraints(
        //     minWidth: 100,   // 🔒 Minimum width the child can shrink to
        //     maxWidth: 200,   // 🔒 Maximum width the child can grow to
        //     minHeight: 50,   // 🔒 Minimum height the child can shrink to
        //     maxHeight: 100,  // 🔒 Maximum height the child can grow to
        //   ),
        //   child: Container(
        //     color: Colors.blue,
        //     width: 300, // ⛔ This will be limited by maxWidth = 200
        //     height: 200, // ⛔ This will be limited by maxHeight = 100
        //     child: Center(
        //       child: Text(
        //         'ConstrainedBox\n(width=300, height=200)',
        //         textAlign: TextAlign.center,
        //         style: TextStyle(color: Colors.white),
        //       ),
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
