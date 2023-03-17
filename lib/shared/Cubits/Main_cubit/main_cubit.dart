import 'package:bloc/bloc.dart';
import 'package:ewallet/shared/Cubits/Main_cubit/main_states.dart';
import 'package:ewallet/utils/texteditcontrollers.dart';
import 'package:ewallet/views/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainCubit extends Cubit<MainStates>{
  MainCubit():super(MainInitialState());

  static MainCubit get(context)=>BlocProvider.of(context);
  int currentIndex=0;
  void replaceBetweenScreens(int index){
    currentIndex=index;
    emit(MainReplaceScreensState());

  }

  void actionButton(){
    if (pushCodeController.text.length < 12) {
      countNumbers(
          backColor: Colors.red,
          textColor: Colors.white,
          message: 'Enter 12 numbers');
    } else {
      emit(LoadingsState());
      countNumbers(
          backColor: Colors.green,
          textColor: Colors.white,
          message: 'Payment in progress ... ');
      Future.delayed(Duration(seconds: 3)).then((value) {
        pushCodeController.text='';
        emit(StopLoadingsState());
      });
      print('object');

    }
  }


}