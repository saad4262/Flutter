import 'package:flutter/material.dart';

class ClipRectExample extends StatelessWidget {
  const ClipRectExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ClipRect Example')),
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Align(
            alignment: Alignment.topCenter,
            heightFactor: 0.5, // Show only top half
            child: Image.network(
              'https://picsum.photos/300/300',
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
