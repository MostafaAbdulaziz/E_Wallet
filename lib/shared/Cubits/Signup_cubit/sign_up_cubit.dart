import 'package:bloc/bloc.dart';
import 'package:ewallet/shared/Cubits/Signup_cubit/sign_up_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupStates>{
  SignupCubit():super(SignupInitialState());

  static SignupCubit get(context)=>BlocProvider.of(context);

  IconData iconPass=Icons.visibility_off;
  bool isNotVisiblePass=true;
  void changeIconPass(){
    isNotVisiblePass=!isNotVisiblePass;
    iconPass=isNotVisiblePass?Icons.visibility_off:Icons.visibility;
    emit(SignupIconChangeState());
  }

  IconData iconConfirmPass=Icons.visibility_off;
  bool isNotVisibleConfirmPass=true;
  void changeIconConfirmPass(){
    isNotVisibleConfirmPass=!isNotVisibleConfirmPass;
    iconConfirmPass=isNotVisibleConfirmPass?Icons.visibility_off:Icons.visibility;
    emit(SignupIconChangeState());
  }
}