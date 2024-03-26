import 'package:flutter/material.dart';

import 'CardView.dart';
import 'CheckOut_Detail.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  var size =  SizedBox(
    height: 10);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text('My Card', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 490,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 10,
                  itemBuilder: (context, index) => CardView()),
            ),
            Divider(
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Item Total'),
                      Text('Price'),
                    ],
                  ),
                  size,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Discount'),
                      Text('Price'),
                    ],
                  ),
                  size,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Delivery Fee', style: TextStyle(color: Colors.blueGrey)),
                      Text('Free', style: TextStyle(color: Colors.blueGrey)),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  size,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Grand Total', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Price'),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blueGrey
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CheckDetail()));
                    },
                    child: Container(
                      child: Center(
                        child: Text('Checkout', style: TextStyle(color: Colors.white, fontSize: 18)),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}

