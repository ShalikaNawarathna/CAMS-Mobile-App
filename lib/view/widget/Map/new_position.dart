import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NewPositionPage extends StatelessWidget {
  final LatLng newPosition;

  const NewPositionPage({required this.newPosition});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dragged position'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Latitude : ${newPosition.latitude} '),
            Text('Longitude : ${newPosition.longitude}')
          ],
        ),
      ),
    );
  }
}
