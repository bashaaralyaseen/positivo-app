import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/hidden_drawer.dart';
import 'package:flutter_application_1/models/product.dart';
import 'package:flutter_application_1/screens/home_screen.dart';

import 'terms.dart';
 

class login extends StatefulWidget {
  @override
  State<login> createState() => _LoginState();
}

class _LoginState extends State<login> {
  late String email;
  late String password;
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

  void signIn() async {
    if (_formKey.currentState!.validate()) {
      try {
        final newUser = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HiddenDrawer()),
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Sign-In Error'),
              content: Text('An error occurred during sign-in.'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
        leading: Icon(Icons.person),
      ),
      backgroundColor: Colors.lightGreen[100],
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 30),
                  Text('Please enter your email'),
                  SizedBox(height: 20),
                  TextFormField(
                    onChanged: (value) {
                      email = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      labelText: 'Email',
                      hintText: 'example@gmail.com',
                    ),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    onChanged: (value) {
                      password = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      labelText: 'Password',
                      hintText: '*****',
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child:Row(
                      children: [
                        Radio(
                          value: "accept", 
                          groupValue: "accept", 
                          onChanged: (value){
                            print(value); //selected value
                                      }
                                    ),

                        TextButton(
                      onPressed: (){
                         Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TermsPage()),
        );
                      }, 
                    child: Text("Terms and Conditions",style: TextStyle(color:Colors.blue),)
                    
                    ),

                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: signIn,
                    child: Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Text('Sign In'),
                    ),
                  ),
                  SizedBox(height: 30),
                  InkWell(
                    child: Text(
                      'New member? Please create an account',
                      style: TextStyle(color: Colors.lightGreen[400]),
                    ),
                    onTap: () {
                      // Handle registration navigation or form display here
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
