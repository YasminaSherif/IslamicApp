
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamicapp/ui/prayers/prayerItem.dart';

import '../../cubit/prayerCubit/cubit.dart';
import '../../cubit/prayerCubit/states.dart';
class PrayerHome extends StatefulWidget {


  @override
  State<PrayerHome> createState() => _PrayerHomeState();
}

class _PrayerHomeState extends State<PrayerHome> {
  late PrayerCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit=PrayerCubit();
    cubit.LoadData();
  }
  @override
  Widget build(BuildContext context) {

    return BlocProvider.value(value: cubit,
    child: BlocConsumer<PrayerCubit,PrayerStates>
    ( listener: (context, state) {
      
    },builder: (context, state) {
         if (state is LoadingState) {
            return Center(
              child: CircularProgressIndicator(color:  Color(0xFF467326),),
            );
          } else if (state is LoadedState) {
           
            return Scaffold(
              appBar: AppBar(
        title: Center(child: const Text('أدعيه منوعه' , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),)),
        
        backgroundColor: const Color(0xFF467326),
      ),
              body: ListView.separated(
                itemCount: cubit.prayers.length,
                itemBuilder: (context, index) => PrayerItem(prayer: cubit.prayers[index],),
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 8,
                  );
                },
              ),
            );
          } else if (state is erorrState) {
            return Center(
              child: Text('عفوا حدث خطأ ما من فضلك حاول لاحقا'),
            );
          } else {
            return Center(
              child: Text('Unknown state'),
            );
          }
        
        
}));
}}
    


    


        /*Column(
       children: [
         Container(
           padding: EdgeInsets.only(top: 5 , bottom: 5),
           height: 100,
           margin: EdgeInsets.all(8),
           decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(50.0),
               boxShadow: [
                 BoxShadow(
                   color: Color.fromRGBO(99, 124, 87, 0.5019607843137255),
                   spreadRadius: 7,
                   blurRadius: 7,
                   offset: Offset(0,3),

                 )
               ]
           ),
           child: Card(
             color: Color(0xFFD6F1C2),
             child: Row(
               children: [
                 ListTile(
                   title: Text('الحزن',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                   trailing: CircleAvatar(
                     radius: 55,
                     backgroundImage: AssetImage("assets/images/quran.png"),
                     backgroundColor: Color(0xFFD6F1C2),
                   )

           ),
               ],
             ),),
         ),
                   Card(
                     color: Color(0xFFD6F1C2),
                     child: ListTile(
                       title: Text('االفرح '),

                       trailing:  Container(
                         child: Image.asset('assets/images/quran.png',
                     height: 150,
                     width: 170,
                     )
                     ),
                     ),
                   ),
                   Card(
                     color: Color(0xFFD6F1C2),
                     child: ListTile(
                       title: Text('الشكر'),

                       trailing:  Container(
                         child: Image.asset('assets/images/quran.png',
          height: 150,
          width: 170,
          )
                     ),
                     ),
                   ),
                   Card(
                     color: Color(0xFFD6F1C2),
                     child: ListTile(
                       title: Text('من القرأن'),

                       trailing: Container(
                         child: Image.asset('assets/images/quran.png',
          height: 150,
          width: 170,
          )
                     ),
                     ),
                   ),
       ],
     )*/
/*    );
  }*/
  //0xFFD6F1C2 light green
  //0xFF467326 dark green

/*
}*/
