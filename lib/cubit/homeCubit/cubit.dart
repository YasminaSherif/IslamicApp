import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../../model/prayerTimesModel.dart';
import 'states.dart';

class homeCubit extends Cubit<homeStates>{
  homeCubit():super(initState());
  
  late HomeModel prayerTime;
  void GetPrayerTimes() async{
  DateTime now=DateTime.now();
  var formatter = DateFormat('dd-MM-yyyy');
  String dateOftoday=formatter.format(now);
    var url=Uri.http('api.aladhan.com','/v1/timings/${dateOftoday}?',{'latitude' :'51.75865125' , 'longitude' : '-1.25387785', 'method':'5'});
    var response=await http.get(url);
    if(response.statusCode==200){
    var jsonResponse=jsonDecode(response.body);
    prayerTime=HomeModel.fromJson(jsonResponse);
    print('succses');
    emit(succsesState());
    }else{
      print(response.statusCode);
      print(response.body.toString());
      emit(failState());
    }
    
  }
}
