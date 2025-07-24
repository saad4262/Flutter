import 'package:flutter/material.dart';

class StackExample extends StatelessWidget {
  const StackExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stack Widget Example')),
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          color: Colors.grey[200],
          child: Stack(
            alignment: Alignment.center, // 🔹 Aligns all non-positioned children
            clipBehavior: Clip.none,     // 🔹 Allows children to overflow the stack bounds
            children: [
              // 🔹 Base layer (bottom)
              Container(
                width: 200,
                height: 200,
                color: Colors.blue,
              ),

              // 🔹 Positioned widget (top-left corner)
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                  child: const Icon(Icons.star, color: Colors.white),
                ),
              ),

              // 🔹 Positioned widget (bottom-right corner)
              Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.check, color: Colors.white),
                ),
              ),

              // 🔹 Center non-positioned widget (due to alignment: center)
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    "Center",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              // 🔹 Overflowing Positioned widget
              Positioned(
                top: -20,
                child: Container(
                  width: 80,
                  height: 30,
                  color: Colors.orange,
                  child: const Center(
                    child: Text(
                      "Overflow",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
