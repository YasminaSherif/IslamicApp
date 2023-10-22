import 'dart:convert';

import 'package:bloc/bloc.dart';

import 'package:flutter/services.dart';
import 'package:islamicapp/cubit/quranCubit/states.dart';

import '../../model/quranModel.dart';

class quranCubit extends Cubit<quranStates>{
  quranCubit():super(initialState());

  List<quranModel> quran=[];
  void LoadData() async{
    emit(loadingState());
    try{
       String json=await rootBundle.loadString('Quran.json');
    List<dynamic> decodedJson=jsonDecode(json);
    quran=decodedJson.map((e) => quranModel.fromJson(e)).toList();
    }catch(e){
      print(e);
      emit(erorrState());
    }
   
    emit(LoadedState());
  }
}
