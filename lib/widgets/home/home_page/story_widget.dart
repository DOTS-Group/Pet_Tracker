import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../models/home/homepage/assistans_model.dart';
import '../../../shared/constants_shared.dart';
import '../../../shared/list_shared.dart';

class HomePageStroriesWidget extends StatelessWidget {
  const HomePageStroriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<AssistansModel> storiesList = [
      AssistansModel(
        imageRoute: SharedList.homepageStoriesImageRouteList[0],
        title: context.tr("homePageTitle1"),
        route: "/walkingAssistants",
      ),
      AssistansModel(
        imageRoute: SharedList.homepageStoriesImageRouteList[1],
        title: context.tr("homePageTitle2"),
        route: "/traningAssistants",
      ),
      AssistansModel(
        imageRoute: SharedList.homepageStoriesImageRouteList[2],
        title: context.tr("homePageTitle3"),
        route: "/socializationAssistants",
      ),
      AssistansModel(
        imageRoute: SharedList.homepageStoriesImageRouteList[3],
        title: context.tr("homePageTitle4"),
        route: "/pettrackingPremium",
      ),
    ];
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * 0.21,
      width: width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: storiesList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: width * SharedConstants.paddingGenerall,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, storiesList[index].route);
              },
              child: Column(
                children: [
                  // Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      height * SharedConstants.paddingGenerall,
                    ),
                    child: Image.asset(
                      storiesList[index].imageRoute,
                      fit: BoxFit.cover,
                      height: height * 0.15,
                      width: width * 0.25,
                    ),
                  ),
                  // Title
                  Padding(
                    padding: EdgeInsets.only(
                      top: height * SharedConstants.paddingSmall,
                    ),
                    child: SizedBox(
                      width: width * 0.25,
                      child: Text(
                        storiesList[index].title,
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
