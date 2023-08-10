

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/cupertino.dart';
//import 'package:http/http.dart';

//import '../../repositories/auth/auth_repository.dart';
import '../../services/remote_services.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  //  final AuthRepository _authRepository;
  // LoginCubit({required AuthRepository authRepository})
  //     : _authRepository = authRepository,
  //       super(LoginState.initial());
  //final RemotesService()  
  LoginCubit() : super(LoginState.initial()) {
    // RemotesService().getPosts();
  }

  final passwordControl = TextEditingController();
  final usernameControl = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

// ignore: non_constant_identifier_names
  //var apiClient = RemotesService()._

  void emailChanged(String value) {
    //final email = Email.dirty(value);
    emit(state.copyWith(email: value, status: LoginStatus.initial));

    if (formKey.currentState!.validate() && emailValid()) {
      emit(state.copyWith(status: LoginStatus.success));
    }

    // emit(state.copyWith(status: LoginStatus.success));
    else {
      emit(state.copyWith(status: LoginStatus.error));
    }
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, status: LoginStatus.initial));

    if (formKey.currentState!.validate() && passwordValid()) {
      emit(state.copyWith(status: LoginStatus.success));
    }

    // emit(state.copyWith(status: LoginStatus.success));
    else {
      emit(state.copyWith(status: LoginStatus.error));
    }
  }

  // void emailValid(String email) {}
  bool emailValid() => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(state.email);

  bool passwordValid() =>
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
          .hasMatch(state.password);

  Future<void> loginWithCredentails() async {
    try {
      //apiClient.login();
      RemotesService remotesService = RemotesService();
      await remotesService.login(usernameControl.text, passwordControl.text);

      if (formKey.currentState == LoginStatus.submitting) return;
      emit(state.copyWith(status: LoginStatus.submitting));
      if (formKey.currentState!.validate() && emailValid() && passwordValid()) {
        emit(state.copyWith(status: LoginStatus.success));
      }

      // emit(state.copyWith(status: LoginStatus.success));
      else {
        emit(state.copyWith(status: LoginStatus.error));
      }
    } catch (e) {
      print(e);
    }
  }


}
