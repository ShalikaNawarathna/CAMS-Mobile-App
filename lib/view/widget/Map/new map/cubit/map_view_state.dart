// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'map_view_cubit.dart';

abstract class MapViewState extends Equatable {
  const MapViewState();

  @override
  List<Object> get props => [];
}

class MapViewInitial extends MapViewState {
  @override
  List<Object> get props => [];
}

//class getLocationSelectionItem extends MapViewState {}

class replaceAddButtonWithSelectPosition extends MapViewState {}

class replaceSelectPositionBUttonWithSave extends MapViewState {}

class saveButtonClickedWithLocation extends MapViewState {}

class updateNewLocation extends MapViewState {
  final LatLng markerPosition;
  updateNewLocation(this.markerPosition);

  List<Object> get props => [markerPosition];
}

class saveCurrentLocation extends MapViewState {
  final double latitude;
  final double longitude;

  saveCurrentLocation(this.latitude, this.longitude);

  List<Object> get props => [latitude, longitude];
}
