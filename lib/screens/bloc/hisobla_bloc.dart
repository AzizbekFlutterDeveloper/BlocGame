import 'dart:io';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'hisobla_state.dart';

class HisoblaBloc extends Cubit<HisoblaState> {
  HisoblaBloc() : super(HisoblaInitial());
  int sort = 0;
  bool ontap = false;
  bool start = true;
  Color appBarColor = Colors.blue;
  String appText = "Games";
  List random = [];
  List sorts = [];
  List textColor = [Colors.white,Colors.white,Colors.white,Colors.white,Colors.white,Colors.white];
  List<Color> contColor = [Colors.blue,Colors.blue,Colors.blue,Colors.blue,Colors.blue,Colors.blue];

  addRandom() {
    random.clear();
    sorts.clear();
    for (var i = 0; i < 6; i++) {
      int vale = Random().nextInt(99);
      sort = 0;
      random.add(vale);
      sorts.add(vale);
      ontap = false;
      start = false;
      appText = "Games";
      appBarColor = Colors.blue;
      textColor[i] = Colors.white;
      contColor[i] = Colors.blue;
      emit(CounterState());
    }
    emit(CounterState());
  }

  addColor() async {
    for (var i = 0; i < 6; i++) {
      Future.delayed(Duration(seconds: 5)).then((value) {
        textColor[i] = Colors.blue;
        emit(TimerState());
      });
    }
  }

  addSort(index) {
    sorts.sort();
    if (sorts[sort] == random[index]) {
      sort += 1;
      contColor[index] = Colors.green;
      textColor[index] = Colors.white;
      if(sort > 5){
        appText = "Right";
        appBarColor = Colors.green;
      }
      emit(CounterState());
      print(random);
    } else {
      ontap = true;
      sort += 1;
      appText = "Wrong";
      appBarColor = Colors.red;
      contColor[index] = Colors.red;
      textColor[index] = Colors.white;
      for (var i = 0; i < 6; i++) {
        textColor[i] = Colors.white;
      }
      emit(CounterState());
    }
  }

 
}
