
import 'package:flutter/material.dart';

class SliverListTileExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Always Visible Image Header',
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(pinned: true, delegate: MyHeaderDelegate()),

            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  elevation: 2,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.deepPurple,
                      child: Text('${index + 1}'),
                    ),
                    title: Text('Contact ${index + 1}'),
                    subtitle: Text('contact${index + 1}@example.com'),
                    trailing: Icon(Icons.phone),
                  ),
                );
              }, childCount: 20),
            ),
          ],
        ),
      ),
    );
  }
}

class MyHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          'https://picsum.photos/800/600?random=1',
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 16,
          left: 16,
          child: Text(
            'My Contacts',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              shadows: [Shadow(blurRadius: 3, color: Colors.black)],
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => 200;

  @override
  double get minExtent => 80;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}

// class SliverListTileExample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Sliver ListTile Demo',
//       home: Scaffold(
//         body: CustomScrollView(
//           slivers: [
//             SliverAppBar(
//               expandedHeight: 200.0,
//               pinned: true,
//               elevation: 0,
//               backgroundColor: Colors.transparent,
//               flexibleSpace: FlexibleSpaceBar(
//                 title: Text('My Contacts'),
//                 stretchModes: [
//                   StretchMode.zoomBackground, // Zoom effect when over-scroll
//                   StretchMode.fadeTitle, // Simplify title fade effect
//                   StretchMode.blurBackground, // Blur while scrolling
//                 ],
//                 background: Image.network(
//                   'https://picsum.photos/800/600?random=1',
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),

//             // Sliver List with ListTiles
//             SliverList(
//               delegate: SliverChildBuilderDelegate(
//                 (context, index) {
//                   return Card(
//                     margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                     elevation: 2,
//                     child: ListTile(
//                       leading: CircleAvatar(
//                         backgroundColor: Colors.deepPurple,
//                         child: Text('${index + 1}'),
//                       ),
//                       title: Text('Contact ${index + 1}'),
//                       subtitle: Text('contact${index + 1}@example.com'),
//                       trailing: Icon(Icons.phone),
//                       onTap: () {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text('Tapped Contact ${index + 1}'),
//                           ),
//                         );
//                       },
//                     ),
//                   );
//                 },
//                 childCount: 30, // number of list items
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Home extends StatelessWidget {
//   const Home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("FLutter Layouts")),
//       body: Column(
//         children: [Container(height: 20, width: 100, color: Colors.red)],
//       ),
//     );
//   }
// }
