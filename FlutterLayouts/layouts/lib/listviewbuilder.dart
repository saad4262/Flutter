import 'package:flutter/material.dart';

class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Simple ListView.builder")),
      body: ListView.builder(
        itemCount: 10, // total number of items
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(child: Text('${index + 1}')),
            title: Text('Item $index'),
            subtitle: Text('Subtitle for item $index'),
            trailing: const Icon(Icons.arrow_forward),
          );
        },
      ),
    );
  }
}
