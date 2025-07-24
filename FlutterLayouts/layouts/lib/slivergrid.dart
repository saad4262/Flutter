
// import 'package:flutter/material.dart';

// class SliverGridExample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'SliverGrid Demo',
//       home: Scaffold(
//         body: CustomScrollView(
//           slivers: [
//             // SliverAppBar: Optional collapsible header
//             SliverAppBar(
//               pinned: true,
//               expandedHeight: 150,
//               flexibleSpace: FlexibleSpaceBar(
//                 title: Text('SliverGrid Example'),
//               ),
//             ),

//             // SliverGrid with key properties
//             SliverGrid(
//               delegate: SliverChildBuilderDelegate(
//                 (BuildContext context, int index) {
//                   return Container(
//                     alignment: Alignment.center,
//                     color: Colors.teal[100 * ((index % 8) + 1)],
//                     child: Text('Item $index'),
//                   );
//                 },
//                 childCount: 20, // ✅ Number of items
//               ),
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2, // ✅ No. of columns
//                 mainAxisSpacing: 10, // ✅ Vertical spacing
//                 crossAxisSpacing: 10, // ✅ Horizontal spacing
//                 childAspectRatio: 1.5, // ✅ Width / height ratio
//               ),
//             ),

//             // Add more slivers below if needed
//             SliverToBoxAdapter(
//               child: Padding(
//                 padding: const EdgeInsets.all(20),
//                 child: Text(
//                   'You can combine SliverList, SliverGrid, SliverToBoxAdapter and more!',
//                   style: TextStyle(fontSize: 18),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';



class SliverNestedGridPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Collapsible AppBar
          SliverAppBar(
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Nested Sliver Layout'),
              background: Image.network(
                'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Banner Text Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Featured Categories',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          // Horizontal Scrollable Nested Grid
          SliverToBoxAdapter(
            child: SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) => Container(
                  width: 140,
                  margin: EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.deepPurple[100 * ((index % 8) + 1)],
                  ),
                  child: Center(
                    child: Text(
                      'Card $index',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Spacer
          SliverToBoxAdapter(child: SizedBox(height: 24)),

          // Vertical Grid 1
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Recommended for You',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  margin: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.teal[100 * ((index % 8) + 1)],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text('Item $index'),
                  ),
                );
              },
              childCount: 6,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.3,
            ),
          ),

          // Vertical Grid 2
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Explore More',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  margin: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.orange[100 * ((index % 8) + 1)],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text('Explore $index'),
                  ),
                );
              },
              childCount: 4,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.1,
            ),
          ),

          // Footer
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Center(
                child: Text(
                  '© 2025 My Sliver App',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

