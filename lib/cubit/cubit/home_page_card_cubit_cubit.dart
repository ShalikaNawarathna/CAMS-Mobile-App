import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


import '../../models/complete_card_data.dart';
import '../../repositories/card_data.dart';

part 'home_page_card_cubit_state.dart';

class HomePageCardCubitCubit extends Cubit<HomePageCardCubitState> {
  final GetDataForCard _getDataForCard;
  HomePageCardCubitCubit(this._getDataForCard)
      : super(HomePageCardCubitInitial()) {
    fetchCardData();
  }

  get data => [];

  // Future<void> getCardData() async {
  //   emit(LoadingCardState());

  //   try {
  //     final result = await _getDataForCard.getAll();
  //     if (data != null) {
  //       final _id = (result['id']) as String;
  //       final _firstName = (data['first_name']) as String;
  //       final lastName = (data['last_name']) as String;
  //     }
  //   } catch (_) {
  //     emit(ErrorCardState('Error'));
  //   }
  // }

  Future<void> fetchCardData() async {
    emit(LoadingCardState());
    try {
      final response = await _getDataForCard.getAll();
      emit(ResponseState(response));
      print(response);
      //print(response);
    } catch (e) {
      emit(ErrorCardState(e.toString()));
    }
  }
}
