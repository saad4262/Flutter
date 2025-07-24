import 'package:flutter/material.dart';
import 'package:layouts/IntrinsicHeight.dart';
import 'package:layouts/align.dart';
import 'package:layouts/cliprect.dart';
import 'package:layouts/constraintbox.dart';
import 'package:layouts/fittedbox.dart';
import 'package:layouts/gridview.dart';
import 'package:layouts/layoutbuilder.dart';
import 'package:layouts/listviewbuilder.dart';
import 'package:layouts/singlechildscroll.dart';
import 'package:layouts/slivergrid.dart';
import 'package:layouts/stack.dart';
import 'package:layouts/staggered_grid.dart';
import 'package:layouts/wrap.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Layouts',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: ConstrainedBoxExample(),
    );
  }
}
