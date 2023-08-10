import 'package:equatable/equatable.dart';



class CardModel extends Equatable {
  // CompleteCardData completeCardData = CompleteCardData();
  // List cardModelList = completeCardData.cardModel;
  final String first_name;
  final String last_name;
  final int id;
  final String email;
  final String avatar;

  CardModel(
      {required this.first_name,
      required this.last_name,
      required this.id,
      required this.email,
      required this.avatar});

  factory CardModel.fromJson(Map<String, dynamic> map) => CardModel(
    
        id: map['id'] as int,
        first_name: map['first_name'],
        last_name: map['last_name'],
        email: map['email'],
        avatar: map['avatar'],
      );
  @override
  List<Object?> get props => [id, first_name, last_name];
}
