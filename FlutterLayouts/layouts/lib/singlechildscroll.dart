import 'package:flutter/material.dart';


class MyFormScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scroll View Demo'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            for (int i = 1; i <= 20; i++) ...[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Field $i',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
            ],
            ElevatedButton(
              onPressed: () {},
              child: Text("Submit"),
            )
          ],
        ),
      ),
    );
  }
}
