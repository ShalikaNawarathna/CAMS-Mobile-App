part of 'bottom_nav_bar_cubit.dart';
//import 'package:equatable/equatable.dart';
abstract class BottomNavBarState extends Equatable {
  const BottomNavBarState();

  @override
  List<Object> get props => [];
}

class BottomNavBarInitial extends BottomNavBarState {}

class BottomNavBarIndexChanged extends BottomNavBarState {
  final int newIndex;

  BottomNavBarIndexChanged(this.newIndex);
}

class TestState extends BottomNavBarState{
  
}
