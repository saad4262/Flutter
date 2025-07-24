import 'package:flutter/material.dart';

class IntrinsicExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('IntrinsicHeight Example')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    color: Colors.red,
                    padding: EdgeInsets.all(16),
                    child: Text("Hi"),
                  ),
                  SizedBox(width: 10), // spacing between containers
                  Container(
                    height: 200,
                    color: Colors.green,
                    padding: EdgeInsets.all(16),
                    child: Text("Hello, this is a long message"),
                  ),
                ],
              ),
            ),

            IntrinsicWidth(
              stepWidth: 200, // Optional: sets minimum width steps
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.stretch, // Stretch all to same width
                children: [
                  Container(
                    width: 500,
                    color: Colors.red,
                    padding: EdgeInsets.all(8),
                    child: Text("Short"),
                  ),
                  Container(
                    color: Colors.green,
                    padding: EdgeInsets.all(8),
                    child: Text("A bit longer text"),
                  ),
                  Container(
                    color: Colors.blue,
                    padding: EdgeInsets.all(8),
                    child: Text("This is the longest text here"),
                  ),
                ],
              ),
            ),
          ],
        ),
        // child: IntrinsicHeight(
        //   child: Row(
        //     crossAxisAlignment: CrossAxisAlignment.stretch,
        //     children: [
        //       Expanded(
        //         child: Container(
        //           color: Colors.red,
        //           child: Center(child: Text("Short")),
        //         ),
        //       ),
        //       SizedBox(width: 10),
        //       Expanded(
        //         child: Container(
        //           color: Colors.green,
        //           child: Center(
        //             child: Text(
        //               "This is a much taller widget due to the content",
        //               textAlign: TextAlign.center,
        //             ),
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
