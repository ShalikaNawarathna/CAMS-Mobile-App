// import 'package:camps_demo/models/card_data.dart';
// import 'package:camps_demo/services/services.dart';
// part of 'services.dart';
// class  CardServices implements Services{
//   @override
//   void dispose() {
   
//   }

//   @override
//   void init() {
//     // TODO: implement init
//   }

//   static Future<ServiceResult<List<CardModel>>> getCardData(int page, {required http.Client client}) async{
//     client  n = http.Client();

//    try{
//      String url = "https://reqres.in/api/users/page=$page";

//      var response = await client.get(url, headers: {"Accespt" : "application/json"});

//      if(response.status == 200){
//       var data = jsonDecode(response.body);

//       List<CardModel> cardModels = (data['sample'] as Iterable).map((e) => CardModel.fromJson(e)).toList();
//       return ServiceResult(status: status, data: data, message: message)
//      }
     
//   }
//    }
//   // 
// }