import 'package:flutter/material.dart';

import '../models/catagory.dart';

class Catagory extends StatelessWidget {
  Catagory({
    this.catagory
  });

  Datum? catagory;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 90,
      child: Column(
        children: [
          InkWell(
            onTap: (){
              print('Catagory');
            },
            child: Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(45),
                  child: catagory!.attributes!.iconUrl==""? Image.asset('assets/images/handbag.webp'):Image.network(catagory!.attributes!.iconUrl!),),
            ),
          ),
          catagory!.attributes!.title==""? Text('Null') : Text(catagory!.attributes!.title.toString(), style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}