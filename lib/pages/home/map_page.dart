import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pet_tracker/shared/constants_shared.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  LatLng? _currentPosition;
  final List<String> categories = [
    "veterinaryClinic",
    "petHotel",
    "petShop",
    "petPark",
    "petGrooming",
    "petCafe",
  ];
  bool _showMarkerDetails = false;
  final Set<Marker> _markers = {};
  String? _selectedMarkerId;

  // Konya merkez koordinatları
  static const LatLng KONYA_CENTER = LatLng(37.8719, 32.4843);

  Map<String, MarkerData> markerDetails = {
    "clinic1": MarkerData(
      title: "Kılıçarslan Veteriner Kliniği",
      type: "Veteriner Kliniği",
      address: "Hacı Fettah Mahallesi No:46/E, 42200 Meram",
      rating: 4.5,
      staffCount: 2,
      imageUrl:
          "https://fastly.picsum.photos/id/91/200/200.jpg?hmac=y-8iGl9dOkbHqADPlWuS-rWBHNBWWXlzKcsTDu2WeQo",
    ),
    "hotel1": MarkerData(
      title: "Pet Hotel Premium",
      type: "Pet Otel",
      address: "Yaka Mahallesi No:12, 42090 Meram",
      rating: 4.8,
      staffCount: 5,
      imageUrl:
          "https://fastly.picsum.photos/id/33/200/200.jpg?hmac=Byvb9ZEKV47fLdwaE2BGClGsgcm5fyuDH6sWb9pvWbI",
    ),
    "shop1": MarkerData(
      // Pet Shop detaylarını ekle
      title: "Happy Pets Shop",
      type: "Pet Shop",
      address: "Feritpaşa Mahallesi, Kerkük Caddesi No:45, Selçuklu",
      rating: 4.3,
      staffCount: 3,
      imageUrl:
          "https://fastly.picsum.photos/id/219/200/200.jpg?hmac=VWq983HZl5HxH1tK2F_23X8CkG3HLdRHXzcGZi7vuXs",
    ),
  };

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _addMockMarkers();
  }

  Future<void> _getCurrentLocation() async {
    LocationPermission permission;

    // Konum servisi açık mı kontrol et
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.tr("enableLocationServices"))),
        );
      }
      return;
    }

    // İzin kontrolü
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(context.tr("locationPermissionDenied"))),
          );
        }
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.tr("locationPermissionPermanentlyDenied")),
            action: SnackBarAction(
              label: context.tr("openSettings"),
              onPressed: () => openAppSettings(),
            ),
          ),
        );
      }
      return;
    }

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _currentPosition = LatLng(position.latitude, position.longitude);
      });

      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: _currentPosition!,
            zoom: 14.4746,
          ),
        ),
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.tr("locationError"))),
        );
      }
    }
  }

  Future<void> _addMockMarkers() async {
    final BitmapDescriptor veterinaryIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(32, 32)),
      SharedConstants.veterinaryMarker,
    ).then((value) => value);

    final BitmapDescriptor hotelIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(32, 32)),
      SharedConstants.hotelMarker,
    ).then((value) => value);

    final BitmapDescriptor shopIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(32, 32)),
      SharedConstants.shopMarker,
    ).then((value) => value);

    if (mounted) {
      setState(() {
        _markers.add(
          Marker(
            markerId: const MarkerId("clinic1"),
            position: LatLng(
              _currentPosition?.latitude ?? KONYA_CENTER.latitude + 0.005,
              _currentPosition?.longitude ?? KONYA_CENTER.longitude + 0.005,
            ),
            icon: veterinaryIcon,
            onTap: () {
              setState(() {
                _showMarkerDetails = true;
                _selectedMarkerId = "clinic1";
              });
            },
          ),
        );

        _markers.add(
          Marker(
            markerId: const MarkerId("hotel1"),
            position: LatLng(
              _currentPosition?.latitude ?? KONYA_CENTER.latitude - 0.005,
              _currentPosition?.longitude ?? KONYA_CENTER.longitude - 0.005,
            ),
            icon: hotelIcon,
            onTap: () {
              setState(() {
                _showMarkerDetails = true;
                _selectedMarkerId = "hotel1";
              });
            },
          ),
        );

        _markers.add(
          Marker(
            markerId: const MarkerId("shop1"),
            position: LatLng(
              _currentPosition?.latitude ?? KONYA_CENTER.latitude + 0.01,
              _currentPosition?.longitude ?? KONYA_CENTER.longitude - 0.01,
            ),
            icon: shopIcon,
            onTap: () {
              setState(() {
                _showMarkerDetails = true;
                _selectedMarkerId = "shop1";
              });
            },
          ),
        );
      });
    }
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(context.tr("filters")),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Filter by Distance
            ListTile(
              title: Text(context.tr("distance")),
              trailing: DropdownButton<String>(
                value: "5km",
                items: [
                  "1km",
                  "5km",
                  "10km",
                  "20km",
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  // Apply Distance Filter
                },
              ),
            ),
            // Rating Filter
            ListTile(
              title: Text(context.tr("rating")),
              trailing: DropdownButton<String>(
                value: "4+",
                items: [
                  "3+",
                  "4+",
                  "4.5+",
                ].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  // Apply Rating Filter
                },
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              context.tr("cancel"),
              style: const TextStyle(color: SharedConstants.redColor),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: SharedConstants.orangeColor,
            ),
            onPressed: () {
              // Apply Filters
              Navigator.pop(context);
            },
            child: Text(context.tr("apply")),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        // Google Map
        GoogleMap(
          initialCameraPosition: _currentPosition != null
              ? CameraPosition(target: _currentPosition!, zoom: 14.4746)
              : const CameraPosition(
                  target: KONYA_CENTER, // İstanbul yerine Konya
                  zoom: 14.4746,
                ),
          onMapCreated: (GoogleMapController controller) {
            if (!_controller.isCompleted) {
              _controller.complete(controller);
            }
          },
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          zoomControlsEnabled: false,
          markers: _markers,
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
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: context.tr("search"),
                                border: InputBorder.none,
                                suffixIcon: const Icon(Icons.search),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: width * SharedConstants.paddingGenerall,
                        ),
                        child: GestureDetector(
                          onTap: _showFilterDialog,
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
                              child:
                                  const Icon(Icons.align_vertical_top_rounded),
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
                      itemCount: categories.length,
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
                              child: Text(context.tr(categories[index])),
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
        // Map Marker Details
        if (_showMarkerDetails &&
            _selectedMarkerId != null &&
            markerDetails[_selectedMarkerId] != null)
          Positioned(
            bottom: height * SharedConstants.paddingGenerall,
            left: width * SharedConstants.paddingGenerall,
            right: width * SharedConstants.paddingGenerall,
            child: Container(
              constraints: BoxConstraints(
                maxHeight: height * 0.3,
                maxWidth: width * 0.9,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      Positioned(
                        right: 8,
                        top: 8,
                        child: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            setState(() {
                              _showMarkerDetails = false;
                              _selectedMarkerId = null;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                markerDetails[_selectedMarkerId]!.imageUrl,
                                width: height * 0.1,
                                height: height * 0.1,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    width: 50,
                                    height: 50,
                                    color: Colors.grey[300],
                                    child: const Icon(Icons.error),
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: width * SharedConstants.paddingGenerall,
                              ),
                              child: Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Marker Title
                                    SizedBox(
                                      width: width * 0.55,
                                      child: Text(
                                        markerDetails[_selectedMarkerId]!.title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                    // Marker Type
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        vertical: height *
                                            SharedConstants.paddingSmall,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            markerDetails[_selectedMarkerId]!
                                                .type,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                  color: Colors.grey[600],
                                                ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: width *
                                                  SharedConstants
                                                      .paddingGenerall,
                                            ),
                                            child: const Icon(
                                              Icons.star,
                                              color:
                                                  SharedConstants.orangeColor,
                                            ),
                                          ),
                                          Text(
                                            " ${markerDetails[_selectedMarkerId]!.rating}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                    // Marker Address
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on,
                                          color: SharedConstants.orangeColor,
                                        ),
                                        SizedBox(
                                          height: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .fontSize! *
                                              3,
                                          width: width * 0.5,
                                          child: Text(
                                            markerDetails[_selectedMarkerId]!
                                                .address,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: true,
                                            maxLines: 2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(
                        height * SharedConstants.paddingGenerall),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            icon: const Icon(Icons.directions),
                            label: const Text("Yol Tarifi"),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                            ),
                            onPressed: () {
                              // Yol tarifi işlemleri
                            },
                          ),
                        ),
                        SizedBox(
                          width: width * SharedConstants.paddingGenerall,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: SharedConstants.orangeColor,
                            ),
                            onPressed: () {
                              // Randevu alma işlemleri
                            },
                            child: const Text("Randevu Al"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

// Marker verilerini tutmak için model
class MarkerData {
  final String title;
  final String type;
  final String address;
  final double rating;
  final int staffCount;
  final String imageUrl;

  MarkerData({
    required this.title,
    required this.type,
    required this.address,
    required this.rating,
    required this.staffCount,
    required this.imageUrl,
  });
}
