import 'package:flutter/material.dart';
import 'package:kisan/login/model.dart';
import 'package:kisan/login/get_otp.dart';

class LoginInput extends StatefulWidget {
  @override
  LoginInputState createState() {
    return new LoginInputState();
  }
}

class LoginInputState extends State<LoginInput> {
  bool _displayverifyButton = false;
  bool _displayOTPError = false;
  bool _displayOTPInput = true;
  Future<String> request;
  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final otpController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final GetOTP _getOTP = GetOTP();

  String validateName(String value) {
    if (value.length < 3)
      return 'Name must be more than 3 charater';
    else
      return null;
  }

  // Considering indian mobile number.
  String validateMobile(String value) {
    if (value.length != 10) {
      setState(() {

      });
      return 'Mobile Number must be of 10 digit';
    }
    else
      return null;
  }

  String validateOTP(String value) {
    if (value.length != 6) {
      return 'Otp must be of 6 digit';
    }
//    else if(value != LoginStatus.otp){
//      return 'Incorrect otp, please try again' ;
//    }
    else {
      return null;
    }
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
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 25, bottom: 0),
                child: Text(
                  'Please login with you mobile Number',
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
                      padding: const EdgeInsets.only(
                          left: 25, right: 25, top: 25, bottom: 0),
                      child: TextFormField(
                        validator: validateName,
                        controller: nameController,
                        keyboardType: TextInputType.text,
                        maxLength: 25,
                        maxLengthEnforced: true,
                        style: TextStyle(
                          wordSpacing: 10,
                          letterSpacing: 2,
                          fontSize: 25,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.account_box),
                          labelText: 'Name :',
                          hintText: 'Enter Name',
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25, right: 25, top: 25, bottom: 0),
                      child: TextFormField(
                        validator: validateMobile,
                        controller: numberController,
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        maxLengthEnforced: true,
                        style : TextStyle(
                          letterSpacing: 5,
                          wordSpacing: 0,
                          fontSize: 25,
                        ),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.add_call),
                          prefixText: '+91:  ',
                          labelText: 'Mobile No.#',
                          hintText: 'Enter Mobile No.',
                          enabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 0, right: 0, top: 10, bottom: 0),
                      child: RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            User.name = nameController.text;
                            User.mobilNo = numberController.text;
                            User.printUser();
                            setState(() {
                              request = _getOTP.addUser();
                            });
                          }
                        },
                        textColor: Colors.white,
                        highlightColor: Colors.blueGrey,
                        splashColor: Colors.blueAccent,
                        highlightElevation: 25,
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            color: Colors.blue,
                          ),
                          padding: const EdgeInsets.all(10.0),
                          child: const Text('Continue',
                              style: TextStyle(fontSize: 20)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25, right: 25, top: 10, bottom: 0),
                      child: request != null
                          ? FutureBuilder<String>(
                              future: request,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Column(
                                    children: <Widget>[
                                      Text('${snapshot.data}'),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 40,
                                            right: 40,
                                            top: 15,
                                            bottom: 0),
                                        child: _displayOTPInput ?
                                        new TextFormField(
                                          validator: validateOTP,
                                          controller: otpController,
                                          keyboardType: TextInputType.phone,
                                          maxLength: 6,
                                          maxLengthEnforced: true,
                                          onChanged: (text) {
                                            if(text.length == 6){
                                              FocusScopeNode currentFocus = FocusScope.of(context);
                                              if (!currentFocus.hasPrimaryFocus) {
                                                currentFocus.unfocus();
                                              }
                                              setState(() {
                                                _displayverifyButton = true;
                                                _displayOTPError = false;
                                              });
                                            }else{
                                              setState(() {
                                                _displayverifyButton = false;
                                              });
                                            }
                                          },
                                          style : TextStyle(
                                            fontSize: 20,
                                            letterSpacing: 5,
                                          ),
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(Icons.fiber_pin),
                                            prefixText: 'OTP :   ',
                                            labelText: 'Enter OTP',
                                            hintText: 'Enter OTP',
                                            enabledBorder:
                                                const OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20.0)),
                                              borderSide: const BorderSide(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)),
                                              borderSide: BorderSide(
                                                  color: Colors.blue),
                                            ),
                                          ),
                                        ) : new Container(),
                                      ),
                                    ],
                                  );
                                } else if (snapshot.hasError) {
                                  return Text(
                                      'Something went wrong, Please verfy your mobile number and try again');
                                }
                                return CircularProgressIndicator();
                              })
                          : new Container(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 25, right: 25, top: 0, bottom: 0),
                      child: _displayverifyButton
                          ? new RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              _displayOTPError = true;
                            });
                            Text('Login Successful');
                          }
                        },
                        textColor: Colors.white,
                        highlightColor: Colors.blueGrey,
                        splashColor: Colors.blueAccent,
                        highlightElevation: 25,
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10.0)),
                            color: Colors.blue,
                          ),
                          padding: const EdgeInsets.all(10.0),
                          child: const Text('   Login   ',
                              style: TextStyle(fontSize: 20)),
                        ),
                      )
                          : new Container(),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 25, right: 25, top: 25, bottom: 0),
                child: _displayOTPError ? new Text(
                  'Invalid otp, please try again',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    color: Colors.red,
                  ),
                ) : new Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
