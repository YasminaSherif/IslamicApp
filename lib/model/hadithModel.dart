

class HadithModel{
  late int id;
  late String arHadith;
  late EnHadith enHadith;
  HadithModel.fromJson(Map<String,dynamic> json){
    id=json['id'];
    arHadith=json['arabic'];
    enHadith=EnHadith.fromJson(json['english']);
  }

}

class EnHadith{
  late String narrator;
  late String text;


  EnHadith.fromJson(Map<String,dynamic> json){
    narrator=json['narrator'];
    text=json['text'];
  }
}