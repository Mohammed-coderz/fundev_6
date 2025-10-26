import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsScreen extends StatelessWidget {
   GoogleMapsScreen({super.key});

  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

   static const CameraPosition _kLake = CameraPosition(
     bearing: 192.8334901395799,
     target: LatLng(37.43296265331129, -122.08832357078792),
     tilt: 59.440717697143555,
     zoom: 19.151926040649414,
   );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps'),
      ),
      body: Column(
        children: [
          SizedBox(height: 100,),
          Container(
            height: 500,
            child: GoogleMap(
              // mapType: MapType.terrain,
              initialCameraPosition: CameraPosition(target: LatLng(31.988091, 35.875886),zoom: 20),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          )
        ],
      )
    );
  }
}
