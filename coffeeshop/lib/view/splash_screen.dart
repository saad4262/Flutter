import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _slideController;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  late AnimationController _colorController;
  late Animation<Color?> _gradientColor1;
  late Animation<Color?> _gradientColor2;

  bool _showText = false;

  @override
  void initState() {
    super.initState();

    // Animation to slide and scale the coffee Lottie from top
    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _slideController, curve: Curves.easeOutCubic),
    );
    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _slideController, curve: Curves.easeOut));

    // Smooth gradient color animation
    _colorController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    _gradientColor1 = ColorTween(
      begin: const Color(0xff4A2F1A), // Deep chocolate brown
      end: const Color(0xff6B4B2E), // Warm medium brown
    ).animate(
      CurvedAnimation(parent: _colorController, curve: Curves.easeInOut),
    );

    _gradientColor2 = ColorTween(
      begin: const Color(0xff8B5E3C), // Soft caramel brown
      end: const Color(0xffA67A5B), // Lighter toffee brown
    ).animate(
      CurvedAnimation(parent: _colorController, curve: Curves.easeInOut),
    );

    // Start animations after build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _colorController.forward(); // Start gradient animation
      _slideController.forward().then((_) {
        setState(() {
          _showText = true;
        });

        Future.delayed(const Duration(seconds: 4), () {
          Get.offAllNamed('/home'); // Navigate to home screen
        });
      });
    });
  }

  @override
  void dispose() {
    _slideController.dispose();
    _colorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return AnimatedBuilder(
      animation: Listenable.merge([_gradientColor1, _gradientColor2]),
      builder: (context, child) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  _gradientColor1.value ?? const Color(0xff4A2F1A),
                  _gradientColor2.value ?? const Color(0xff8B5E3C),
                ],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Glow effect behind the logo
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xffA67A5B).withOpacity(0.3),
                          blurRadius: 20,
                          spreadRadius: 10,
                        ),
                      ],
                    ),
                    child: SlideTransition(
                      position: _slideAnimation,
                      child: ScaleTransition(
                        scale: _scaleAnimation,
                        child: Lottie.asset(
                          'assets/images/coffe.json',
                          height: media.height * 0.55,
                          
                        ),
                      ),
                    ),
                  ),
                 AnimatedOpacity(
  opacity: _showText ? 1.0 : 0.0,
  duration: const Duration(milliseconds: 800),
  child: Text(
    'Honey & Bean',
    style: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: const Color.fromARGB(255, 199, 184, 175),
      fontFamily: "Poppins",
      shadows: [
        Shadow(
          blurRadius: 5.0,
          color: Colors.black.withOpacity(0.3),
          offset: const Offset(2, 2),
        ),
      ],
    ),
  ),
),

                  const SizedBox(height: 25),
                  
                  Lottie.asset(
                    'assets/images/loading.json',
                    height: media.height * 0.15,
                    frameRate: FrameRate(60), // Smoother loading animation
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
