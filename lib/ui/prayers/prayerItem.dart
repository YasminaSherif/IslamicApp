
import 'package:flutter/material.dart';

import '../../model/prayerModel.dart';

class PrayerItem extends StatelessWidget {
  PrayerModel prayer;
  PrayerItem({required this.prayer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        elevation: 8,
        child: Container(
          padding: EdgeInsets.all(2),
          decoration: BoxDecoration( 
              color: const Color.fromARGB(255, 240, 229, 207),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: Color(0xFF467326),
              width: 2.0)
            ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(prayer.title,textAlign: TextAlign.center,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(prayer.prayer,textAlign: TextAlign.center,
                textDirection: TextDirection.rtl),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
