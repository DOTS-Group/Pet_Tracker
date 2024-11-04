import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/constants_shared.dart';
import '../../../shared/provider_shared.dart';

class LoginPageFaqGdprWidget extends StatelessWidget {
  const LoginPageFaqGdprWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (int i = 0; i < 2; i++)
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    insetPadding: EdgeInsets.symmetric(
                      horizontal: width * SharedConstants.paddingGenerall,
                    ),
                    backgroundColor: Colors.white,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double dialogHeight =
                            MediaQuery.of(context).size.height * 0.6;

                        return ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: constraints.maxHeight,
                            minHeight: dialogHeight,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  width * SharedConstants.paddingGenerall,
                              vertical:
                                  height * SharedConstants.paddingGenerall,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Kapatma butonu sağ üst köşede
                                Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    icon: const Icon(Icons.close),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Consumer(
                                      builder: (context, ref, child) {
                                        final String language =
                                            ref.watch(languageProvider);
                                        String filePath = i == 0
                                            ? "assets/agreements/$language/faq.txt"
                                            : "assets/agreements/$language/gdpr.txt";

                                        // FutureBuilder to handle the async loading of file content
                                        return FutureBuilder(
                                          future:
                                              rootBundle.loadString(filePath),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              return Text(
                                                snapshot.data.toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                        color: Colors.black),
                                              );
                                            } else {
                                              return const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }
                                          },
                                        );
                                      },
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
                },
              );
            },
            child: Text(
              i == 0 ? context.tr("faq") : context.tr("gdpr"),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
      ],
    );
  }
}
