import 'package:flutter/material.dart';
import 'package:pet_tracker/shared/constants_shared.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Animasyon Kontrolcüsü oluşturma
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..forward();

    // 3 saniye sonra sayfa yönlendirmesi
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushNamed(context, "/intro");
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: SharedConstants.orangeColor,
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              fit: BoxFit.cover,
              SharedConstants.splashPageBackground,
              height: height,
              // width: width,
            ),
            Positioned(
              top: height * SharedConstants.extraLargePadding * 2,
              left: width * 0.3,
              child: Column(
                children: [
                  for (int i = 0; i < 2; i++)
                    Text(
                      i == 0 ? "Pet Takip" : "Kolay, paylaşılabilir takip",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                ],
              ),
            ),
            Positioned(
              bottom: height * SharedConstants.mediumPadding,
              left: width * 0.4,
              child: Text(
                "Version 1.0",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              bottom: height * SharedConstants.largePadding * 1.5,
              left: width * 0.1,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Container(
                    height: 4,
                    width: width * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: width * 0.8 * _controller.value,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
