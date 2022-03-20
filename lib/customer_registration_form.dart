import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class customer_registration_form extends StatefulWidget {
  const customer_registration_form({Key? key}) : super(key: key);

  @override
  _customer_registration_formState createState() => _customer_registration_formState();
}

class _customer_registration_formState extends State<customer_registration_form> {
  TextEditingController namecontroller=TextEditingController(),
      emailcontroller=TextEditingController(),passwordcontroller=TextEditingController(),
      repasswordcontroller=TextEditingController();
  int _value=1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: const Text('Customer Registration'),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*0.8,
          child: Column(
            children: [
              TextFormField(
                controller: namecontroller,
                decoration: const InputDecoration(
                  hintText: 'Full Name',
                  labelText: 'Name *'
                ),
              ),
              TextFormField(
                controller: emailcontroller,
                decoration: const InputDecoration(
                    hintText: 'example@email.com',
                    labelText: 'Email *'
                ),
              ),
              Row(
                children: [
                  Radio(value: 1, groupValue: _value, onChanged: (value){
                    setState(() {

                    });
                  }),
                  SizedBox(width: 10,),
                  Text('Male'),
                  SizedBox(width: 30,),
                  Radio(value: 2, groupValue: _value, onChanged: (value){}),
                  SizedBox(width: 10,),
                  Text('Female'),
                  SizedBox(width: 30,),
                  Radio(value: 3, groupValue: _value, onChanged: (value){}),
                  SizedBox(width: 10,),
                  Text('Others'),
                ],
              ),
              TextFormField(
                controller: passwordcontroller,
                decoration: const InputDecoration(
                    hintText: 'Password',
                    labelText: 'Password *'
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
