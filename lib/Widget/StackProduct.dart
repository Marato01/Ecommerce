import 'package:final_exam/models/Product.dart';
import 'package:flutter/material.dart';
import 'Card.dart';

class StackProduct extends StatelessWidget {
  StackProduct({
    this.attributes
  });
  DatumAttributes? attributes;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * .42,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // color: Colors.blueGrey,
          ),
          child: InkWell(
            onTap: (){
              DatumAttributes data = new DatumAttributes(title: attributes!.title, description: attributes!.description, price: attributes!.price, thumbnail: attributes!.thumbnail!);
              Route route = MaterialPageRoute(builder: (context) => CardDetail(data: data,));
              Navigator.push(context, route);
            },
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * .42,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: 'https://cms.istad.co${attributes!.thumbnail!}' == null ? Image.asset('assets/images/handbag.webp') :Image.network('https://cms.istad.co${attributes!.thumbnail!.data!.attributes!.url!}')),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .42,
                  child: Column(
                    children: [
                      attributes!.title == null ? const Text("No Title"): Text(attributes!.title!, style: TextStyle(fontWeight: FontWeight.bold)),
                      attributes!.description == null ? const Text('No Description'): Text(attributes!.description!, maxLines: 1,),
                      attributes!.price! == null ? const Text('No price'): Text(attributes!.price!, style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
