import 'package:flutter/material.dart';

void main() => runApp(PageViewStaticApp());

class PageViewStaticApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("PageView Example")),
        body: PageView(
          children: [
            Container(color: Colors.red, child: Center(child: Text("Page 1", style: TextStyle(fontSize: 30, color: Colors.white)))),
            Container(color: Colors.green, child: Center(child: Text("Page 2", style: TextStyle(fontSize: 30, color: Colors.white)))),
            Container(color: Colors.blue, child: Center(child: Text("Page 3", style: TextStyle(fontSize: 30, color: Colors.white)))),
          ],
        ),
      ),
    );
  }
}
