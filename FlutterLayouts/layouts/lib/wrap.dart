import 'package:flutter/material.dart';

class WrapExample extends StatelessWidget {
  const WrapExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wrap Widget Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Wrap(
          direction: Axis.horizontal, // Layout direction
          alignment: WrapAlignment.center, // Align items in the main axis
          spacing: 2, // Horizontal space between children
          runSpacing: 12, // Vertical space between lines
          runAlignment: WrapAlignment.center, // Align the runs (lines)
          crossAxisAlignment:
              WrapCrossAlignment.center, // Align items vertically in a run
          children: List.generate(1, (index) {
            return Chip(
              label: Text('Item $index'),
              backgroundColor:
                  Colors.primaries[index % Colors.primaries.length],
              labelStyle: const TextStyle(color: Colors.white),
            );
          }),
        ),
      ),
    );
  }
}
