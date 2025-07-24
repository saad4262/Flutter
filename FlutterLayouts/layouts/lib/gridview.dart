// // import 'package:flutter/material.dart';

// // class MyGrid extends StatelessWidget {
// //   const MyGrid({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: Text("GridView Builder")),
// //       body: Column(
// //         children: [
// //           Expanded(
// //             child: GridView.count(
// //               crossAxisCount: 1,
// //               padding: EdgeInsets.all(8),
// //               children: [
// //                 Container(color: Colors.red, height: 100),
// //                 Container(color: Colors.green, height: 100),
// //                 Container(color: Colors.blue, height: 100),
// //                 Container(color: Colors.orange, height: 100),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';

// class MyGrid extends StatelessWidget {
//   const MyGrid({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("GridView Horizontal")),
//       body: Column(
//         children: [
//           SizedBox(
//             height:
//                 200, // 💡 Important: Give fixed height to contain horizontal scroll
//             child: GridView.count(
//               scrollDirection: Axis.horizontal, // ✅ Horizontal scrolling
//               crossAxisCount: 2, // 2 rows in horizontal direction
//               padding: EdgeInsets.all(8),
//               crossAxisSpacing: 8,
//               mainAxisSpacing: 8,
//               children: [
//                 Container(color: Colors.red),
//                 Container(color: Colors.green),
//                 Container(color: Colors.blue),
//                 Container(color: Colors.orange),
//                 Container(color: Colors.purple),
//                 Container(color: Colors.teal),
//                 Container(color: Colors.teal),
//                 Container(color: Colors.teal),
//                 Container(color: Colors.teal),
//                 Container(color: Colors.teal),
//                 Container(color: Colors.teal),
//                 Container(color: Colors.teal),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class MyGridView extends StatelessWidget {
  const MyGridView({super.key});

  @override
  Widget build(BuildContext context) {
    // A ScrollController (optional)
    final ScrollController _scrollController = ScrollController();

    return Scaffold(
      appBar: AppBar(title: const Text("GridView Builder Example")),
      body: GridView.builder(
        itemCount: 20, // total items
        // Controls how the grid items are laid out
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 columns
          mainAxisSpacing: 10, // vertical space
          crossAxisSpacing: 10, // horizontal space
          childAspectRatio: 3 / 2, // width / height ratio
        ),

        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.primaries[index % Colors.primaries.length],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                'Item $index',
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          );
        },

        scrollDirection: Axis.vertical, // or Axis.horizontal
        padding: const EdgeInsets.all(12), // grid outer padding
        shrinkWrap:
            false, // true if inside a Column and want grid to take only required space
        physics: const BouncingScrollPhysics(), // scroll behavior
        reverse: true, // reverse scroll direction
        controller: _scrollController, // if you want to control or track scroll
        // primary:
        //     true, // this grid is primary scrollable (only one true per screen)
      ),
    );
  }
}
