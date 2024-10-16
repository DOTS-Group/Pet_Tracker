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
              top: height * SharedConstants.paddingLarge * 2,
              // left: width * 0.25,
              child: SizedBox(
                width: width,
                child: Center(
                  child: Column(
                    children: [
                      for (int i = 0; i < 2; i++)
                        Padding(
                          padding: EdgeInsets.only(
                            top: i == 0
                                ? 0
                                : height * SharedConstants.paddingGenerall,
                          ),
                          child: Text(
                            i == 0
                                ? "Pet Takip"
                                : "Kolay, paylaşılabilir takip",
                            style: i == 0
                                ? Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                      color: SharedConstants.whiteColor,
                                      fontSize: Theme.of(context)
                                              .textTheme
                                              .displayLarge!
                                              .fontSize! *
                                          1.5,
                                    )
                                : Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: SharedConstants.whiteColor,
                                    ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: height * SharedConstants.paddingMedium,
              left: width * 0.4,
              child: Text(
                "Version 1.0",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.white.withOpacity(0.4),
                    ),
              ),
            ),
            Positioned(
              bottom: height * SharedConstants.paddingLarge * 1.5,
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
