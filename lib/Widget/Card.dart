import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';
import '../models/Product.dart';

class CardDetail extends StatefulWidget {
  final DatumAttributes data;
  CardDetail({required this.data});


  @override
  State<CardDetail> createState() => _CardState();
}
class _CardState extends State<CardDetail> {
  var sizewidth = SizedBox( width: 10);
  final List SizeItem =[
    'S',
    'M',
    'L',
    'XL',
  ];
  int current = 0;
  int number = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: const Text('Product Detail', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .40,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(35),
                      bottomRight: Radius.circular(35),
                  ),
                    child: Image.network('https://cms.istad.co${widget.data.thumbnail!.data!.attributes!.url}',fit: BoxFit.cover,)),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     RatingBar.builder(
                        initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 0.10),
                          itemBuilder: (context, _) => Icon(Icons.star_border_outlined, color: Colors.amber),
                          onRatingUpdate: (rating){
                          print(rating);
                          }),
                    Container(
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(20),
                                onTap: (){
                                  setState(() {
                                    if (number < 2){
                                      number==2;
                                    }else{
                                      number--;
                                    }
                                  });
                                },
                                child: Container(
                                  child: Image.asset('assets/images/minus.png'),
                                ),
                              ),
                            ),
                          ),
                          Text(number.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Material(
                              color: Colors.transparent,
                              child: InkWell(
                                  borderRadius: BorderRadius.circular(20),
                                onTap: (){
                                  setState(() {
                                    number++;
                                  });
                                },
                                child: Container(
                                  child: Image.asset('assets/images/plus.png'),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
             SizedBox(
               height: 20,
             ),
             Container(
               alignment: Alignment.centerLeft,
               width: double.infinity,
               height: 60,
               child: Padding(
                 padding: const EdgeInsets.only(left: 20, right: 20),
                 child: Column(
                   children: [
                     Text('${widget.data.title}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                     Text('${widget.data.price}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                   ],
                 ),
               ),
             ),
              SizedBox(
                height: 20,
              ),
              Divider(
              thickness: 1,
              ),
             Padding(
               padding: const EdgeInsets.only(left: 20),
               child: Align(
                 alignment: Alignment.centerLeft,
                   child: Text('Description', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18))),
             ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: ReadMoreText('${widget.data.description}',
                  trimLines: 2,
                    colorClickableText: Colors.red,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: '  show more',
                    trimExpandedText: '   show less',
                    moreStyle: TextStyle(fontSize: 14,color: Colors.blue),
                  ),
                ),
              ),
              Divider(
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Select Size', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                            itemCount: SizeItem.length,
                            itemBuilder: (ctx, index){
                          return GestureDetector(
                            onTap: (){
                              setState(() {
                                current = index;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: EdgeInsets.all(5),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: current == index? Colors.red : Colors.grey,
                              ),
                              child: Center(
                                child: Text(SizeItem[index]),
                              ),
                            ),
                          );
                        }),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){

                      },
                      child: Container(
                        child: Icon(
                          Icons.favorite_border, size: 30,),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width* .70,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: (){

                          },
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.shopping_cart, color: Colors.white),
                                Text('Add to Card', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
