class HomeModel{
  late int code;
  late String status;
  late Data data;

  HomeModel.fromJson(Map<String,dynamic> json){
    code=json['code'];
    status=json['status'];
    data=(json['data'] != null ? Data.fromJson(json['data']) : null)!;
  }
}

class Data{
 late PrayerTimes today;

 Data.fromJson(Map<String,dynamic> json){
  today=(json['timings'] != null ? PrayerTimes.fromJson(json['timings']): null)!;
 }
}

class PrayerTimes{
  late String fajr;
  late String sunRise;
  late String dhuhr;
  late String asr;
  late String maghrib;
  late String isha;
  late String imsak;
  late String midnight;
  late String firstThird;
  late String lastThird;


  PrayerTimes.fromJson(Map<String,dynamic> json){
    fajr=json['Fajr'];
    sunRise=json['Sunrise'];
    dhuhr=json['Dhuhr'];
    asr=json['Asr'];
    maghrib=json['Maghrib'];
    isha=json['Isha'];
    imsak=json['Imsak'];
    midnight=json['Midnight'];
    firstThird=json['Firstthird'];
    lastThird=json['Lastthird'];
  }
}