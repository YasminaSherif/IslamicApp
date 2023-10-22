
import 'package:flutter/material.dart';
import 'package:islamicapp/ui/quran/quranHome.dart';
import '../cubit/homeCubit/cubit.dart';
import '../cubit/homeCubit/states.dart';
import 'azkar/azkarHome.dart';
import 'hadith/hadithHome.dart';
import 'prayers/PrayerHome.dart';
import 'sebha/Sebha.dart';

import 'package:flutter_bloc/flutter_bloc.dart';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late homeCubit c;

  @override
  void initState() {
    super.initState();
   c=homeCubit();
   
    c.GetPrayerTimes();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
     value: c,
      child: BlocConsumer<homeCubit,homeStates>(
        listener:(context, state) {
          
        },
        builder:(context, state) {
          return Scaffold(
        
        appBar: AppBar(
          backgroundColor: Color(0xFF467326),
         // title: const Text(' أسلاميات'),
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(Icons.mosque_rounded),
              Text('أسلاميات',
              style: TextStyle(
                fontSize: 22,
              ),)
            ],
          ),
          elevation: 0 ,
          leadingWidth: 125,
        ),
        
        body:
        
        (!(state is succsesState)) ?
        Center(child: CircularProgressIndicator(color: Color(0xFF467326),))
       : Column(
         
          children: [
             Stack(
              clipBehavior: Clip.none,
               children: [
                 Container(
                      alignment: AlignmentDirectional.topCenter,
                      child: Container(
                        width: double.infinity,
                        height: 80,
                        decoration: const BoxDecoration(
                          color: Color(0xFF467326),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                    )
                    ,
                 Positioned(
                  top: 25,
                  right: 70,       
                   child: SizedBox(
                               height: 100,
                               width: 350,
                              
                               child: Stack(
                               
                                 children:[ 
                  Card(
                    elevation: 7,
                    shadowColor: Colors.grey.shade100,
                    child: Container(
                     height: 100,
                     width: 350,
                     color: Colors.white,
                                   ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const Icon(Icons.nights_stay,color: Color.fromARGB(255, 0, 32, 216),),
                            const Text('الفجر',
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            )),
                            Text(c.prayerTime.data.today.fajr.toString()),
                          ],
                        ),
                        Column(
                          children: [
                            const Icon(Icons.sunny,color: Colors.amber,),
                            const Text('الصبح',
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            )),
                            Text(c.prayerTime.data.today.sunRise.toString()),
                          ],
                        ),
                        Column(
                          children: [
                            const Icon(Icons.wb_sunny_sharp,color: Colors.deepOrange,),
                            const Text('الضهر',
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                              )),
                            Text(c.prayerTime.data.today.dhuhr.toString()),
                          ],
                        ),Column(
                          children: [
                            const Icon(Icons.cloud_sharp,color: Color.fromARGB(255, 155, 224, 245),),
                            const Text('العصر',style: TextStyle(
                              fontWeight: FontWeight.bold
                              )),
                            Text(c.prayerTime.data.today.asr.toString()),
                          ],
                        ),
                        Column(
                          children: [
                            const Icon(Icons.mode_night,color: Colors.blueGrey,),
                            const Text('المغرب',
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                              )),
                            Text(c.prayerTime.data.today.maghrib.toString()),
                          ],
                        ),
                        Column(
                          children: [
                            const Icon(Icons.star,color: Color.fromARGB(255, 241, 205, 0),),
                            const Text('العشاء',style: TextStyle(
                              fontWeight: FontWeight.bold
                              )),
                            Text(c.prayerTime.data.today.isha.toString()),
                          ],
                        ),
                      ],
                    ),
                                 )
                        ],
                        ),
                             ),
                 )

               ],
             ),
             SizedBox(
              height:60,
             ),

             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  
                  height: 250,
                  child: Column(
                    children: [
                      Expanded(
                        child: Card(
                            elevation: 8,
                            shadowColor: Colors.grey.shade100,
                          child: Container(
                            color: Color.fromARGB(255, 240, 229, 207),
                            width: 200,
                            alignment: AlignmentDirectional.center,
                            child: ListTile(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>quranHome()));
                              },
                             tileColor:  Color.fromARGB(255, 240, 229, 207),
                              title: Text('القرأن الكريم',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold
                              ),),
                              subtitle: Text('The Holy Quran'),
                              trailing: Image(
                              image: AssetImage("assets/images/book.png"),
                              fit: BoxFit.cover,
                              //width: 90,
                              //height: 100,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          elevation: 8,
                            shadowColor: Colors.grey.shade100,
                          child: Container(
                          //  height: 100,
                            color: Color.fromARGB(255, 240, 229, 207),
                                   
                            width: 200,
                            alignment: AlignmentDirectional.center,
                            child: ListTile(
                              onTap: (){
                                 Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => PrayerHome()));
                              },
                              title: Text('أدعيه',
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),),
                              subtitle: Text('Prayers'),
                              trailing: Image(
                              image: AssetImage("assets/images/duaa.png"),
                              fit: BoxFit.cover,
                              width: 60,
                              height: 100,),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 250,
                   child: Column(
                    children: [
                      Expanded(
                        child: Card(
             
                          elevation: 8,
                            shadowColor: Colors.grey.shade100,
                          child: Container(
                            color: Color.fromARGB(255, 240, 229, 207),
             
                           // height: 100,
                            width: 200,
                            alignment: AlignmentDirectional.center,
                            child: ListTile(
                              onTap: (){
                                 Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => azkarHome()));
                              },
                              title: Text('الأذكار',style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),),
                              subtitle: Text('Azkar'),
                              trailing: Image(
                              image: AssetImage("assets/images/man.png"),
                              fit: BoxFit.cover,
                              width: 100,
                              height: 100,),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          elevation: 8,
                            shadowColor: Colors.grey.shade100,
                          child: Container(
                            color: Color.fromARGB(255, 240, 229, 207),
             
                          //  height: 100,
                            width: 200,
                            alignment: AlignmentDirectional.center,
                            child: ListTile(
                              onTap: (){
                                 Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => Sebha()));
                              },
                              title: Text('السبحه',style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),),
                              subtitle: Text('Rosary'),
                              trailing: Image(
                              image: AssetImage("assets/images/sebhaa.png"),
                              fit: BoxFit.cover,
                              width: 90,
                              height: 90,),
                            ),
                          ),
                        ),
                      ),
                    ],
                                 ),
                 ),
             
              ],
             ),
            
             Expanded(
               child: Container(
                width: 415,
                 child: Card(
                                  elevation: 8,
                                  shadowColor: Colors.grey.shade100,
                                child: Container(
                                  color: Color.fromARGB(255, 240, 229, 207),
                                  width: 200,
                                  alignment: AlignmentDirectional.center,
                                  child: ListTile(
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HadithHome()));
                                    },
                                   tileColor:  Color.fromARGB(255, 240, 229, 207),
                                    title: Text(' ألاحاديث',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold
                                    ),),
                                    subtitle: Text('Ahadith'),
                                    trailing: Image(
                                    image: AssetImage("assets/images/hadith.png"),
                                    fit: BoxFit.contain,
                                    width: 100,
                                    height: 100,),
                                  ),
                                ),
                              ),
               ),
             ),
            
          ],
        ),

    );

        }, 
      ));
  }
}


