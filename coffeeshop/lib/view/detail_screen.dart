import 'package:coffeeshop/utils/media_query.dart';
import 'package:coffeeshop/viewmodel/button_animation.dart';
import 'package:coffeeshop/viewmodel/categories_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:coffeeshop/viewmodel/animate_card.dart';

class DetailScreen extends StatefulWidget {
  final Map<String, dynamic> coffee;

  const DetailScreen({super.key, required this.coffee});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  final SizeOptions controller = Get.put(SizeOptions());
  final CartController cartController = Get.put(CartController());

  late AnimationController _controller;
  late Animation<double> _fadeIn;
  late Animation<Offset> _slideUp;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeIn = CurvedAnimation(
      parent: _controller,
      curve: Interval(0.4, 1.0, curve: Curves.easeIn),
    );

    _slideUp = Tween<Offset>(begin: Offset(0, 0.3), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.4, 1.0, curve: Curves.easeOut),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQueryHelper(context);

    final coffee = widget.coffee;
    final imageUrl = coffee['imageUrl'];
    final title = coffee['title'];
    final subtitle = coffee['subtitle'];
    final price = coffee['price'];
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            builder: (context, value, child) {
              final double topPosition =
                  MediaQuery.of(context).size.height / 2 * (1 - value);
              final double scale = 0.5 + (0.5 * value);

              return Positioned(
                top: topPosition,
                left: screenWidth * 0,
                right: screenWidth * 0,
                child: Transform.scale(
                  scale: scale,
                  child: Hero(
                    tag: coffee['title'],
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Stack(
                        children: [
                          Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                            height: mediaQuery.height * 0.44,
                          ),
                          Positioned(
                            top: 30,
                            left: 30,
                            child: InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.white,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Icon(
                                      Icons.arrow_back_ios,
                                      size: 22,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Positioned(
                            bottom: 2,
                            left: -15,
                            right: -15,
                            child: FadeTransition(
                              opacity:
                                  _fadeIn, // use the same fade-in animation
                              child: Container(
                                height: 70,
                                margin: EdgeInsets.symmetric(horizontal: 16),
                                decoration: BoxDecoration(
                                  color: Colors.black.withAlpha(51),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: mediaQuery.padding(4),
                                  ),
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: mediaQuery.padding(20),
                                            ),
                                            child: Text(
                                              title,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: mediaQuery.font(24),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: mediaQuery.height * 0.005,
                                          ),
                                          Text(
                                            subtitle,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: mediaQuery.font(12),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Positioned(
                            bottom: 22,
                            right: 6,
                            child: FadeTransition(
                              opacity: _fadeIn, // 👈 your fade animation
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black.withAlpha(51),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                    SizedBox(width: mediaQuery.width * 0.01),
                                    Text(
                                      '4.5',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          FadeTransition(
            opacity: _fadeIn,
            child: SlideTransition(
              position: _slideUp,
              child: Padding(
                padding: const EdgeInsets.only(top: 370.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: mediaQuery.height * .08,
                      width: mediaQuery.width * .9,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 244, 243, 243),
                        borderRadius: BorderRadius.circular(30),
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.coffee, color: Color(0xff846046)),
                                Text(
                                  "Coffee",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: VerticalDivider(
                                color: Colors.grey,
                                thickness: 1,
                                width: 20,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.check_box_outline_blank_outlined,
                                  color: Color(0xff846046),
                                ),
                                Text(
                                  "Chocolate",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: VerticalDivider(
                                color: Colors.grey,
                                thickness: 1,
                                width: 20,
                              ),
                            ),

                            Text(
                              "Medium",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: mediaQuery.height * 0.02),
                    Padding(
                      padding: EdgeInsets.only(left: mediaQuery.padding(25)),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Coffee Size ",
                          style: TextStyle(
                            fontSize: mediaQuery.font(24),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: mediaQuery.height * 0.015),

                    Obx(
                      () => SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minWidth: mediaQuery.width,
                          ),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(
                              controller.categoriesList.length,
                              (index) {
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
                                                : Colors.grey[100],
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Text(
                                        controller.categoriesList[index],
                                        style: TextStyle(
                                          fontSize: mediaQuery.font(19),
                                          fontWeight: FontWeight.bold,
                                          color:
                                              isSelected
                                                  ? Colors.white
                                                  : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: mediaQuery.height * 0.02),
                    Padding(
                      padding: EdgeInsets.only(left: mediaQuery.padding(25)),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "About",
                          style: TextStyle(
                            fontSize: mediaQuery.font(24),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: mediaQuery.height * 0.015),
                    Padding(
                      padding: EdgeInsets.only(left: mediaQuery.padding(25)),
                      child: Align(
                        alignment: Alignment.centerLeft,

                        child: Text(
                          "Coffee is more than just a beverage—it's a daily ritual for millions around the world. From the bold intensity of espresso to the smooth comfort of a latte, every cup tells a story.",
                        ),
                      ),
                    ),

                    SizedBox(height: mediaQuery.height * 0.02),

                    Obx(() {
                      final double fullWidth = mediaQuery.width * 0.9;
                      final double fillWidth = cartController.fillWidth.value;
                      final bool showTick = cartController.showTick.value;
                      final bool isAnimating = cartController.isAnimating.value;

                      return ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          width: fullWidth,
                          height: mediaQuery.height * 0.08,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey[300],
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: AnimatedContainer(
                                  duration: Duration(milliseconds: 100),
                                  width: fillWidth,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Color(0xff846046),
                                    borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(30),
                                      right:
                                          fillWidth >= fullWidth - 10
                                              ? Radius.circular(30)
                                              : Radius.circular(0),
                                    ),
                                  ),
                                ),
                              ),
                              if (showTick)
                                Icon(Icons.check, color: Colors.white, size: 30)
                              else if (!isAnimating)
                                TextButton(
                                  onPressed: () {
                                    cartController.animateAddToCart(() {
                                      cartController.showAnimatedSnackbar(
                                        cartController,
                                      );
                                    }, fullWidth);
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 40,
                                      vertical: 14,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                  child: Text(
                                    "Add to Cart",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: mediaQuery.height * 0.025,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
