import 'package:camps_demo/view/widget/Map/map.dart';
import 'package:camps_demo/view/widget/Map/map_page_app_bar.dart';

import 'package:flutter/material.dart';
import 'package:camps_demo/view/widget/custome_app_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ViewMapPage extends StatefulWidget {
  const ViewMapPage({super.key});

  @override
  State<ViewMapPage> createState() => _ViewMapPageState();
}

class _ViewMapPageState extends State<ViewMapPage> {
  @override
  Widget build(BuildContext context) {
    LatLng _markerPosition = LatLng(6.882387, 79.823614);
    return Scaffold(
        appBar: MapPageAppBar(context, _markerPosition),
        body: SafeArea(child: MapScreen()));

    // return Container(
    //   child: GoogleMap(
    //     myLocationButtonEnabled: false,
    //     zoomControlsEnabled: false,
    //     initialCameraPosition: _initialCameraPosition,

    //   ),
    // );
  }
}
