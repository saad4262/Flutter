import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Expanded Vs Flexible")),
      body: Center(
        // child: Column(
        //   children: [
        //     Expanded(
        //       child: SingleChildScrollView(
        //         scrollDirection: Axis.horizontal,
        //         child: Text('A'),
        //       ),
        //     ),
        //     Container(height: 400, child: Icon(Icons.star)),
        //   ],
        // ),
        // child: Row(
        //   children: [
        //     // Flexible(
        //     //   child: Container(
        //     //     color: Colors.green,
        //     //     child: Text(
        //     //       'This is a very very very very very long text...afdjdfajddffdaklkad naskfl ijorijodfalkdkmlkmdfmlkdf',
        //     //     ),
        //     //   ),
        //     // ),
        //     // Icon(Icons.star),
        //     Expanded(
        //       child: Text(
        //         'This is a really really long line...mladsfl;dakl;fasdddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddadknlfslkfdmkmadkm;ldm;lfas',
        //         overflow: TextOverflow.ellipsis,
        //         softWrap: false,
        //       ),
        //     ),
        //   ],
        // ),
        // child: Column(
        //   children: [
        //     Expanded(child: Text('A')),
        //     Expanded(child: Text('B')),
        //     Expanded(child: Text('C')),
        //     Expanded(child: Text('C')),
        //     Expanded(child: Text('C')),
        //     Expanded(child: Text('C')),
        //                 Expanded(child: Text('C')),
        //     Expanded(child: Text('C')),
        //     Expanded(child: Text('C')),
        //     Expanded(child: Text('C')),
        //     Expanded(child: Text('C')),
        //     Expanded(child: Text('C')),
        //     Expanded(child: Text('C')),
        //     Expanded(child: Text('C')),

        //     Container(height: 1000, child: Text('Fixed')),
        //   ],
        // ),
        //   child: Column(
        //     children: [
        //       Flexible(flex: 60, child: Text('A')),
        //       Flexible(flex: 1, child: Text('B')),
        //       // Flexible(flex: 1, child: Text('B')),
        //       // Flexible(flex: 1, child: Text('B')),
        //       // Flexible(flex: 30, child: Text('B')),
        //       // Flexible(flex: 1, child: Text('B')),

        // ),
        // );
        child: Column(
          children: [
            Flexible(
              flex: 60,
              child: Container(
                                // width: double.infinity,
                //  height: 500,
                color: Colors.red, child: Text("Container1")),
            ),
            Flexible(
              flex: 60,
              child: Container(
                // height: 500,
                // width: double.infinity,
                color:  Color.fromARGB(57, 11, 77, 32),
                child: Text("Container1"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
