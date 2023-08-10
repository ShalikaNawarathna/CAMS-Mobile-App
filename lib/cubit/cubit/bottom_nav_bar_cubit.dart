import 'package:bloc/bloc.dart';
import 'package:camps_demo/view/widget/bottom_nav_bar.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarIndexChanged(0));

  final bottomNavBarController = CustormBottamNavBar();
  List<String> tabs = [
    'Building Tyoes',
    'Buildings',
    'Functional Areas',
    'Funct',
  ];

  List<String> desc = [
    'West Tower seaside building',
    'Nunc dignissim risus id metus',
    'Cras ornare tristique elit',
    'Vavamus vestibulum ntukka nec ante',
    'Praesent placerat risus quis eros'
  ];

  Map<String, double> dataMap = {
    '12/44': 0.27,
    '10/44': 0.27,
    '02/44': 0.045,
    '11/44': 0.27,
    '08/44': 0.27
  };
  

  int currentIndex = 0;

  List<Color> colorList = [];

  int current = 0;
  void updateIndex(int newIndex) {
    currentIndex = newIndex;
    emit(TestState());
    emit(BottomNavBarIndexChanged(newIndex));
  }
}
