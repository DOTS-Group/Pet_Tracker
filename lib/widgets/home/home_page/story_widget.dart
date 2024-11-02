import 'package:flutter/material.dart';

import '../../../shared/constants_shared.dart';

class HomePageStroriesWidget extends StatelessWidget {
  const HomePageStroriesWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    // TODO: Bu içeriklerini internetten çekilecek şekilde yapılacak!
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * 0.2,
      width: width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: width * SharedConstants.paddingGenerall,
            ),
            child: Column(
              children: [
                // Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    height * SharedConstants.paddingGenerall,
                  ),
                  child: Placeholder(
                    fallbackHeight: height * 0.15,
                    fallbackWidth: width * 0.3,
                  ),
                ),
                // Title
                Padding(
                  padding: EdgeInsets.only(
                    top:
                        height * SharedConstants.paddingSmall,
                  ),
                  child: Text(
                    "Yürüyüş Asistanı",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

