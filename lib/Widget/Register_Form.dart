import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {

  bool visibil = true;
  var globlekey = GlobalKey<FormState>();
  var size = SizedBox( height: 20);

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
                Text('Create New Account', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                Text('Looks like you dont have an account \n     or connect with socail netword', style: TextStyle(fontSize: 13)),
                size,
                Form(
                  key: globlekey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (username) {
                          if (!validateEmpty(username.toString()))
                            return null;
                          else
                            return 'username must be not empty';
                        },
                        onFieldSubmitted: (_){
                          if(globlekey.currentState!.validate()){
                            globlekey.currentState!.save();
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'username',
                          label: Text('username'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          prefixIcon: Icon(Icons.person_outline),
                        ),
                      ),
                      size,
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
                      size,
                      TextFormField(
                        validator: (confirm){
                          if(!validateEmpty(confirm.toString()))
                            return null;
                          else
                            return 'Confirm Password must be not empty';
                        },
                        onFieldSubmitted: (_){
                          if (globlekey.currentState!.validate()){
                            globlekey.currentState!.save();
                          }
                        },
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          label: Text('Confirm Password'),
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
                size,
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blueGrey,
                  ),
                  child: Center(
                    child: Text ('SignUp',
                      style: TextStyle(fontWeight: FontWeight.bold),),
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
