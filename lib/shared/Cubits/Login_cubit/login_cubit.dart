import 'package:bloc/bloc.dart';
import 'package:ewallet/shared/Cubits/Login_cubit/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates>{
  LoginCubit():super(LoginInitialState());

  static LoginCubit get(context)=>BlocProvider.of(context);

  IconData icon=Icons.visibility_off;
  bool isNotVisible=true;
  void changeIconPass(){
    isNotVisible=!isNotVisible;
    icon=isNotVisible?Icons.visibility_off:Icons.visibility;
    emit(LoginIconChangeState());
  }
}