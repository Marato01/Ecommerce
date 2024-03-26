import 'package:final_exam/Widget/Login_Form.dart';
import 'package:final_exam/Widget/Register_Form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

class onboard extends StatelessWidget {
  const onboard({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: OnBoardingSlider(
        headerBackgroundColor: Colors.white ,
        finishButtonText: 'Register',
        onFinish: (){
          Navigator.push(context, CupertinoPageRoute(builder: (context) => RegisterForm()));
        },
        finishButtonStyle: FinishButtonStyle(
          backgroundColor: Colors.blueGrey
        ),
        skipTextButton: Text ('Skip', style: TextStyle(color: Colors.blueAccent)),
        trailing: Text ('Login', style: TextStyle(color: Colors.blueAccent)),
        trailingFunction: (){
          Navigator.push(context, CupertinoPageRoute(builder: (context) => LoginForm()));
        },
        background: [
          Container(
              margin: EdgeInsets.only(top: 210),
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/images/marketPlace.png', fit: BoxFit.cover,)),
          Container(
              margin: EdgeInsets.only(top: 200),
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/images/delivery.png')),
          Container(
              margin: EdgeInsets.only(top: 150),
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/images/settlement.webp')),
        ],
        totalPage: 3,
        speed: 1.8,
        pageBodies: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                Text('Market for everything', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10,
                ),
                Text('Buy all items in one place with market app.')
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                Text('Fast Delivery', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10,
                ),
                Text('Get your products deliverd at your doorstep in stantly.'),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                Text('Easy Checkouts', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 10,
                ),
                Text('Buy Products online without leaving your comfort.'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