/*
Expanded(
               child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Container(
                      //margin: const EdgeInsets.all(8),
                     /* decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFFD6F1C2),
                          border: Border.all(
                            color: const Color(0xFF467326), // Border color
                           width: 2.0,
                         ),
                          boxShadow: const [
                            BoxShadow(
                              color:
                              Color.fromRGBO(99, 124, 87, 0.5019607843137255),
                              spreadRadius: 7,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            )
                          ]),*/
                      height: 80,
                      child: ListTile(
                        
                        onTap: () {
                           Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => prayerCate()));
                        },
                        title: const Text(
                          "الادعيه المختاره",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        
                        //leading: Text(""),
                        trailing: const Image(
                          image: AssetImage("assets/images/pray.png"),
                          fit: BoxFit.cover,
                          width: 125 ,
                          ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Card(
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xFFD6F1C2),
                            border: Border.all(
                              color: const Color(0xFF467326), // Border color
                              width: 2.0,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color:
                                Color.fromRGBO(99, 124, 87, 0.5019607843137255),
                                spreadRadius: 7,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              )
                            ]),
                        height: 80,
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => Sebha()));
                          },
                          title: const Text(
                            "السبحه الالكترونيه",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          //leading: Text(""),
                          trailing: Container(
                            child: const CircleAvatar(
                              radius: 55,
                              backgroundImage: AssetImage("assets/images/trial.png"),
                              backgroundColor: Color(0xFFD6F1C2),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Card(
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: const Color(0xFFD6F1C2),
                            border: Border.all(
                              color: const Color(0xFF467326), // Border color
                              width: 2.0,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color:
                                Color.fromRGBO(99, 124, 87, 0.5019607843137255),
                                spreadRadius: 7,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              )
                            ]),
                        height: 80,
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => AzkarHome()));
                          },
                          title: const Text(
                            "الاذكار",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          //leading: Text(""),
                          trailing: Container(
                            child: const CircleAvatar(
                              radius: 55,
                              backgroundImage: AssetImage("assets/images/hand.png"),
                              backgroundColor: Color(0xFFD6F1C2),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
                         ),
             ),
*/





