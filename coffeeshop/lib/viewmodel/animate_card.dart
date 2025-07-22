import 'package:get/get.dart';

class AnimationControllerGetX extends GetxController {
  var animate = false.obs;
  var navigate = false.obs;

  void startAnimation(Function onComplete) {
    animate.value = true;

    Future.delayed(Duration(milliseconds: 950), () {
      navigate.value = true;
      onComplete();
    });
  }

  void reset() {
    animate.value = false;
    navigate.value = false;
  }
}

