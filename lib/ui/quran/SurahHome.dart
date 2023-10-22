import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/quranModel.dart';

class surahHome extends StatefulWidget{
   final quranModel surah;

  const surahHome({super.key, required this.surah,});

  @override
  State<surahHome> createState() => _surahHomeState();
}

class _surahHomeState extends State<surahHome> {
  List<String> fontFamilies = [
  'Marhey',
  'Vazirmatn',
  'NotoNas',
   ];

    String selectedFont='Vazirmatn';
    int previous=0;
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(8),
         
          decoration: BoxDecoration( 
            color: const Color.fromARGB(255, 240, 229, 207),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Color(0xFF467326),
            width: 4.0)
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      
                    onPressed:(){
                      setState(() {
                    
                        int index=fontFamilies.indexOf(selectedFont);
                         selectedFont = fontFamilies[(index+1)%fontFamilies.length];
                         
                      });
                    }, icon: const Icon(Icons.font_download_outlined,color: Color(0xFF467326),),
                    
                     ),

                  ],
                ),
                Text(widget.surah.arName,
                     style: TextStyle(
                      fontSize: 20,
                      fontFamily: selectedFont,
                      fontWeight: FontWeight.bold
                ),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.surah.arSoura,
                  textAlign: TextAlign.center,
                  style:  TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontFamily: selectedFont,
                    height: 2,
                  ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.surah.enSoura,textAlign: TextAlign.center,
                  style:  TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                   // fontFamily: selectedFont
                  ),),
                )
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}