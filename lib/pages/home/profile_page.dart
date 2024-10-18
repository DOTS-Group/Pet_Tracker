import 'package:flutter/material.dart';
import 'package:pet_tracker/shared/constants_shared.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * SharedConstants.paddingGenerall,
      ),
      child: Column(
        children: [
          // Appbar
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: height * SharedConstants.paddingSmall,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.grid_view_rounded,
                ),
                Text(
                  "Profil",
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontWeight: FontWeight.normal,
                      ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/settings");
                  },
                  child: const Icon(
                    Icons.settings,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
