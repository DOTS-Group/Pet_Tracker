import 'package:flutter/material.dart';

import '../../shared/constants_shared.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        // Header (Welcome Text and Search Icon)
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: height * SharedConstants.paddingGenerall,
            horizontal: width * SharedConstants.paddingGenerall,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Text("Merhaba İsmail",),
              RichText(
                text: TextSpan(
                  text: "Merhaba ",
                  style: Theme.of(context).textTheme.bodyMedium,
                  children: [
                    TextSpan(
                      text: "İsmail",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextSpan(
                      text: "\nNe Yapmak İstiyorsun?",
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
              ),
              Icon(
                Icons.search,
              ),
            ],
          ),
        ),
        // Categories Activity
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * SharedConstants.paddingGenerall),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(
                height * SharedConstants.paddingGenerall,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: height * SharedConstants.paddingGenerall,
                horizontal: width * SharedConstants.paddingGenerall,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: height * SharedConstants.paddingGenerall,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Pet Image
                        SizedBox(
                          width: width * 0.2,
                        ),
                        // Pet name and type
                        RichText(
                          text: TextSpan(
                            text: "Poyraz",
                            style: Theme.of(context).textTheme.bodyMedium,
                            children: [
                              TextSpan(
                                text: "\nRottweiler",
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "8 Yıl 6 Ay",
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: width * SharedConstants.paddingGenerall,
                    ),
                    child: GridView.builder(
                      shrinkWrap: true, // Yüksekliği içerikle sınırla
                      physics:
                          NeverScrollableScrollPhysics(), // Ana sayfanın kaydırma özelliği ile çakışmasın
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, // Her satırda 4 öğe
                        crossAxisSpacing: 8, // Yatay boşluk
                        mainAxisSpacing: 8, // Dikey boşluk
                      ),
                      itemCount: 8, // Toplam 8 öğe
                      itemBuilder: (context, index) {
                        return Container(
                          width: width * 0.25,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(
                              height * SharedConstants.paddingGenerall,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical:
                                  height * SharedConstants.paddingGenerall,
                              horizontal:
                                  width * SharedConstants.paddingGenerall,
                            ),
                            child: Column(
                              mainAxisAlignment:
                                  MainAxisAlignment.center, // Dikey merkezleme
                              children: [
                                Icon(Icons.abc),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: height * SharedConstants.paddingSmall,
                                  ),
                                  child: Text("Mama"),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.35),
                    child: Divider(
                      color: Colors.black,
                      thickness: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
