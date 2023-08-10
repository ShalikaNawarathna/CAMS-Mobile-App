// import 'package:bloc/bloc.dart';
// import 'package:camps_demo/repositories/card_data.dart';
// import 'package:flutter/material.dart';

// import '../../models/card_data.dart';
// // import 'package:equatable/equatable.dart';
// // import 'package:flutter/cupertino.dart';

// part 'card_state.dart';

// class CardCubit extends Cubit<CardState> {
//   CardCubit() : super(CardInitial()) {
//     fetchCardData();
//   }

//   GetDataForCard _getDataForCard = GetDataForCard();

//   Future<void> fetchCardData() async {
//     emit(LoadingCardState());
//     try {
//       final response = await _getDataForCard.getAll();
//       emit(ResponseState(response));
//       //print(response);
//     } catch (e) {
//       emit(ErrorCardState(e.toString()));
//     }
//   }
// }

// // //final GlobalKey<>

// // // void descriptionChanged(String value){
// // //   emit(state.)
// // // }
