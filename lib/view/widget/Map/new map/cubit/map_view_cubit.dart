import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'map_view_state.dart';

class MapViewCubit extends Cubit<MapViewState> {
  LatLng _markerPosition = LatLng(6.882387, 79.823614);

  LatLng get markerPosition => _markerPosition;
  MapViewCubit() : super(MapViewInitial());

  void resetLocationIcon() {
    emit(MapViewInitial());
  }

  void replaceAddButton() {
    emit(replaceAddButtonWithSelectPosition());
  }

  void draggedLocationIcon() {
    emit(replaceSelectPositionBUttonWithSave());
  }

  void updatePosition(LatLng newPosition) {
    _markerPosition = newPosition;
    emit(updateNewLocation(markerPosition));
  }

  void saveButtonClicked(double latitude, double longitude) {
    emit(saveCurrentLocation(
      
        _markerPosition.latitude, _markerPosition.longitude));

        
  }
  // void saveButtonClicked() async {
  //   try{
  //     final position = await Geolocator.ge
  //   }
  // }
}
