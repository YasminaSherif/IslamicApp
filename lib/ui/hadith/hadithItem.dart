import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/hadithModel.dart';
import '../../model/quranModel.dart';

class HadithItem extends StatelessWidget{
   final HadithModel hadith;

  const HadithItem({super.key, required this.hadith,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration( 
            color: const Color.fromARGB(255, 240, 229, 207),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Color(0xFF467326),
            width: 4.0)
          ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(hadith.arHadith,textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontWeight: FontWeight.w600
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(hadith.enHadith.narrator+''+hadith.enHadith.text,textAlign: TextAlign.center,
              textDirection: TextDirection.ltr),
            ),
           
          ],
        ),
      ),
    );
  }
}