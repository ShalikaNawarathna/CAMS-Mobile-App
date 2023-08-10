part of 'home_page_card_cubit_cubit.dart';

abstract class HomePageCardCubitState extends Equatable {
  const HomePageCardCubitState();

  @override
  List<Object> get props => [];
}

class HomePageCardCubitInitial extends HomePageCardCubitState {}

class LoadingCardState extends HomePageCardCubitState {}

class ErrorCardState extends HomePageCardCubitState {
  final String message;
  ErrorCardState(this.message);
}

class ResponseState extends HomePageCardCubitState {
  final CompleteCardData cardModel;
  ResponseState(this.cardModel);
}
