
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamicapp/ui/quran/quranHomeItem.dart';

import '../../cubit/quranCubit/cubit.dart';
import '../../cubit/quranCubit/states.dart';
class quranHome extends StatefulWidget{

  @override
  _quranHome createState() => _quranHome();
}



class _quranHome extends State<quranHome>{
  late quranCubit cubit;
  @override 
  void initState(){
    super.initState();
  cubit=quranCubit();
  cubit.LoadData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(value: cubit,
    child: BlocConsumer<quranCubit,quranStates>
    (listener: (context,state) {},
      builder: (context,state) {
         if (state is loadingState) {
            return Center(
              child: CircularProgressIndicator(color:  Color(0xFF467326),),
            );
          } else if (state is LoadedState) {
           
            return Scaffold(
              appBar: AppBar(
        title: const Text("القرأن الكريم" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),),
        
        backgroundColor: const Color(0xFF467326),
      ),
              body: ListView.separated(
                itemCount: cubit.quran.length,
                itemBuilder: (context, index) => quranHomeItem(surah: cubit.quran[index]),
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
      },
      )
     );
  }
  
  

}