import 'package:flutter/material.dart';

class CardView extends StatefulWidget {
  const CardView({
    super.key,
  });

  @override
  State<CardView> createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        margin: EdgeInsets.only(top: 20),
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blueGrey
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, top: 8, bottom: 8),
          child: Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset('assets/images/profile.jpg', fit: BoxFit.cover,)),
              SizedBox(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Product Name', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  Text('Size', style: TextStyle(fontSize: 18),),
                  Text('Price', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: 130,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/images/minus.png'),
                      Text('Value', style: TextStyle(fontWeight: FontWeight.bold)),
                      Image.asset('assets/images/plus.png')
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
