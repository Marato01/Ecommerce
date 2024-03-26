import 'package:flutter/material.dart';
import 'Home_Page.dart';

class Profile_Page extends StatelessWidget {
  const Profile_Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 290,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    child: Image.asset('assets/images/color.webp', fit: BoxFit.cover)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.keyboard_return_rounded, color: Colors.white),
                    Text('Profile', style: TextStyle(color: Colors.white, fontSize: 20)),
                    Icon(Icons.settings, color: Colors.white)
                  ],
                ),
              ),
              Positioned(
                right: 150,
                bottom: 40,
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.blue
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset('assets/images/profile.jpg', fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text('Sam sothavy', style: TextStyle(fontSize: 18, color: Colors.white),),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Icon(Icons.email_outlined),
            title: Text('Thavy@gmail.com'),
          ),
          Divider(
            thickness: 1,
          ),
          ListTile(
            leading: Icon(Icons.phone_android_outlined),
            title: Text('123 456 789'),
          ),
          Divider(
            thickness: 1,
          ),
          ListTile(
            leading: Icon(Icons.facebook),
            title: Text('www.facebook.com'),
          ),
          Divider(
            thickness: 1,
          ),
          ListTile(
            leading: Icon(Icons.telegram),
            title: Text('123 456 789'),
          ),
          Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
