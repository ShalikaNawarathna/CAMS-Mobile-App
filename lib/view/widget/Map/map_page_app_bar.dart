

import 'package:camps_demo/home_screen.dart';
import 'package:camps_demo/view/widget/Map/new_position.dart';
import 'package:camps_demo/view/widget/pages/leading_page.dart';
import 'package:camps_demo/view/widget/pages/viewmap_page.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPageAppBar extends AppBar {
  final BuildContext context;
  final LatLng markerPositions;
  // NewPositionPage newPositionPage = NewPositionPage(newPosition:newPosition)
  //final Marker _kGooglePlexMarker;
  MapPageAppBar(this.context, this.markerPositions)
      : super(
            centerTitle: true,
            toolbarHeight: 80,
            title: const Text(
              'West Tower seaside building....',
              style: TextStyle(fontSize: 15),
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25))),
            elevation: 0.0,
            backgroundColor: Color(0xFF4071FF),
            leading: InkWell(
                onTap: () {
                  // Navigator.push(
                  //     context, MaterialPageRoute(builder: (_) => HomeScreen()));
                  //Scaffold.of(context).openDrawer();
                  // Navigator.pop(context);
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    
                    SnackBar(
                      
                      content: Text(
                        'Marker Position: ${markerPositions.latitude}, ${markerPositions.longitude}',
                      ),
                      // duration: Duration(seconds: 200),
                    ),
                  );
                },
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    Colors.white, // Replace this with the desired color
                    BlendMode.srcIn,
                  ),
                  child: SizedBox(
                      width: 150,
                      child:
                          Image.asset('assets/icons/common/backward_icon.png')),
                )));
}
