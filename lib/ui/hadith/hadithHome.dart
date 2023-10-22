
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/hadithCubit/cubit.dart';
import '../../cubit/hadithCubit/states.dart';
import 'hadithItem.dart';

class HadithHome extends StatefulWidget{

  @override
  _HadithHome createState() => _HadithHome();
}



class _HadithHome extends State<HadithHome>{
  late HadithCubit cubit;
  @override 
  void initState(){
    super.initState();
  cubit=HadithCubit();
  cubit.LoadHadith();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(value: cubit,
    child: BlocConsumer<HadithCubit,HadithStates>
    (listener: (context,state) {},
      builder: (context,state) {
         if (state is LoadingState) {
            return Center(
              child: CircularProgressIndicator(color:  Color(0xFF467326),),
            );
          } else if (state is LoadedState) {
           
            return Scaffold(
              appBar: AppBar(
        title: const Text('ألاربعون القدسيه' , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20),),
               backgroundColor: const Color(0xFF467326),
      ),
              body: ListView.separated(
                itemCount: cubit.allHadiths.length,
                itemBuilder: (context, index) => HadithItem(hadith: cubit.allHadiths[index]),
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