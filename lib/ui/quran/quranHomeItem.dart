
import 'package:flutter/material.dart';

import '../../model/quranModel.dart';
import 'SurahHome.dart';

class quranHomeItem extends StatelessWidget{
   final quranModel surah;

  const quranHomeItem({super.key, required this.surah});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        tileColor: Color.fromARGB(255, 240, 229, 207),
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder:(context) => surahHome(surah: surah,)));
        },
        title: Text(surah.arName,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),),
        subtitle: Text(surah.enName),
        trailing: Text(surah.arType,
        style: TextStyle(
          fontFamily: 'Marhey',
          fontSize: 15,
          fontWeight: FontWeight.bold
        ),),
      ),
    );
  }

}