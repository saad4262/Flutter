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
import 'package:get/get.dart';

class CartController extends GetxController {
  var fillWidth = 0.0.obs;
  var isAnimating = false.obs;
  var showTick = false.obs;

  void animateAddToCart(Function onComplete, double fullWidth) async {
    if (isAnimating.value) return;

    isAnimating.value = true;
    fillWidth.value = 0.0;

    // Animate fill (left to right)
    for (double i = 0; i <= fullWidth; i += 10) {
      await Future.delayed(Duration(milliseconds: 20));
      fillWidth.value = i;
    }

    // Show tick after full fill
    showTick.value = true;

    // Wait before reset
    await Future.delayed(Duration(seconds: 1));

    // Reset all
    fillWidth.value = 0.0;
    showTick.value = false;
    isAnimating.value = false;

    // Trigger completion callback (e.g. snackbar)
    onComplete();
  }
}
