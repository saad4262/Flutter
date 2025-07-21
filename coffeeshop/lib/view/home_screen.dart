import 'package:coffeeshop/utils/app_images.dart';
import 'package:coffeeshop/utils/card.dart';
import 'package:coffeeshop/utils/custom_textfield.dart';
import 'package:coffeeshop/utils/media_query.dart';
import 'package:coffeeshop/viewmodel/categories_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final CategoriesOptions controller = Get.put(CategoriesOptions());

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQueryHelper(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(mediaQuery.padding(16)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: mediaQuery.radius(25),
                    backgroundImage: AssetImage(AppImages.profileImage),
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_pin),
                      Text(
                        "Sahiwal,Pakistan",
                        style: TextStyle(fontSize: mediaQuery.font(12)),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Icon(Icons.notifications, size: 25),
                      Positioned(
                        right: 5,
                        top: 5,
                        child: CircleAvatar(
                          radius: 3,
                          backgroundColor: Colors.red,
                          child: Text(
                            '',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: mediaQuery.height * 0.02),
            Padding(
              padding: EdgeInsets.only(left: mediaQuery.padding(35)),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Good Morning, Saad",
                  style: TextStyle(
                    fontSize: mediaQuery.font(24),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            SizedBox(height: mediaQuery.height * 0.02),

            CustomSearchField(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 55,
              onFilterTap: () {
                print("Filter tapped!");
              },
            ),

            SizedBox(height: mediaQuery.height * 0.02),

            Padding(
              padding: EdgeInsets.only(left: mediaQuery.padding(35)),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Categories",
                  style: TextStyle(
                    fontSize: mediaQuery.font(24),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            SizedBox(height: mediaQuery.height * 0.02),

            Obx(
              () => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.only(left: mediaQuery.padding(35)),
                  child: Row(
                    children: List.generate(controller.categoriesList.length, (
                      index,
                    ) {
                      final isSelected =
                          controller.selectedIndex.value == index;
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            controller.selectCategory(index);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  isSelected
                                      ? Color(0xff846046)
                                      : Colors.grey[10],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              controller.categoriesList[index],
                              style: TextStyle(
                                fontSize: mediaQuery.font(16),
                                fontWeight: FontWeight.bold,
                                color: isSelected ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ),

            SizedBox(height: mediaQuery.height * 0.02),

            SizedBox(
              height: mediaQuery.height * 0.3,

              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: mediaQuery.padding(15),
                ),

                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75,
                  children: List.generate(2, (index) => BuildCard()),
                ),
              ),
            ),

            SizedBox(height: mediaQuery.height * 0.01),

            Padding(
              padding: EdgeInsets.only(left: mediaQuery.padding(35)),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Special Offers",
                  style: TextStyle(
                    fontSize: mediaQuery.font(24),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // SizedBox(height: mediaQuery.height * 0.01),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              margin: EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    // Left: Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SvgPicture.asset(
                        'assets/images/coffe3.svg',
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),

                    SizedBox(width: 12),

                    // Right: Text and Label
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cappuccino',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown[800],
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Espresso, Steamed Milk',
                            style: TextStyle(color: Colors.grey[600]),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 8),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xff846046),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'Buy 1 Get 1 Free',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
