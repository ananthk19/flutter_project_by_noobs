import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_project_by_noobs/routes/customerRoute.dart';
import 'package:flutter_project_by_noobs/routes/customer_registration_form.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class customer_login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Customer_signIn();
  }

}

class Customer_signIn extends State<customer_login>{
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Customer Login"),
      ),
      body: Stack(
        children:<Widget> [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg3.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget> [
                Padding(
                  padding: EdgeInsets.all(20),
                  child:Container(
                    width: MediaQuery.of(context).size.width*0.8,
                    height: MediaQuery.of(context).size.height*0.35 ,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(15),

                        gradient: LinearGradient(
                          colors: [Colors.white.withOpacity(0.7),
                            Colors.white.withOpacity(0.6)]
                          ,)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:<Widget> [
                        Container(
                          padding: const EdgeInsets.only(left: 15,right: 15),
                          child: TextField(
                            controller: emailController,

                            decoration: const InputDecoration(
                              labelText: 'Email',
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
                          child: TextField(
                            obscureText: true,
                            controller: passwordController,
                            decoration: const InputDecoration(
                              labelText: 'Password',
                            ),
                          ),
                        ),
                        Container(
                            height: 60,
                            padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                            child: ElevatedButton(
                              child: const Text('Login'),
                              onPressed: () async{
                                dynamic result = await signIn();
                                if(result == null){
                                  Fluttertoast.showToast(
                                      msg: "Login Failed",
                                      toastLength: Toast.LENGTH_LONG);
                                  emailController.clear();
                                  passwordController.clear();

                                }

                                else{
                                  Fluttertoast.showToast(
                                      msg: "Login Success",
                                      toastLength: Toast.LENGTH_LONG);
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  prefs.setString("email", emailController.text);
                                  Navigator.pushNamed(context,'/customerHome');

                                }
                              },
                            )
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context,'/register');
                                },
                                child: const Text('Register'),

                              ),
                              TextButton(
                                onPressed: () {  },
                                child: const Text('Forgot Password?'),

                              ),],
                          ),)

                      ],
                    ),
                  ),
                )

              ],
            ),
          )
        ],
      ),
    );
  }
  Future signIn() async{
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    try{
      if(emailController != null && passwordController != null){
        UserCredential authresult = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email,
            password: password);

        return authresult.user;}
    }catch(e){
          return null;
      }


    }


  }

