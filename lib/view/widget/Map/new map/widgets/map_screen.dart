import 'dart:async';
import 'package:camps_demo/view/widget/Map/cubit/map_cubit.dart';
import 'package:camps_demo/view/widget/Map/location_service.dart';
import 'package:camps_demo/view/widget/Map/new%20map/cubit/map_view_cubit.dart';
import 'package:camps_demo/view/widget/Map/new_position.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShowMapScreen extends StatefulWidget {
  const ShowMapScreen({super.key});

  @override
  State<ShowMapScreen> createState() => _ShowMapScreenState();
}

class _ShowMapScreenState extends State<ShowMapScreen> {
  LatLng _newPosition =
      LatLng(6.882387, 79.823614); // Initialize with some default value

  Completer<GoogleMapController> _controller = Completer();

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
        visible: context.watch<MapViewCubit>().state
            is replaceAddButtonWithSelectPosition,
        onDragEnd: (newPosition) {
          BlocProvider.of<MapViewCubit>(context).updatePosition(newPosition);
        }
        // onDragEnd: (newPosition) {
        //   _markerPosition = newPosition;
        //   BlocProvider.of<MapCubit>(context).updateMarkerPosition(newPosition);
        // },
        );
    // }

    return Scaffold(
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
            markers: context.watch<MapViewCubit>().state
                    is replaceAddButtonWithSelectPosition
                ? Set.of([_kGooglePlexMarker])
                : Set<Marker>(),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 40, right: 8),
              child: BlocBuilder<MapViewCubit, MapViewState>(
                builder: (context, state) {
                  if (state is replaceAddButtonWithSelectPosition) {
                    return ElevatedButton(
                      onPressed: () {
                        // BlocProvider.of<MapViewCubit>(context)
                        //     .replaceAddButton();
                        // BlocProvider.of<MapViewCubit>(context)
                        //     .showMapLocationIcon();
                        // Call the method to change the button back to "Add"
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        side: BorderSide.none,
                      ),
                      child: Text('Select Position'),
                    );
                  } else if (state is replaceSelectPositionBUttonWithSave) {
                    return ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<MapViewCubit>(context)
                            .draggedLocationIcon();
                        // final snackBar = SnackBar(
                        //     content: Text(
                        //         'Latitude: $latitude, Longitude: $longitude'));
                        // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: Text(' Position'),
                    );
                  } else if (state is updateNewLocation) {
                    return ElevatedButton(
                        onPressed: () {
                          double latitude = state.markerPosition.latitude;
                          double longitude = state.markerPosition.longitude;
                          BlocProvider.of<MapViewCubit>(context)
                              .saveButtonClicked(latitude, longitude);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Latitude: $latitude, Longitude: $longitude'),
                            ),
                          );
                        },
                        child: Text('Save'));
                  } else {
                    return ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<MapViewCubit>(context)
                            .replaceAddButton(); // Call the method to change the button to "Select Position"
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        side: BorderSide.none,
                      ),
                      child: Text('Add'),
                    );
                  }
                },
              ),
            ),
          )
        ]),
      ),
    );
  }
}
