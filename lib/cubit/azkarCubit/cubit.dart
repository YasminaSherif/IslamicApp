import 'dart:convert';

import 'package:bloc/bloc.dart';

import 'package:flutter/services.dart';
import 'package:islamicapp/cubit/azkarCubit/states.dart';

import '../../model/azkarModel.dart';

class AzkarCubit extends Cubit<AzkarStates>{
  AzkarCubit():super(initialState());

  List<AzkarModel> azkarMorning=[];
  List<AzkarModel> azkarNight=[];
  List<AzkarModel> azkarSleeping=[];
  
  void LoadData()async{
     emit(LoadingState());
    try{
       String json=await rootBundle.loadString('azkar.json');
       var decodedJson=jsonDecode(json) as Map;
       List<dynamic> jsonAzkar=decodedJson['rows'];//list of dynamic objects representing hadiths but still need converting
      List<AzkarModel> allAzkar=jsonAzkar.map((zekr) => AzkarModel.fromJson(zekr)).toList();
      azkarMorning=allAzkar.where((zekr) => zekr.category=='أذكار الصباح').toList();
      azkarNight=allAzkar.where((zekr) => zekr.category=='أذكار المساء').toList();
      azkarSleeping=allAzkar.where((zekr) => zekr.category=='أذكار النوم').toList();
    }catch(e){
      print(e);
      emit(erorrState());
    }
   
    emit(LoadedState());
  }
}