import 'dart:async';
import 'package:camps_demo/view/widget/Map/cubit/map_cubit.dart';
import 'package:camps_demo/view/widget/Map/location_service.dart';
import 'package:camps_demo/view/widget/Map/new_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng _markerPosition = LatLng(6.882387, 79.823614);
  Completer<GoogleMapController> _controller = Completer();
  bool isMarkerVisible = false;
  bool isMarkerUpdated = false;
  void _getCurrentLocation() {
    LocationService.determinePosition().then((position) {
      print("testing position");
      print(position);
    }).catchError((error) {
      // Handle any errors that might occur during location determination
      print('Error while fetching location: $error');
    });
  }

  static final CameraPosition _initialCameraPosition =
      CameraPosition(target: LatLng(6.882387, 79.823614), zoom: 11.5);

  @override
  Widget build(BuildContext context) {
    final Marker _kGooglePlexMarker = Marker(
      markerId: MarkerId('kGooglePlex'),
      icon: BitmapDescriptor.defaultMarker,
      draggable: true,
      position: LatLng(6.882387, 79.823614),
      onDragEnd: (newPosition) {
        _markerPosition = newPosition;
        BlocProvider.of<MapCubit>(context).updateMarkerPosition(newPosition);
      },
    );
    // }

    return BlocProvider(
        create: (context) => MapCubit(kGooglePlexMarker: _kGooglePlexMarker),
        child: Scaffold(
          body: SafeArea(
            child: Stack(children: [
              GoogleMap(
                mapType: MapType.normal,
                myLocationButtonEnabled: true,
                myLocationEnabled: true,
                zoomControlsEnabled: false,
                initialCameraPosition: _initialCameraPosition,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
                onLongPress: (latlng) {
                  BlocProvider.of<MapCubit>(context)
                      .updateMarkerPosition(latlng);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              NewPositionPage(newPosition: latlng)));
                },
                markers: isMarkerVisible
                    ? Set.of([_kGooglePlexMarker])
                    : Set<Marker>(),
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                      padding: const EdgeInsets.only(top: 40, right: 8),
                      child: BlocConsumer<MapCubit, AddButtonState>(
                        listener: (context, state) {
                          setState(() {
                            isMarkerVisible = state.isButtonClicked;
                            isMarkerUpdated = state.isMarkerVisible;
                          });
                        },
                        builder: (context, state) {
                          return ElevatedButton(
                              onPressed: () {
                                BlocProvider.of<MapCubit>(context)
                                    .clickedAddButton();
                                BlocProvider.of<MapCubit>(context)
                                    .showMapLocationIcon(state.isButtonClicked);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey,
                                //foregroundColor: Colors.black,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                side: BorderSide.none,
                              ),
                              child: Text(
                                      state.isFinishSelectingLocation
                                  ? 'Save'
                                  : state.isButtonClicked
                                      ? 'Select position'
                                      : 'Add'));

                          //  child: Text(state.isButtonClicked
                          // ? 'Select position'
                          // : a==b ? true : 'Add'));
                        },
                      )))
            ]),
          ),
        ));
  }
}
