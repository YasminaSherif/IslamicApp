import 'package:flutter/material.dart';

import 'azkarItem.dart';

class AzkarView extends StatelessWidget {
  late String text;
  List azkarList;
   AzkarView({required this.azkarList,required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF467326),
        title: Text(text),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
       
        child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: azkarList.length,
                    itemBuilder: (context , index){
                      return AzkarItem(zekr: azkarList[index],);
                    }
                ),
              ),
            ],
          
        ),
      ),
    );

  }
}
