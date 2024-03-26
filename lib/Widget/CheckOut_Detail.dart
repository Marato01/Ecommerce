import 'package:flutter/material.dart';

class CheckDetail extends StatelessWidget {
  const CheckDetail({super.key});

  @override
  Widget build(BuildContext context) {
    var globalkey = GlobalKey<FormState>();


    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Center(
          child: Text('Checkout', style: TextStyle(fontWeight: FontWeight.bold) ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Form(
            key: globalkey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Shipping Address', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    Icon(Icons.mode_edit_outline_outlined)
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 80,
                  child: Row(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.circular(35)
                        ),
                        child: Center(
                          child: Icon(Icons.location_on_outlined, size: 40),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Home', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                          Text('St norodom. Pnhom Penh')
                        ],
                      )
                    ],
                  ),
                ),
                Divider(
                  thickness: 1,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                    child: Text('Add Payment Method', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
                Container(
                  width: double.infinity,
                  height: 100,
                  child: Row(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(35)
                        ),
                        child: Center(
                          child: Icon(Icons.payment_outlined, size: 40),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text('Debit/Credit Card', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                TextFormField(
                  validator: (cardnumber) {
                    if (!validateEmpty(cardnumber.toString())) return null;
                    else return 'Card number must be not empty';
                  },
                  onFieldSubmitted: (_){
                    if (globalkey.currentState!.validate()){
                      globalkey.currentState!.save();
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Card Number',
                    label: Text ('Card Number'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                   Expanded(child: TextFormField(
                     validator: (ExpiryDate) {
                       if (!validateEmpty(ExpiryDate.toString())) return null;
                       else return 'Expiry Date must be not empty';
                     },
                     onFieldSubmitted: (_){
                       if (globalkey.currentState!.validate()){
                         globalkey.currentState!.save();
                       }
                     },
                     decoration: InputDecoration(
                         hintText: 'Expiry Date',
                         label: Text ('Expiry Date'),
                         border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(20)
                         )
                     ),
                   )),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(child: TextFormField(
                      validator: (CVV) {
                        if (!validateEmpty(CVV.toString())) return null;
                        else return 'CVV must be not empty';
                      },
                      onFieldSubmitted: (_){
                        if (globalkey.currentState!.validate()){
                          globalkey.currentState!.save();
                        }
                      },
                      decoration: InputDecoration(
                          hintText: 'CVV',
                          label: Text ('CVV'),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          )
                      ),
                    )),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(25)
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: (){
                        print('Pay Now');
                      },
                      child: Container(
                        child: Center(
                          child: Text('Pay Now', style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
bool validateEmpty (String value) => value.isEmpty? true:false;
