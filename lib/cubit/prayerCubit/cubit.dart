import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:islamicapp/cubit/prayerCubit/states.dart';


import '../../model/prayerModel.dart';




  class PrayerCubit extends Cubit<PrayerStates>{
  PrayerCubit():super(initialState());

  List<PrayerModel> prayers=[];
 
  
  void LoadData()async{
     emit(LoadingState());
    try{
       String json=await rootBundle.loadString('Prayers.json');
       var decodedJson=jsonDecode(json) as Map;
       List<dynamic> jsonAzkar=decodedJson['rows'];
      prayers=jsonAzkar.map((prayer) => PrayerModel.fromJson(prayer)).toList();
      
    }catch(e){
      print(e);
      emit(erorrState());
    }
   
    emit(LoadedState());
  }


}