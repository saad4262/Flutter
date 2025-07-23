// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CartController extends GetxController {
//   var isAnimating = false.obs;

//   void addToCart() {
//     isAnimating.value = true;

//     // Trigger Snackbar
//     Get.snackbar(
//       "Success", "Item added to cart",
//       snackPosition: SnackPosition.BOTTOM,
//       backgroundColor: Colors.green,
//       colorText: Colors.white,
//       margin: EdgeInsets.all(12),
//       duration: Duration(seconds: 2),
//     );

//     // Stop animation after some time
//     Future.delayed(Duration(seconds: 1), () {
//       isAnimating.value = false;
//     });
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';

class CartController extends GetxController with GetTickerProviderStateMixin {
  var fillWidth = 0.0.obs;
  var isAnimating = false.obs;
  var showTick = false.obs;

  void animateAddToCart(Function onComplete, double fullWidth) async {
    if (isAnimating.value) return;

    isAnimating.value = true;
    fillWidth.value = 0.0;

    for (double i = 0; i <= fullWidth; i += 10) {
      await Future.delayed(Duration(milliseconds: 20));
      fillWidth.value = i;
    }

    showTick.value = true;

    await Future.delayed(Duration(seconds: 1));

    fillWidth.value = 0.0;
    showTick.value = false;
    isAnimating.value = false;

    onComplete();
  }

  void showAnimatedSnackbar(TickerProvider vsync) {
    final controller = AnimationController(
      vsync: vsync,
      duration: Duration(milliseconds: 800),
    );

    final animation = Tween<double>(
      begin: 0.0,
      end: 200.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    controller.forward();

    Get.showSnackbar(
      GetSnackBar(
        margin: EdgeInsets.all(16),
        borderRadius: 16,
        backgroundColor: Color.fromARGB(97, 155, 94, 51), // ~39% opacity
        duration: Duration(seconds: 2),
        isDismissible: true,
        boxShadows: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 12,
            offset: Offset(2, 4),
          ),
        ],
        snackPosition: SnackPosition.TOP,
        messageText: AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            return Row(
              children: [
                Transform.translate(
                  offset: Offset(animation.value, 0),
                  child: Icon(
                    Icons.shopping_cart,
                    color: Color(0xff846046),
                    size: 28,
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "Item added to cart",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Icon(Icons.check_circle, color: Colors.green, size: 24),
              ],
            );
          },
        ),
      ),
    );
  }
}
