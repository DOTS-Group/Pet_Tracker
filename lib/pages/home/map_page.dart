import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pet_tracker/shared/constants_shared.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        // Google Map
        GoogleMap(
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            if (!_controller.isCompleted) {
              _controller
                  .complete(controller); // Future sadece bir kez tamamlanır.
            }
          },
          zoomControlsEnabled: false,
        ),
        // Header
        Positioned(
          top: height * SharedConstants.paddingSmall,
          child: SizedBox(
            height: height * 0.15,
            width: width,
            child: Column(
              children: [
                // Search Bar
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * SharedConstants.paddingGenerall,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          // height: height * 0.06,
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
                              vertical:
                                  height * SharedConstants.paddingSmall / 2,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: "Search",
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    left:
                                        width * SharedConstants.paddingGenerall,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Icon(Icons.search),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: width * SharedConstants.paddingGenerall,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              height * SharedConstants.paddingGenerall,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(
                              height * SharedConstants.paddingGenerall,
                            ),
                            child: Icon(
                              Icons.align_vertical_top_rounded,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: height * SharedConstants.paddingSmall,
                  ),
                  child: SizedBox(
                    height: height * 0.05,
                    width: width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            left: width * SharedConstants.paddingGenerall,
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
                                vertical: height * SharedConstants.paddingSmall,
                                horizontal:
                                    width * SharedConstants.paddingGenerall,
                              ),
                              child: Text("data $index"),
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
        Positioned(
          bottom: height * SharedConstants.paddingGenerall,
          child: Container(
            width: width - (width * SharedConstants.paddingGenerall * 2),
            height: height * 0.2,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Veterinarian Clinic Logo or Image
                      Placeholder(
                        fallbackHeight: height * 0.08,
                        fallbackWidth: height * 0.08,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: width * SharedConstants.paddingGenerall,
                        ),
                        child: Column(
                          children: [
                            Text(
                              "Veterinarian Clinic Name",
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Clinic",
                                ),
                                Text(
                                  "4.5",
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
