import 'package:final_exam/Data/Response/Status.dart';
import 'package:final_exam/Skeleton/Catagory_Skeleton.dart';
import 'package:final_exam/viewModel/catagory_VM.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Catagory.dart';
import 'Grid_Product.dart';
import 'Profile_Page.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  var size = SizedBox(height: 20);
  var width = SizedBox(width: 10);
  final List SizeItem =[
    'S',
    'M',
    'L',
    'XL',
  ];
  int currentsize = 0;

  final List FilterCatagory=[
    'T-Shirt',
    'Wallets',
    'Belt Bags',
    'Business Bags',
    'Travel Bags',
    'Shirt',
  ];
  int currentCatagory = 0;

  List<Color> Clrs = [
    Colors.red,
    Colors.grey,
    Colors.blue,
    Colors.indigo,
    Colors.orange
  ];
  int currentColors = 0;

  static double _lowerValue = 1.0;
  static double _upperValue = 10.0;
  RangeValues values = RangeValues(_lowerValue, _upperValue);
  Color boxcolor = Colors.red;
  var catagoryViewModel =  CatagoryViewModel();

  @override
  void initState() {
    super.initState();
    catagoryViewModel.getAllCatagory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 81,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Hey', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                        Image.asset('assets/images/waving.png')
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Profile_Page()));
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                          child: Image.asset('assets/images/profile.jpg', fit: BoxFit.cover,)),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Let\'s fine your\nItem you want',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              size,
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Align(
                   alignment: Alignment.centerLeft,
                   child: Container(
                     width: MediaQuery.of(context).size.width *.70,
                     height: 50,
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                         color: Colors.white12,
                       border: Border.all(color: Colors.black)
                     ),
                     child: Align(
                       alignment: Alignment.centerLeft,
                         child: Image.asset('assets/images/search.png')),
                   ),
                 ),
                 Container(
                   width: 50,
                   height: 50,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(10),
                     color: Colors.blueGrey,
                   ),
                   child: Material(
                     color: Colors.transparent,

                     //Bottomsheet
                     child: InkWell(
                       onTap: (){
                         showBottomSheet(context: context,
                             builder: (BuildContext context) {
                           return SingleChildScrollView(
                             child: Container(
                               width: double.infinity,
                               height: MediaQuery.of(context).size.height * .90,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                               ),
                               child: Padding(
                                 padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text('Filter', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                                     size,
                                     Text('Catagory', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                                     StatefulBuilder(
                                      builder: (context, state){
                                        return SizedBox(
                                          height: 50,
                                          child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: FilterCatagory.length,
                                              itemBuilder: (ctx, index){
                                                return GestureDetector(
                                                  onTap: (){
                                                    state((){});
                                                    setState(() {
                                                      currentCatagory = index;
                                                    });
                                                  },
                                                  child: AnimatedContainer(
                                                    duration: Duration(milliseconds: 300),
                                                    margin: EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                      color: currentCatagory==index? Colors.red: Colors.transparent,
                                                      border: Border.all(color: Colors.black),
                                                      borderRadius: BorderRadius.circular(10),
                                                    ),
                                                    child: Center(
                                                      child: Text(FilterCatagory[index]),
                                                    ),
                                                  ),
                                                );
                                              }),
                                        );
                                      },
                                     ),

                                     Divider(
                                       thickness: 1,
                                     ),
                                     size,
                                     Text('Size', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                     size,
                                     StatefulBuilder(
                                       builder: (context, state){
                                         return SizedBox(
                                           height: 50,
                                           child: ListView.builder(
                                               scrollDirection: Axis.horizontal,
                                               itemCount: SizeItem.length,
                                               itemBuilder: (ctx, index){
                                                 return GestureDetector(
                                                   onTap: (){
                                                     state((){});
                                                     setState(() {
                                                       currentsize = index;
                                                     });
                                                   },
                                                   child: AnimatedContainer(
                                                     duration: Duration(milliseconds: 300),
                                                     margin: EdgeInsets.all(5),
                                                     width: 50,
                                                     height: 100,
                                                     decoration: BoxDecoration(
                                                       color: currentsize==index? Colors.red: Colors.transparent,
                                                       border: Border.all(color: Colors.black),
                                                       borderRadius: BorderRadius.circular(10),
                                                     ),
                                                     child: Center(
                                                       child: Text(SizeItem[index]),
                                                     ),
                                                   ),
                                                 );
                                               }),
                                         );
                                       },
                                     ),
                                     Divider(
                                       thickness: 1,
                                     ),
                                     size,
                                     Text('Color', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                     SizedBox(
                                       height: 20,
                                     ),
                                    SizedBox(
                                      height: 50,
                                      child: GestureDetector(
                                        onTap: (){
                                          setState(() {
                                          });
                                        },
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: Clrs.length,
                                            itemBuilder: (context, index){
                                          return Container(
                                            margin: EdgeInsets.all(5),
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(25),
                                              color: Clrs[index]
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                     Divider(
                                       thickness: 1,
                                     ),
                                     size,
                                     SizedBox(
                                       height: 20,
                                     ),
                                     Text('Price Range', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                                     StatefulBuilder(
                                       builder: (context, state){
                                         return RangeSlider(
                                           activeColor: Colors.red,
                                           inactiveColor: Colors.blueGrey,
                                           labels: RangeLabels(values.start.toString(), values.end.toString()),
                                           min: _lowerValue,
                                           max: _upperValue,
                                           values: values,
                                           onChanged: (val){
                                             print(val);
                                             state((){

                                             });
                                             setState(() {
                                               values = val;
                                             });
                                           },
                                         );
                                       },
                                     ),
                                     size,
                                     Container(
                                       width: double.infinity,
                                       height: 50,
                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(20),
                                         color: Colors.blueGrey
                                       ),
                                       child: Center(
                                         child: Text('Apply' , style: TextStyle(fontSize: 20)),
                                       ),
                                     )
                                   ],
                                 ),
                               ),
                             ),
                           );
                             });
                       },
                       child: Container(
                         child: Center(
                           child: Image.asset('assets/images/filter.png', width: 25, height: 25,),
                         ),
                       ),
                     ),
                   ),
                 ),
               ],
             ),
              size,
              Align(
                alignment: Alignment.centerLeft,
                  child: Text('Top Catagory', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)),
              size,
              SizedBox(
                height: 150,
                child: ChangeNotifierProvider(
                  create: (context) => catagoryViewModel,
                  child: Consumer<CatagoryViewModel>(
                    builder: (context, viewModel, _){
                      switch(viewModel.response.status!){
                        case Status.LOADING:
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 5,
                              itemBuilder: (context, index) => CatagorySkeleton());
                        case Status.COMPLETED:
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: viewModel.response.data!.data.length,
                              itemBuilder: (context, index) {
                                var catagory = viewModel.response.data!.data![index];
                                return Catagory( catagory: catagory );
                              }
                          );
                        case Status.ERROR:
                          return Text('Error');
                      }
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                  child: Text('Popular Products', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
              GridProduct(),
            ],
          ),
        ),
      ),
    );
  }
}






