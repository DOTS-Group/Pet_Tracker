import 'package:flutter/material.dart';

import '../../models/petaddpage/pettype_model.dart';
import '../../shared/constants_shared.dart';

class PetAddSelectPetTypeWidget extends StatelessWidget {
  final String title;
  final List<PetTypeAddModel> petTypeModelList;
  const PetAddSelectPetTypeWidget({
    required this.title,
    required this.petTypeModelList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.only(left: width * SharedConstants.paddingGenerall),
          child: Text(
            title,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: height * SharedConstants.paddingSmall,
          ),
          child: SizedBox(
            height: height * 0.15, // ListView'in yüksekliğini sınırlama
            width: width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal, // Yatay kaydırma
              itemCount: petTypeModelList.length, // Toplam öğe sayısı
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: width * SharedConstants.paddingGenerall,
                  ), // Öğeler arasında boşluk
                  child: Container(
                    width: width * 0.25,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(
                        height * SharedConstants.paddingGenerall,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Image.asset(petTypeModelList[index].petTypeImage),
                          Expanded(child: Placeholder()),
                          Padding(
                            padding: EdgeInsets.only(
                              top: height * SharedConstants.paddingSmall,
                            ),
                            child: Text(
                              petTypeModelList[index].petType,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
