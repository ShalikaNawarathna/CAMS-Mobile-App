import 'package:camps_demo/models/card_data.dart';
import 'package:equatable/equatable.dart';

class CompleteCardData extends Equatable {
  final int page;
  final int per_page;
  final int total;
  final int total_pages;
  final List<CardModel> cardModel;

  CompleteCardData(
      {required this.page,
      required this.per_page,
      required this.total,
      required this.total_pages,
      required this.cardModel});

  factory CompleteCardData.fromJson(Map<String, dynamic> map) {
    final List<dynamic> cardModelList = map['data'];
    final List<CardModel> parsedCardModelList = cardModelList
        .map((cardData) => CardModel.fromJson(cardData as Map<String, dynamic>))
        .toList();

    return CompleteCardData(
      page: map['page'] as int,
      per_page: map['per_page'] as int,
      total: map['total'] as int,
      total_pages: map['total_pages'] as int,
      cardModel: parsedCardModelList,
    );
  }

  @override
  List<Object?> get props => [page, per_page, total, total_pages, cardModel];
}
