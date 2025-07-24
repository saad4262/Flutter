// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// class StaggeredGridExample extends StatelessWidget {
//   const StaggeredGridExample({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // 🔸 Manually set heights for each item
//     List<double> heights = [100, 500, 700, 200, 400, 250, 600, 150, 350, 300];

//     return Scaffold(
//       appBar: AppBar(title: const Text("Staggered GridView")),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: MasonryGridView.count(
//           crossAxisCount: 2,
//           mainAxisSpacing: 10,
//           crossAxisSpacing: 4,
//           itemCount: heights.length,
//           itemBuilder: (context, index) {
//             return Container(
//               height: heights[index], // ✅ Specific height from list
//               decoration: BoxDecoration(
//                 color: Colors.primaries[index % Colors.primaries.length],
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Center(
//                 child: Text(
//                   'Item $index\n${heights[index].toInt()} px',
//                   style: const TextStyle(color: Colors.white),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'dart:math';

// class RandomDataGrid extends StatelessWidget {
//   const RandomDataGrid({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Simulating random-length data
//     final List<String> randomTexts = List.generate(
//       20,
//       (index) => List.generate(
//         Random().nextInt(20) + 1,
//         (_) => "Item $index",
//       ).join(" "),
//     );

//     return Scaffold(
//       appBar: AppBar(title: const Text("Random Content Grid")),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: MasonryGridView.count(
//           crossAxisCount: 2,
//           mainAxisSpacing: 12,
//           crossAxisSpacing: 12,
//           itemCount: randomTexts.length,
//           itemBuilder: (context, index) {
//             return Container(
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: Colors.primaries[index % Colors.primaries.length],
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Text(
//                 randomTexts[index],
//                 style: const TextStyle(color: Colors.white, fontSize: 16),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StaggeredImageGrid extends StatelessWidget {
  const StaggeredImageGrid({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulated image URLs from API (replace with real URLs)
    final List<String> imageUrls = [
      'https://picsum.photos/id/10/300/200',
      'https://picsum.photos/id/20/300/500',
      'https://picsum.photos/id/30/300/100',
      'https://picsum.photos/id/40/300/700',
      'https://picsum.photos/id/50/300/250',
      'https://picsum.photos/id/60/300/400',
      'https://picsum.photos/id/1011/300/500',
      'https://picsum.photos/id/1015/300/200',
      'https://picsum.photos/id/1016/300/600',
      'https://picsum.photos/id/1018/300/400',
      'https://picsum.photos/id/1020/300/350',
      'https://picsum.photos/id/1024/300/700',
      'https://picsum.photos/id/1027/300/250',
      'https://picsum.photos/id/1033/300/450',
      'https://picsum.photos/id/1035/300/300',
      'https://picsum.photos/id/1041/300/550',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Random Image Grid")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          itemCount: imageUrls.length,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrls[index],
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }
}
