class AzkarModel {
   late String category;
   late String zekr;
   late int count;
   late String reference;

  

  AzkarModel.fromJson(List<dynamic> json) {
      category = json[0] ;
      zekr = json[1] ;
      count =json[2];
      reference = json[3] ;
  }
}