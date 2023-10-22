
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sebha extends StatefulWidget {
  static String routeName = "Sebha";
  @override
  _SebhaState createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {

  final List<String> words = ["سُبْحَانَ اللَّهِ","الْحَمْدُ لِلَّهِ","لاَ إِلَهَ إِلاَّ اللَّهُ",
    "اللَّهُ أَكبَرُ","أسْتَغْفِرُ اللهَ العَظِيمَ ","وَلاَ حَوْلَ وَلاَ قُوَّةَ إِلاَّ بِاللَّهِ ",
    "اللَّهُمَّ صَلِّ وَسَلِّمْ وَبَارِكْ على نَبِيِّنَا مُحمَّد"];
  int wordIndex = 0; // Index to track the current word
  int count = 0; // Counter for button clicks

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF467326),
       // elevation: 0,
        title: Text('السبحه'),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color(0xFF467326), 
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  height: 300,
                  width: 370,
                  decoration: BoxDecoration(
                       color:  Color.fromARGB(255, 28, 46, 15),
                    borderRadius: BorderRadius.all(Radius.circular(8))
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      
                      Container(
                        height: 270,
                     decoration: BoxDecoration(
                        color: Color.fromARGB(255, 240, 229, 207),
                    borderRadius:BorderRadius.zero
                  ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(words[wordIndex],
                        softWrap: true,
                        maxLines: 3,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Vazirmatn',
                          
                        ),)),
                      Align(
                       alignment: AlignmentDirectional.bottomEnd,
                        child: Image(image: AssetImage("assets/images/corner.png")))
                    ],
                  ),
                ),
              ),
            ),
      
      
          Container(
            alignment: Alignment.center,
            width: 370,
            height: 70,
            
            decoration: BoxDecoration(
              color:  Color.fromARGB(255, 28, 46, 15),
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8),bottomRight: Radius.circular(8))
            ),
            child: Row(
              
              children: [
                Expanded(
                  child: IconButton(onPressed: (){
                     setState(() {
                      count++;
                      if (count >= 33) {
                      count = 0;
                      wordIndex = (wordIndex + 1) % words.length;
                          }
                           });
                  }, icon: Text(count.toString(),style: TextStyle(
                    color:  Color.fromARGB(255, 240, 229, 207),
                  ),
                  ),
                  ),
                ),
                 Expanded(
                   child: Container(
                     child: IconButton(onPressed: (){
                       setState(() {
                        count=0;
                             });
                                   }, icon: Text('اعاده',
                                   style: TextStyle(
                    color:  Color.fromARGB(255, 240, 229, 207),
                    fontFamily: 'Vazirmatn')),
                                   ),
                   ),
                 )
            ]),
          ),

          Center(
            
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(onPressed: (){
                           setState(() {
                            wordIndex = (wordIndex + 1) % words.length;
                             count = 0;
                                 });
                                       }, icon: Icon(Icons.change_circle_outlined,
                                       color: Color.fromARGB(255, 240, 229, 207) ,
                                       size: 50,)
                                       ),
            ),
          ),

      
          ],
        ),
      )

    );
  }
}

/*
Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(20),
                  height: 170,
                  width: 250,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(99, 124, 87, 0.5019607843137255),
                          spreadRadius: 7,
                          blurRadius: 7,
                          offset: Offset(0,3),
                        )
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFFD6F1C2),
                      border: Border.all(
                        color: Color(0xFF467326), // Border color
                        width: 2.0,
                      )
                  ),
                  child: Center(
                    child: Text(
                      words[currentIndex],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 27.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Text(
            ' :عدد المرات $count',
            style: TextStyle(
              fontSize: 23.0,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 20.0),

          ElevatedButton(onPressed: handleButtonClick,
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF467326), // Background color
                onPrimary: Colors.white, // Text color
                padding: EdgeInsets.all(20.0), // Button padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0), // Rounded corners
                ),
              ),
              child: Icon(Icons.add,size: 30,))
        ],
      ),
*/