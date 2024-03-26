import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'BottomNavigationBar.dart';

class LoginForm extends StatefulWidget {
  LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool visibil = true;
  var globlekey = GlobalKey<FormState>();
  var size = SizedBox( height: 20);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  static const String validUsername = 'thavy@gmail.com';
  static const String validPassword = 'thavy123';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20 , top: 50),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/images/store.png'),
                Text('Welcome Back', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                Text('Log in to your account using email or socail Networks', style: TextStyle(fontSize: 13)),
                size,
                Form(
                  key: globlekey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (email) {
                          if (!validateEmpty(email.toString()))
                            return null;
                          else
                            return 'Email must be not empty';
                        },
                        onFieldSubmitted: (_){
                          if(globlekey.currentState!.validate()){
                            globlekey.currentState!.save();
                          }
                        },
                        controller: emailController,
                        decoration: InputDecoration(
                          hintText: 'email',
                          label: Text('email'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                      ),
                      size,
                      TextFormField(
                        validator: (password){
                          if(!validateEmpty(password.toString()))
                            return null;
                          else
                            return 'Password must be not empty';
                        },
                        onFieldSubmitted: (_){
                          if (globlekey.currentState!.validate()){
                            globlekey.currentState!.save();
                          }
                        },
                        controller: passwordController,
                        decoration: InputDecoration(
                          hintText: 'password',
                          label: Text('password'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          prefixIcon: Icon(Icons.key_outlined),
                          suffixIcon: GestureDetector(
                            onTap: (){
                              setState(() {
                                visibil = !visibil;
                              });
                            },
                            child: Icon( visibil ? Icons.visibility_off : Icons.visibility,
                              color: Colors.black,),
                          ),
                        ),
                        obscuringCharacter: '*',
                        obscureText: visibil,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: RichText(
                      text: TextSpan(
                        text: 'Forget Password',
                        style: TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer() ..onTap =(){}
                      )),
                ),
                size,
                // validate user for login
                GestureDetector(
                  onTap: () {
                    if (emailController.text == validUsername && passwordController.text == validPassword){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>BottomNagivation()));
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Login Successful')));
                    }else{
                     showDialog(context: context,
                         builder: (BuildContext context) {
                       return AlertDialog(
                         title: Center(child: Text ('Incorrect User')),
                         actions: [
                           FloatingActionButton(
                             child: Text('OK'),
                               onPressed: () {
                                 Navigator.of(context).pop();
                               }),
                         ],
                       );
                         });
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueGrey,
                    ),
                    child: Center(
                      child: Text ('Login',
                      style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  ),
                ),
                Divider(
                  thickness: 1,
                ),
                Text('Or login with'),
                size,
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blueGrey
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/images/apple.png'),
                      Text('Login with Apple'),
                      Icon(Icons.navigate_next),
                    ],
                  ),
                ),
                size,
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueGrey
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/images/google.png'),
                      Text('Login with Google'),
                      Icon(Icons.navigate_next),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  bool validateEmpty(String value) => value.isEmpty ? true : false;
}
