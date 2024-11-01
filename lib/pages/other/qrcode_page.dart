import 'package:flutter/material.dart';
import 'package:pet_tracker/shared/constants_shared.dart';
import 'package:pet_tracker/widgets/generalbutton_widget.dart';
import 'package:pet_tracker/widgets/other/petselected_widget.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class QrCodePage extends StatelessWidget {
  const QrCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final qrCode = QrCode.fromData(
      data: 'lorem ipsum dolor sit amet',
      errorCorrectLevel: QrErrorCorrectLevel.H,
    );
    final qrImage = QrImage(qrCode);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * SharedConstants.paddingGenerall,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Appbar
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios_rounded,
                          ),
                        ),
                        const Text("QR Kod"),
                        Icon(Icons.more_vert),
                      ],
                    ),
                  ),
                ),
              ),
              // Selected Pet
              const PetSelectedDropdownButtonWidget(),
              // QR Code Container
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
                    child: Column(
                      children: [
                        // Qr Code Title
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Empty Space
                            SizedBox(
                              width: Theme.of(context).iconTheme.size,
                            ),
                            // Qr Code
                            Stack(
                              children: [
                                Image.asset(
                                  SharedConstants.qrCodeFrameIcon,
                                  height: height * 0.2,
                                  width: height * 0.2,
                                ),
                                Positioned(
                                  top: height * 0.025,
                                  left: height * 0.025,
                                  child: SizedBox(
                                    height: height * 0.15,
                                    width: height * 0.15,
                                    child: PrettyQrView(
                                      qrImage: qrImage,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // Share Button
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.share,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: height * SharedConstants.paddingSmall,
                                  ),
                                  child: Text(
                                    "Paylaş",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        // Qr Code Description
                        Column(
                          children: [
                            for (int i = 0; i < 2; i++)
                              Padding(
                                padding: EdgeInsets.only(
                                    top: height * SharedConstants.paddingSmall),
                                child: Row(
                                  children: [
                                    for (int j = 0; j < 2; j++)
                                      Text(
                                        j == 0 ? "İsim:" : "Poyraz",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                              fontWeight: j == 0
                                                  ? FontWeight.bold
                                                  : FontWeight.normal,
                                            ),
                                      ),
                                  ],
                                ),
                              )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "İletişim Bilgileri",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        for (int i = 0; i < 2; i++)
                          Row(
                            children: [
                              for (int j = 0; j < 2; j++)
                                Text(
                                  j == 0 ? "İsim:" : "Poyraz",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontWeight: j == 0
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                      ),
                                ),
                            ],
                          )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width * SharedConstants.paddingGenerall,
        ),
        child: GeneralButtonWidget(
          text: "QR Okut",
          backgroundColor: SharedConstants.orangeColor,
          textColor: SharedConstants.whiteColor,
        ),
      ),
    );
  }
}
