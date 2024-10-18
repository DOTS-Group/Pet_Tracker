import 'package:flutter/material.dart';
import 'package:pet_tracker/shared/constants_shared.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  Future<void> _navigateAfterDelay(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    if (context.mounted) {
      Navigator.pushNamed(context, "/intro");
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // Yönlendirmeyi başlat
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _navigateAfterDelay(context);
    });

    return Scaffold(
      backgroundColor: SharedConstants.orangeColor,
      body: SafeArea(
        child: Stack(
          children: [
            // Arkaplan resmi
            Image.asset(
              fit: BoxFit.cover,
              SharedConstants.splashPageBackground,
              height: height,
            ),
            // Üstteki yazılar
            Positioned(
              top: height * SharedConstants.paddingLarge * 2,
              child: SizedBox(
                width: width,
                child: Center(
                  child: Column(
                    children: [
                      _buildTitle(context, "Pet Takip", true),
                      SizedBox(
                          height: height * SharedConstants.paddingGenerall),
                      _buildTitle(
                          context, "Kolay, paylaşılabilir takip", false),
                    ],
                  ),
                ),
              ),
            ),
            // Versiyon bilgisi
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
            // Yükleme animasyonu
            Positioned(
              bottom: height * SharedConstants.paddingLarge * 1.5,
              left: width * 0.1,
              child: _buildLoadingBar(width),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context, String text, bool isMain) {
    return Text(
      text,
      style: isMain
          ? Theme.of(context).textTheme.displayLarge!.copyWith(
                color: SharedConstants.whiteColor,
                fontSize:
                    Theme.of(context).textTheme.displayLarge!.fontSize! * 1.5,
              )
          : Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: SharedConstants.whiteColor,
              ),
    );
  }

  Widget _buildLoadingBar(double width) {
    return TweenAnimationBuilder(
      duration: const Duration(seconds: 3),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, value, child) {
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
              width: width * 0.8 * value,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        );
      },
    );
  }
}
