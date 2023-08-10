// import 'package:camps_demo/repositories/auth/base_repository.dart';
// import 'package:firebase_auth/firebase_auth.dart' as auth;

// class AuthRepository extends BaseAuthRepository {
  

//   AuthRepository({auth.FirebaseAuth? firebaseAuth})
    

//   Future<auth.User?> logIn(
//       {required String email, required String password}) async {
//     try {

//       final credential = await _firebaseAuth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       final user = credential.user;
//       return user;
//     } catch (_) {}
//   }

//   @override
//   Stream<auth.User?> get user => _firebaseAuth.userChanges();

//   @override
//  Future<void> loginWithEmailAndPassword({
//   required String email,
//   required String password,
//  }) async {
//   try{
//     await _firebaseAuth.signInWithEmailAndPassword(
//       email: email, 
//       password: password);
//   }
//   catch (_){}
//  }
// }
