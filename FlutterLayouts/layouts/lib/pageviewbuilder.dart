import 'package:flutter/material.dart';

void main() => runApp(PageViewBuilderApp());

class PageViewBuilderApp extends StatelessWidget {
  final List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.orange,
    Colors.purple,
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("PageView.builder Example")),
        body: PageView.builder(
          itemCount: colors.length,
          itemBuilder: (context, index) {
            return Container(
              color: colors[index],
              child: Center(
                child: Text(
                  "Page $index",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
