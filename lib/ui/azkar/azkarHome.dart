

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/azkarCubit/cubit.dart';
import '../../cubit/azkarCubit/states.dart';
import 'azkarList.dart';


class azkarHome extends StatefulWidget{

  @override
  _azkarHome createState() => _azkarHome();
}



class _azkarHome extends State<azkarHome>{
  late AzkarCubit cubit;
  @override 
  void initState(){
    super.initState();
  cubit=AzkarCubit();
  cubit.LoadData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(value: cubit,
    child: BlocConsumer<AzkarCubit,AzkarStates>
    (listener: (context,state) {},
      builder: (context,state) {
   
            return Scaffold(
              appBar: AppBar(
        title: const Text("ألاذكار" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),),
        
        backgroundColor: const Color(0xFF467326),
      ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  elevation: 5,
                  child: Container(
                    color:Color.fromARGB(255, 240, 229, 207),
                    height: 80,
                    alignment: AlignmentDirectional.center,
                    child: ListTile(
                     onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder:(context) => AzkarView(azkarList: cubit.azkarMorning,text: 'أذكار الصباح')));
                      },
                     // leading: Icon(Icons.sunny,color: Colors.amber[700], ),
                      title: Row(
                        children: [Icon(Icons.sunny,color: Colors.amber[700], ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text('أذكار الصباح',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),),
                          ),
                          
                        ],
                      ),

                      trailing: Icon(Icons.navigate_next),
                     ),
                  ),
                  ),
            ),

        Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  elevation: 5,
                  child: Container(
                    color:Color.fromARGB(255, 240, 229, 207),
                    height: 80,
                    alignment: AlignmentDirectional.center,
                    child: ListTile(
                     onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder:(context) => AzkarView(azkarList: cubit.azkarNight,text: 'أذكار المساء')));
                      },
                     // leading: Icon(Icons.sunny,color: Colors.amber[700], ),
                      title: Row(
                        children: [Icon(Icons.mode_night,color: Colors.blueGrey, ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text('أذكار المساء',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),),
                          ),
                          
                        ],
                      ),

                      trailing: Icon(Icons.navigate_next),
                     ),
                  ),
                  ),
            ),

          Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  elevation: 5,
                  child: Container(
                    color:Color.fromARGB(255, 240, 229, 207),
                    height: 80,
                    alignment: AlignmentDirectional.center,
                    child: ListTile(
                     onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder:(context) => AzkarView(azkarList: cubit.azkarSleeping,text: 'أذكار النوم')));
                      },
                     // leading: Icon(Icons.sunny,color: Colors.amber[700], ),
                      title: Row(
                        children: [Icon(Icons.star,color: Color.fromARGB(255, 241, 205, 0), ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text('أذكار النوم',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),),
                          ),
                          
                        ],
                      ),

                      trailing: Icon(Icons.navigate_next),
                     ),
                  ),
                  ),
            ),
            
          ],
        )
            
       
      
      );
  }));
  }}
  
  

