class PrayerModel {
   late String title;
   late String prayer;

  PrayerModel.fromJson(List<dynamic> json) {
      title = json[0] ;
      prayer = json[1] ;

  }
}