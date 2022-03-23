import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class customer_registration_form extends StatefulWidget {
  const customer_registration_form({Key? key}) : super(key: key);

  @override
  _customer_registration_formState createState() => _customer_registration_formState();
}
enum gendergroup{male,female,other}
class _customer_registration_formState extends State<customer_registration_form> {
  TextEditingController namecontroller=TextEditingController(),
      emailcontroller=TextEditingController(),passwordcontroller=TextEditingController(),
      repasswordcontroller=TextEditingController();
  gendergroup _value = gendergroup.male;
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
       title: const Text('Customer Registration'),
      ),
      body:Form(
        key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(left: 10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        validator: (value){
                          if(value==null||value.isEmpty){
                            return "This field can't be empty";
                          }
                        },
                        controller: namecontroller,
                        decoration: const InputDecoration(
                            hintText: 'Full Name',
                            labelText: 'Name *'
                        ),
                      ),
                      TextFormField(
                        validator: (value){
                          if(value==null||value.isEmpty){
                            return "This field can't be empty";
                          }
                        },
                        controller: emailcontroller,
                        decoration: const InputDecoration(
                            hintText: 'example@email.com',
                            labelText: 'Email *'
                        ),
                      ),
                      SizedBox(height: 10,),
                      const Text('Gender',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:  [
                          Radio(value: gendergroup.male ,
                              groupValue:_value,
                              onChanged:(gendergroup? val){
                                setState(() {
                                  _value  = val!;
                                });
                              }),
                          const Text('Male'),

                          Radio(value: gendergroup.female,
                              groupValue:_value,
                              onChanged:(gendergroup? val){
                                setState(() {
                                  _value  = val!;
                                });
                              }),
                          const Text('Female'),
                          Radio(value: gendergroup.other,
                              groupValue:_value,
                              onChanged:(gendergroup? val){
                                setState(() {
                                  _value  = val!;
                                });
                              }),
                          const Text('Others'),
                        ],
                      ),

                      TextFormField(
                        obscureText: true,
                        controller: passwordcontroller,
                        validator: (value){
                          if(value==null||value.isEmpty){
                            return "This field can't be empty";
                          }
                        },
                        decoration: const InputDecoration(
                            hintText: 'Password',
                            labelText: 'Password *'
                        ),
                      ),
                      TextFormField(
                        obscureText: true,
                        validator: (value){
                          if(value==null||value.isEmpty){
                            return "This field can't be empty";
                          }
                        },
                        controller: repasswordcontroller,
                        decoration: const InputDecoration(
                            hintText: 'Re-Password',
                            labelText: 'Re-Password *'
                        ),
                      ),

                    ],
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if(_formKey.currentState!.validate()) {
                          String fname = namecontroller.text;
                          String email = emailcontroller.text;
                          String password = passwordcontroller.text;
                          String repassword = repasswordcontroller.text;
                          String gender = 'Male';
                          if (_value == gendergroup.male) {
                            gender = 'Male';
                          }
                          if (_value == gendergroup.female) {
                            gender = 'Female';
                          }
                          if (_value == gendergroup.other) {
                            gender = 'Other';
                          }


                          if (password == repassword) {
                            await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                email: email, password: password).
                            whenComplete(() =>
                            {
                              Fluttertoast.showToast(msg: 'Success'),
                              FirebaseFirestore.instance.collection('Users').
                              doc(FirebaseAuth.instance.currentUser?.uid).set({
                                'fullname': fname,
                                'email': email,
                                'gender': gender,
                                'flag': 1
                              })
                            });
                            Navigator.pushNamed(context, '/customer');
                          }

                          if (password != repassword) {
                            Fluttertoast.showToast(
                                msg: "Passwords don't match");
                          }
                        }
                      },

                      child: Text('Submit')),
                ],
              ),
            ),
          ),
      ),
      );

  }
}
