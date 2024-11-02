import 'package:flutter/material.dart';

import '../../../shared/constants_shared.dart';

class ActicityAddCardWidget extends StatelessWidget {
  const ActicityAddCardWidget({
    super.key,

  });


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          height * SharedConstants.paddingGenerall,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal:
              width * SharedConstants.paddingGenerall,
          vertical: height * SharedConstants.paddingSmall,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              "Aktiviteler",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical:
                    height * SharedConstants.paddingSmall,
              ),
              child: SizedBox(
                height: height * 0.08,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        left: width *
                            SharedConstants.paddingGenerall,
                      ),
                      child: Column(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.amber,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(
                                height *
                                    SharedConstants
                                        .paddingSmall /
                                    2,
                              ),
                              child: Icon(
                                index == 4
                                    ? Icons.add
                                    : Icons.abc,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: height *
                                    SharedConstants
                                        .paddingSmall),
                            child: Text(
                              index == 4
                                  ? "Ekle"
                                  : "Yürüyüş",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: 5,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

