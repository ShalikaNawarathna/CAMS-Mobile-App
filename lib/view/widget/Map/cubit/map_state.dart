part of 'map_cubit.dart';

//class MapInitial extends MapState {}
class AddButtonState extends Equatable {
  final bool isButtonClicked;
  final bool isMarkerVisible;
  final bool isMarkerUpdated;
  final Marker? kGooglePlexMarker;
  final bool isFinishSelectingLocation;
  

  AddButtonState(
      {required this.isButtonClicked,
      required this.isMarkerVisible,
      required this.isMarkerUpdated,
      this.kGooglePlexMarker,
      required this.isFinishSelectingLocation
      });

  //create a factory constructor for show the initial state
  factory AddButtonState.initial() {
    return AddButtonState(
        isButtonClicked: false, isMarkerVisible: false, isMarkerUpdated: false, isFinishSelectingLocation: false);
  }

  @override
  List<Object?> get props =>
      [isButtonClicked, isMarkerVisible, kGooglePlexMarker, isMarkerUpdated, isFinishSelectingLocation];

  AddButtonState copyWith({
    bool? isButtonClicked,
    bool? isMarkerVisible,
    bool? isMarkerUpdated,
    Marker? kGooglePlexMarker,
    bool? isFinishSelectingLocation
  }) {
    return AddButtonState(
        isButtonClicked: isButtonClicked ?? this.isButtonClicked,
        isMarkerVisible: isMarkerVisible ?? this.isMarkerVisible,
        isMarkerUpdated: isMarkerUpdated ?? this.isMarkerUpdated,
        kGooglePlexMarker: kGooglePlexMarker ?? this.kGooglePlexMarker,
         isFinishSelectingLocation : isFinishSelectingLocation ?? this.isFinishSelectingLocation
        );
     
  }
}

// class MapLocationIconState extends Equatable {
//   final bool isMarkerVisible;

//   MapLocationIconState(this.isMarkerVisible);

//   factory MapLocationIconState.initial() {
//     return MapLocationIconState(false);
//   }

//   MapLocationIconState copyWith({bool? isMarkerVisible}) {
//     return MapLocationIconState(isMarkerVisible ?? this.isMarkerVisible);
//   }

//   @override
//   // TODO: implement props
//   @override
//   List<Object?> get props => [isMarkerVisible];
// }
// class SelectPositionState extends MapState {
//   final String buttonLabel;

//   SelectPositionState(this.buttonLabel);
// }
