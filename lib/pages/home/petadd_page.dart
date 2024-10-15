import 'package:flutter/material.dart';
import 'package:pet_tracker/shared/constants_shared.dart';
import 'package:pet_tracker/widgets/generalbutton_widget.dart';

import '../../models/petaddpage/pettype_model.dart';
import '../../widgets/petadd/petaddselectpettype_widget.dart';

class PetaddPage extends StatelessWidget {
  const PetaddPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * SharedConstants.paddingGenerall,
                vertical: height * SharedConstants.paddingGenerall,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                    ),
                  ),
                  Text(
                    "Dost Ekle",
                  ),
                  SizedBox(
                    width: Theme.of(context).iconTheme.size,
                  )
                ],
              ),
            ),
            for (int i = 0; i < 2; i++)
              Padding(
                padding: EdgeInsets.only(
                  top: i == 0 ? 0 : height * SharedConstants.paddingGenerall,
                ),
                child: PetAddSelectPetTypeWidget(
                  title: "Tür Seçiniz",
                  petTypeModelList: [
                    PetTypeAddModel(
                        petType: "Kedi", petTypeImage: "assets/images/cat.png"),
                    PetTypeAddModel(
                        petType: "Köpek",
                        petTypeImage: "assets/images/dog.png"),
                    PetTypeAddModel(
                        petType: "Kuş", petTypeImage: "assets/images/bird.png"),
                  ],
                ),
              ),
            // Color Input
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * SharedConstants.paddingGenerall,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Renk",
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: height * SharedConstants.paddingSmall,
                    ),
                    child: Container(
                      width: double.infinity,
                      height: height * 0.08,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(
                          height * SharedConstants.paddingGenerall,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Renk giriniz",
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * SharedConstants.paddingGenerall,
                vertical: height * SharedConstants.paddingSmall,
              ),
              // Selected sex
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: height * SharedConstants.paddingSmall,
                    ),
                    child: Text("Cinsiyet"),
                  ),
                  Row(
                    children: [
                      for (int i = 0; i < 2; i++)
                        Padding(
                          padding: EdgeInsets.only(
                            left: i == 0
                                ? 0
                                : width * SharedConstants.paddingGenerall,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(
                                height * SharedConstants.paddingGenerall,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: height * SharedConstants.paddingSmall,
                                horizontal:
                                    height * SharedConstants.paddingGenerall,
                              ),
                              child: Row(
                                children: [
                                  Text("Erkek"),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      left: width *
                                          SharedConstants.paddingGenerall,
                                    ),
                                    child: Icon(
                                      Icons.abc,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                    ],
                  )
                ],
              ),
            ),
            // Date of birth with date picker
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * SharedConstants.paddingGenerall,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Doğum Tarihi",
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: height * SharedConstants.paddingSmall,
                    ),
                    child: Container(
                      width: double.infinity,
                      height: height * 0.08,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(
                          height * SharedConstants.paddingGenerall,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Doğum tarihi seçiniz",
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Weight Input with unit
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * SharedConstants.paddingGenerall,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ağırlık",
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: height * SharedConstants.paddingSmall,
                    ),
                    child: Container(
                      width: double.infinity,
                      height: height * 0.08,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(
                          height * SharedConstants.paddingGenerall,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Ağırlık giriniz",
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: width * SharedConstants.paddingGenerall,
                              ),
                              child: Text("kg"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Food type
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: height * SharedConstants.paddingGenerall,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: width * SharedConstants.paddingGenerall,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Yiyecek Türü",
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                          top: height * SharedConstants.paddingSmall,
                        ),
                        child: Row(
                          children: [
                            for (int i = 0; i < 3; i++)
                              Padding(
                                padding: EdgeInsets.only(
                                    left: i == 0
                                        ? 0
                                        : width *
                                            SharedConstants.paddingGenerall),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.amber,
                                    borderRadius: BorderRadius.circular(
                                      height * SharedConstants.paddingGenerall,
                                    ),
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical:
                                          height * SharedConstants.paddingSmall,
                                      horizontal: height *
                                          SharedConstants.paddingGenerall,
                                    ),
                                    child: Text(
                                      "data",
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
            // Microchip Number
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * SharedConstants.paddingGenerall,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Mikroçip Numarası",
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: height * SharedConstants.paddingSmall,
                    ),
                    child: Container(
                      width: double.infinity,
                      height: height * 0.08,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(
                          height * SharedConstants.paddingGenerall,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Mikroçip numarası giriniz",
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Save Button
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: height * SharedConstants.paddingGenerall,
                horizontal: width * SharedConstants.paddingGenerall,
              ),
              child: GeneralButtonWidget(
                text: "Kaydet",
                backgroundColor: Colors.amber,
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
