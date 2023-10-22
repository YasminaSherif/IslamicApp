class quranModel{

  late int id;
  late String arName;
  late String enName;
  late String enNameTranslated;
  late int numberOfWords;
  late int numberOfLetters;
  late String arType;
  late String enType;
  late String arSoura;
  late String enSoura;


  quranModel.fromJson(Map<String,dynamic> json){
    id=json['id'];
    arName=json['name'];
    enName=json['name_en'];
    enNameTranslated=json['name_translation'];
    numberOfWords=json['words'];
    numberOfLetters=json['letters'];
    arType=json['type'];
    enType=json['type_en'];
    arSoura=json['ar'];
    enSoura=json['en'];


  }

}