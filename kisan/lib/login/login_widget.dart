
import 'package:flutter/material.dart';
import 'package:kisan/login/model.dart';

class LoginInput extends StatefulWidget{
  @override
  State<LoginInput> createState() {
    return LoginInputState();
  }

}

class LoginInputState extends State<LoginInput>{
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String validateName(String value) {
    if (value.length < 3)
      return 'Name must be more than 3 charater';
    else
      return null;
  }
  // Considering indian mobile number.
  String validateMobile(String value) {
    if (value.length != 10)
      return 'Mobile Number must be of 10 digit';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'login page',
      home: Scaffold(
        // this is very very important thing to know.
        resizeToAvoidBottomPadding: false,
         body: SingleChildScrollView(
           child: Column(
             children: <Widget>[
               Padding(
                 padding: const EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 0),
                 child: Text('Please login with you mobile Number',
                 style: TextStyle(
                 fontSize: 20,
                 fontWeight: FontWeight.bold,
                   letterSpacing: 2,
                   color: Colors.black,
                 ),
                 ),
               ),
               Form(
                 key: _formKey,
                 child: Column(
                   children: <Widget>[
                     Padding(
                       padding: const EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 0),
                       child: TextFormField(
                         validator: validateName,
                         controller: nameController,
                         keyboardType: TextInputType.text,
                         maxLength: 25,
                         maxLengthEnforced: true,
                         decoration: InputDecoration(
                           prefixIcon: Icon(Icons.account_box),
                           labelText: 'Name',
                           hintText: 'Enter Name',
                           enabledBorder: const OutlineInputBorder(
                             borderRadius: BorderRadius.all(Radius.circular(20.0)),
                             borderSide: const BorderSide(
                               color: Colors.grey,
                             ),
                           ),
                           focusedBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.all(Radius.circular(10.0)),
                             borderSide: BorderSide(color: Colors.blue),
                           ),
                         ),
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(left: 25, right: 25, top: 25, bottom: 0),
                       child: TextFormField(
                         validator: validateMobile,
                         controller: numberController,
                         keyboardType: TextInputType.phone,
                         maxLength: 10,
                         maxLengthEnforced: true,
                         decoration: InputDecoration(
                           prefixIcon: Icon(Icons.add_call),
                           prefixText: '+91',
                           labelText: 'Mobile Number',
                           hintText: 'Enter Mobile No.',
                           enabledBorder: const OutlineInputBorder(
                             borderRadius: BorderRadius.all(Radius.circular(20.0)),
                             borderSide: const BorderSide(
                               color: Colors.grey,
                             ),
                           ),
                           focusedBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.all(Radius.circular(10.0)),
                             borderSide: BorderSide(color: Colors.blue),
                           ),
                         ),
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(left: 0, right: 0, top: 10, bottom: 0),
                       child: RaisedButton(
                         onPressed: () {
                           if(_formKey.currentState.validate()) {
                             User.name = nameController.text;
                             User.mobilNo = numberController.text;
                             User.printUser();
                           }
                         },
                         textColor: Colors.white,
                         highlightColor: Colors.blueGrey,
                         splashColor: Colors.blueAccent,
                         highlightElevation: 25,
                         padding: const EdgeInsets.all(0.0),
                         child: Container(
                           decoration: const BoxDecoration(
                             borderRadius: BorderRadius.all(Radius.circular(10.0)),
                             color: Colors.blue,
                           ),
                           padding: const EdgeInsets.all(10.0),
                           child: const Text(
                               'Verify Number',
                               style: TextStyle(fontSize: 20)
                           ),
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
             ],
           ),
         ),
      ),
    );
  }

}