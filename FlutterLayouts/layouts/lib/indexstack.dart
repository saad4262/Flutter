import 'package:flutter/material.dart';

class IndexedStackExample extends StatefulWidget {
  @override
  _IndexedStackExampleState createState() => _IndexedStackExampleState();
}

class _IndexedStackExampleState extends State<IndexedStackExample> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("IndexedStack Example")),
      body: Column(
        children: [
          IndexedStack(
            index: _currentIndex,
            children: [
              Container(color: Colors.red, height: 200, child: Center(child: Text("Red Screen"))),
              Container(color: Colors.green, height: 200, child: Center(child: Text("Green Screen"))),
              Container(color: Colors.blue, height: 200, child: Center(child: Text("Blue Screen"))),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: () => setState(() => _currentIndex = 0), child: Text("Red")),
              ElevatedButton(onPressed: () => setState(() => _currentIndex = 1), child: Text("Green")),
              ElevatedButton(onPressed: () => setState(() => _currentIndex = 2), child: Text("Blue")),
            ],
          )
        ],
      ),
    );
  }
}
