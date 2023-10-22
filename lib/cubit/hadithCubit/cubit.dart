import 'dart:convert';

import 'package:bloc/bloc.dart';

import 'package:flutter/services.dart';
import 'package:islamicapp/cubit/hadithCubit/states.dart';

import '../../model/hadithModel.dart';

class HadithCubit extends Cubit<HadithStates>{
  HadithCubit():super(initialState());
   List<HadithModel> allHadiths=[];
  void LoadHadith()async{
     emit(LoadingState());
    try{
       String json=await rootBundle.loadString('hadith.json');
       var decodedJson=jsonDecode(json) as Map;
       List<dynamic> jsonHadiths=decodedJson['hadiths'];//list of dynamic objects representing hadiths but still need converting
       allHadiths=jsonHadiths.map((hadith) => HadithModel.fromJson(hadith)).toList();
    }catch(e){
      print(e);
      emit(erorrState());
    }
   
    emit(LoadedState());
  }
  }
