

import 'package:flutter/material.dart';
import '../../model/azkarModel.dart';


class AzkarItem extends StatefulWidget {

   AzkarModel zekr;
   AzkarItem({required this.zekr});

  @override
  State<AzkarItem> createState() => _AzkarItemState();
}

class _AzkarItemState extends State<AzkarItem> {
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
              child: Text(widget.zekr.zekr,textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: CircleAvatar(
                  radius: 26,
                  backgroundColor:Colors.white,
                  child: ElevatedButton(
                    onPressed: (){
                      if(widget.zekr.count> 0){
                        setState(() {
                          widget.zekr.count--;
                        });
                      }
                    },
                    child: Text("${widget.zekr.count}",
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 14
                    )),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(), 
                      minimumSize: Size(60.0, 60.0), 
                      backgroundColor: Color(0xFF467326),
                    ),
                  )
              ),
            )
           
          ],
        ),
      ),
    );
  }
}
