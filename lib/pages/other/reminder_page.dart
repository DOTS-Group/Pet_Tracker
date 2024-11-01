import 'package:flutter/material.dart';
import 'package:pet_tracker/widgets/generalbutton_widget.dart';

import '../../shared/constants_shared.dart';
import '../../widgets/other/petselected_widget.dart';

class ReminderPage extends StatefulWidget {
  const ReminderPage({super.key});

  @override
  State<ReminderPage> createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {
  List<String> routineList = [
    "Günlük",
    "Haftalık",
    "Aylık",
    "3 Aylık",
    "6 Aylık",
    "Yıllık"
  ];
  List<String> notificationList = [
    "15dk",
    "30dk",
    "1saat",
    "2saat",
    "3saat",
    "6saat",
    "12saat",
    "1gün",
    "2gün",
    "3gün",
    "1hafta",
    "2hafta",
    "1ay"
  ];

  late int continuityIndex;

  @override
  void initState() {
    continuityIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * SharedConstants.paddingGenerall,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // AppBar
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    height * SharedConstants.paddingGenerall,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: height * SharedConstants.paddingGenerall,
                    horizontal: width * SharedConstants.paddingGenerall,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Back Button
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                        ),
                      ),
                      // Title
                      const Text("Hatırlatıcı Ekle"),
                      SizedBox(width: Theme.of(context).iconTheme.size!),
                    ],
                  ),
                ),
              ),
              // Add Reminder Form
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: height * SharedConstants.paddingSmall,
                ),
                child: const PetSelectedDropdownButtonWidget(),
              ),
              Column(
                children: [
                  // Continuity
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        height * SharedConstants.paddingGenerall,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: width * SharedConstants.paddingGenerall,
                        vertical: height * SharedConstants.paddingSmall,
                      ),
                      child: Row(
                        children: [
                          for (int i = 0; i < 3; i++)
                            i == 1
                                ? SizedBox(
                                    width:
                                        width * SharedConstants.paddingGenerall,
                                  )
                                : Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          continuityIndex = i;
                                        });
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: continuityIndex == i
                                              ? SharedConstants.orangeColor
                                              : SharedConstants
                                                  .primaryColorLight,
                                          borderRadius: BorderRadius.circular(
                                            height *
                                                SharedConstants.paddingSmall,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: height *
                                                SharedConstants.paddingSmall,
                                          ),
                                          child: Center(
                                            child: Text(
                                              i == 0
                                                  ? "Sürekli"
                                                  : "Tek Seferlik",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                    color: continuityIndex == i
                                                        ? SharedConstants
                                                            .whiteColor
                                                        : SharedConstants
                                                            .primaryTextColorLight,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                        ],
                      ),
                    ),
                  ),
                  // Select Category
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: height * SharedConstants.paddingSmall,
                    ),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          height * SharedConstants.paddingGenerall,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: height * SharedConstants.paddingSmall,
                          horizontal: width * SharedConstants.paddingGenerall,
                        ),
                        child: DropdownButton(
                          hint: Text(
                            "Kategori Seçiniz",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w300,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .color!
                                      .withOpacity(0.7),
                                ),
                          ),
                          isExpanded: true,
                          underline: SizedBox(),
                          items: [],
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                  ),
                  // Description
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        height * SharedConstants.paddingGenerall,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: height * SharedConstants.paddingSmall,
                        horizontal: width * SharedConstants.paddingGenerall,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Açıklama",
                          hintStyle:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w300,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .color!
                                        .withOpacity(0.7),
                                  ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  // Date Picker
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: height * SharedConstants.paddingSmall,
                    ),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          height * SharedConstants.paddingGenerall,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: height * SharedConstants.paddingGenerall,
                          horizontal: width * SharedConstants.paddingGenerall,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Tarih Seçiniz",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w300,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .color!
                                        .withOpacity(0.7),
                                  ),
                            ),
                            // Datepicker icon
                            GestureDetector(
                              onTap: () {},
                              child: const Icon(
                                Icons.calendar_today_rounded,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Time Picker
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        height * SharedConstants.paddingGenerall,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: height * SharedConstants.paddingGenerall,
                        // horizontal: width * SharedConstants.paddingGenerall,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: width * SharedConstants.paddingGenerall),
                            child: Text(
                              "Rutin Seçiniz",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w300,
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .color!
                                        .withOpacity(0.7),
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: height * SharedConstants.paddingSmall,
                            ),
                            child: SizedBox(
                              height: height * 0.05,
                              width: double.infinity,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: routineList.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                      left: width *
                                          SharedConstants.paddingGenerall,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(
                                          height *
                                              SharedConstants.paddingGenerall,
                                        ),
                                        border: Border.all(
                                          color: SharedConstants.orangeColor,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: height *
                                              SharedConstants.paddingSmall,
                                          horizontal: width *
                                              SharedConstants.paddingGenerall,
                                        ),
                                        child: Text(
                                          routineList[index],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Time Select
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: height * SharedConstants.paddingSmall,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          height * SharedConstants.paddingGenerall,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: height * SharedConstants.paddingGenerall,
                          horizontal: width * SharedConstants.paddingGenerall,
                        ),
                        child: Row(
                          children: [
                            Text(
                              "Zaman Ayarla",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left:
                                      width * SharedConstants.paddingExtraLarge,
                                ),
                                child: Container(
                                  // width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                      height * SharedConstants.paddingGenerall,
                                    ),
                                    border: Border.all(
                                      color: SharedConstants.orangeColor,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: height *
                                            SharedConstants.paddingSmall),
                                    child: Icon(Icons.add),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        height * SharedConstants.paddingGenerall,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: height * SharedConstants.paddingGenerall,
                        // horizontal: width * SharedConstants.paddingGenerall,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: width * SharedConstants.paddingGenerall),
                            child: Text(
                              "Bildirim Ayarla",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: height * SharedConstants.paddingSmall,
                            ),
                            child: SizedBox(
                              height: height * 0.05,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: notificationList.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                          left: width *
                                              SharedConstants.paddingGenerall),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            height *
                                                SharedConstants.paddingGenerall,
                                          ),
                                          border: Border.all(
                                            color: SharedConstants.orangeColor,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: height *
                                                  SharedConstants.paddingSmall,
                                              horizontal: width *
                                                  SharedConstants
                                                      .paddingGenerall),
                                          child: Text(
                                            notificationList[index],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * SharedConstants.paddingGenerall,
        ),
        child: const GeneralButtonWidget(
          text: "Hatırlatıcı Oluştur",
          backgroundColor: SharedConstants.orangeColor,
          textColor: SharedConstants.whiteColor,
        ),
      ),
    );
  }
}
