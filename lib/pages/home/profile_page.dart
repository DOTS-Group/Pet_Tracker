import 'package:flutter/material.dart';
import 'package:pet_tracker/shared/constants_shared.dart';
import 'package:pet_tracker/widgets/generalbutton_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late int tabbarIndex;
  final List<String> tabbarList = ["Hayvanlarım", "Aşı Takip", "Mama Stok"];

  @override
  void initState() {
    tabbarIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final String userName = "İsmail Can Korucu";
    final String userIdName = "@ismailcankorucu";
    final int petCounter = 1;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * SharedConstants.paddingGenerall,
      ),
      child: Column(
        children: [
          // Appbar
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
                vertical: height * SharedConstants.paddingGenerall,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: height * 0.06,
                    backgroundColor: SharedConstants.orangeColor,
                  ),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: width * SharedConstants.paddingGenerall,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (int i = 0; i < 3; i++)
                            Text(
                              i == 0
                                  ? userName
                                  : i == 1
                                      ? userIdName
                                      : "Dostlar: $petCounter",
                              style: i == 0
                                  ? Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      )
                                  : i == 1
                                      ? Theme.of(context).textTheme.bodyMedium
                                      : Theme.of(context).textTheme.bodySmall,
                              maxLines: 2,
                            ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      for (int i = 0; i < 2; i++)
                        Padding(
                          padding: EdgeInsets.only(
                            left: width * SharedConstants.paddingGenerall,
                          ),
                          child: IconButton(
                            icon: i == 0
                                ? Icon(Icons.qr_code_rounded)
                                : Icon(Icons.drive_file_rename_outline_sharp),
                            onPressed: i == 0
                                ? () {
                                    Navigator.pushNamed(context, '/qrcode');
                                  }
                                : () {
                                    Navigator.pushNamed(context, '/settings');
                                  },
                          ),
                        ),
                    ],
                  )
                ],
              ),
            ),
          ),
          // Tabbar
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: height * SharedConstants.paddingSmall,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int i = 0; i < tabbarList.length; i++)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        tabbarIndex = i;
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          tabbarList[i],
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: height * SharedConstants.paddingSmall / 2,
                          ),
                          child: tabbarIndex == i
                              ? Container(
                                  height: 4,
                                  width: width * 0.08,
                                  color: SharedConstants.orangeColor,
                                )
                              : SizedBox(
                                  height: 4,
                                ),
                        ),
                      ],
                    ),
                  )
              ],
            ),
          ),
          Expanded(
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
                  horizontal: width * SharedConstants.paddingGenerall,
                ),
                child: tabbarIndex == 0 ? MyPetsWidget() : Text("data"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyPetsWidget extends StatelessWidget {
  const MyPetsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: width * SharedConstants.paddingGenerall,
          ),
          child: PetInfoCardWidget(),
        ),
        // Add Pet Button
        Padding(
          padding: EdgeInsets.only(
            top: height * SharedConstants.paddingSmall,
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/petadd');
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: SharedConstants.whiteColor,
                borderRadius: BorderRadius.circular(
                  height * SharedConstants.paddingGenerall,
                ),
                border: Border.all(
                  color: SharedConstants.orangeColor,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: height * SharedConstants.paddingGenerall,
                ),
                child: Icon(
                  Icons.add,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PetInfoCardWidget extends StatelessWidget {
  const PetInfoCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: SharedConstants.blueColor,
        borderRadius: BorderRadius.circular(
          height * SharedConstants.paddingGenerall,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          // horizontal: width * SharedConstants.paddingGenerall,
          vertical: height * SharedConstants.paddingGenerall,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Header
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * SharedConstants.paddingGenerall,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image Pet
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      height * 0.025,
                    ),
                    child: Placeholder(
                      fallbackHeight: height * 0.05,
                      fallbackWidth: height * 0.05,
                      color: Colors.white,
                    ),
                  ),
                  // Info Pet
                  Padding(
                    padding: EdgeInsets.only(
                      left: width * SharedConstants.paddingGenerall,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int i = 0; i < 2; i++)
                          Text(
                            i == 0 ? "Poyraz" : "Rottweiler",
                            style: i == 0
                                ? Theme.of(context).textTheme.bodyMedium
                                : Theme.of(context).textTheme.bodySmall,
                          ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: SharedConstants.whiteColor,
                      borderRadius: BorderRadius.circular(
                        height * SharedConstants.paddingGenerall,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: width * SharedConstants.paddingGenerall,
                          vertical: height * SharedConstants.paddingSmall),
                      child: Text(
                        "67 Kg",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Image List
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: height * SharedConstants.paddingSmall,
              ),
              child: SizedBox(
                height: height * 0.11,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        left: width * SharedConstants.paddingGenerall,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                          height * SharedConstants.paddingGenerall,
                        ),
                        child: Placeholder(
                          fallbackHeight: height * 0.11,
                          fallbackWidth: height * 0.11,
                          color: Colors.white,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: width * SharedConstants.paddingGenerall,
              ),
              child: SizedBox(
                width: width * 0.4,
                child: const GeneralButtonWidget(
                  text: "Fotoğraf Yükle",
                  backgroundColor: SharedConstants.whiteColor,
                  textColor: SharedConstants.blackColor,
                  isSmall: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
