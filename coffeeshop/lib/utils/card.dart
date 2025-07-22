import 'package:coffeeshop/utils/app_images.dart';
import 'package:coffeeshop/utils/media_query.dart';
import 'package:coffeeshop/view/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

final List<Map<String, dynamic>> coffeeList = [
  {
    "title": "Cappuccino",
    "subtitle": "With Chocolate",
    "price": 4.99,
    "imageUrl":
        "https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg",
  },
  {
    "title": "Latte",
    "subtitle": "With Vanilla",
    "price": 5.49,
    "imageUrl": "https://images.unsplash.com/photo-1509042239860-f550ce710b93",
  },
  // {
  //   "title": "Espresso",
  //   "subtitle": "Strong Shot",
  //   "price": 3.29,
  //   "imageUrl":
  //       "https://images.pexels.com/photos/952529/pexels-photo-952529.jpeg",
  // },
];

class BuildCard extends StatelessWidget {
  //  BuildCard({super.key});

  final Map<String, dynamic> coffee;

  const BuildCard({super.key, required this.coffee});

  // final imageUrl =
  //     'https://images.pexels.com/photos/302899/pexels-photo-302899.jpeg';

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQueryHelper(context);

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with rating overlay
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    Get.to(
                      () => DetailScreen(coffee: coffee),
                      transition:
                          Transition
                              .fadeIn, // Optional fade for smoother effect
                      duration: Duration(
                        milliseconds: 0,
                      ), // Make it fast & clean
                    );
                    //  Navigator.of(context).push(
                    //           PageRouteBuilder(
                    //             transitionDuration: Duration(milliseconds: 1000),
                    //             pageBuilder:
                    //                 (context, animation, secondaryAnimation) =>
                    //                     DetailScreen(imageUrl: imageUrl),
                    //             transitionsBuilder: (
                    //               context,
                    //               animation,
                    //               secondaryAnimation,
                    //               child,
                    //             ) {
                    //               return child; // No default slide animation
                    //             },
                    //           ),
                    //         );
                  },
                  child: Hero(
                    tag: coffee['title'],
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        coffee['imageUrl'],
                        width: 200,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Color(0xff846046),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.star, color: Colors.white, size: 16),
                      SizedBox(width: mediaQuery.width * 0.01),
                      Text('4.5', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: mediaQuery.padding(8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  coffee['title'],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown[800],
                  ),
                ),
                // SizedBox(height: mediaQuery.height * 0.02),
                Text(
                  coffee['subtitle'],
                  style: TextStyle(
                    fontSize: mediaQuery.font(10),
                    color: Colors.grey[600],
                  ),
                ),
                // SizedBox(height: mediaQuery.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${coffee['price']}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                    CircleAvatar(
                      radius: 14,
                      backgroundColor: Color(0xff846046),
                      child: Icon(Icons.add, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
