import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'map_state.dart';

class MapCubit extends Cubit<AddButtonState> {
  MapCubit({Marker? kGooglePlexMarker}) : super(AddButtonState.initial());

  void clickedAddButton() {
    emit(state.copyWith(isButtonClicked: !state.isButtonClicked));
    if (!state.isButtonClicked) {
      emit(state.copyWith(isMarkerVisible: !state.isMarkerVisible));
    }
  }

  void clickedSelectPosition() {
    emit(state.copyWith(
        isFinishSelectingLocation: !state.isFinishSelectingLocation));
  }

  void showMapLocationIcon(bool isVisible) {
    emit(state.copyWith(isMarkerVisible: isVisible));
  }

  void hideMapIcon() {
    emit(state.copyWith(isMarkerVisible: false));
  }

  void longPress(LatLng latLng) {

    if (state.isButtonClicked) {
      updateMarkerPosition(latLng);
    }
  }

  void updateMarkerPosition(LatLng newPosition) {
    if (state.isMarkerUpdated) {
      final updatedMarker =
          state.kGooglePlexMarker!.copyWith(positionParam: newPosition);
      emit(state.copyWith(kGooglePlexMarker: updatedMarker));
    }
  }

  // void showScaffoldMessenger() {
  //   Navigator.pop(context);

  // }
}
