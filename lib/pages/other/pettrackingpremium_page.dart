import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pet_tracker/models/premium/premium_model.dart';
import 'package:pet_tracker/shared/constants_shared.dart';
import 'package:url_launcher/url_launcher.dart';

class PetTrackingPremiumPage extends StatefulWidget {
  const PetTrackingPremiumPage({super.key});

  @override
  State<PetTrackingPremiumPage> createState() => _PetTrackingPremiumPageState();
}

class _PetTrackingPremiumPageState extends State<PetTrackingPremiumPage> {
  List<PremiumModel> premiumPackages = [
    PremiumModel(
      packageName: "Monthly Premium",
      description: "Perfect for trying out premium features",
      price: 4.99,
      currency: "USD",
      features: [
        "Unlimited pet profiles",
        "Advanced health tracking",
        "Priority customer support",
        "Ad-free experience",
      ],
      duration: "1 month",
      storeId: "premium_monthly",
    ),
    PremiumModel(
      packageName: "Yearly Premium",
      description: "Our most popular plan",
      price: 49.99,
      currency: "USD",
      features: [
        "All monthly features",
        "2 months free",
        "Exclusive content",
        "Family sharing",
      ],
      duration: "12 months",
      storeId: "premium_yearly",
    ),
  ];

  Future<void> _launchStore(String storeId) async {
    final Uri url = Uri.parse(
      Theme.of(context).platform == TargetPlatform.iOS
          ? 'https://apps.apple.com/app/id$storeId'
          : 'https://play.google.com/store/apps/details?id=$storeId',
    );
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(context.tr("premium")),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Premium Banner
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    SharedConstants.orangeColor,
                    SharedConstants.orangeColor.withOpacity(0.8),
                  ],
                ),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.star,
                    size: 60,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    context.tr("unlockPremium"),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    context.tr("premiumDescription"),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            // Premium Features
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.tr("premiumFeatures"),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 16),
                  ...premiumPackages
                      .map((package) => _buildPremiumCard(package)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPremiumCard(PremiumModel package) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              package.packageName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              package.description,
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(height: 16),
            Text(
              "${package.price} ${package.currency}/${package.duration}",
              style: TextStyle(
                fontSize: 24,
                color: SharedConstants.orangeColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ...package.features.map(
              (feature) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Icon(Icons.check_circle,
                        color: SharedConstants.orangeColor, size: 20),
                    const SizedBox(width: 8),
                    Text(feature),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: SharedConstants.orangeColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () => _launchStore(package.storeId),
                child: Text(context.tr("subscribe")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
