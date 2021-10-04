import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sign_up_verify/numericPad.dart';
import 'package:sign_up_verify/verifyPhone.dart';

class ContinueWithPhone extends StatefulWidget {
  const ContinueWithPhone({ Key? key }) : super(key: key);

  @override
  _ContinueWithPhoneState createState() => _ContinueWithPhoneState();
}

class _ContinueWithPhoneState extends State<ContinueWithPhone> {

  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close,
          color: Colors.black,
          size: 30,
          ),
          onPressed: (){},),
        title:Text('Continue with phone',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),
      ),
       centerTitle: true,
      ),
      body: SafeArea(
        child:Column(
          children: <Widget>[
              Expanded(
                child: Container(
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height:130,
                      child: Image.asset('images/phone.png')
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical:5, horizontal:60),
                      child: Text(
                        "You'll receive a 4 digit code to verify next.",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black54)
                          )
                       )
                  ]
                )
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.13 ,
                decoration: BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.circular(20)
                ),
                child:Row(
                  children: <Widget>[
                    Container(
                      width:240,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Enter your phone',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey
                          )),
                          SizedBox(
                            height: 9
                          ),
                          Text(phoneNumber,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black
                          ))
                        ],
                      )
                    ),

                    Expanded(
                      child:GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context){
                                return VerifyPhone(phoneNumber);
                              }
                            ));
                        },
                        child: Container(
                          height:40,
                          decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: Center(
                            child: Text('Continue',
                            style: TextStyle(
                              fontSize:19,
                              fontWeight: FontWeight.bold
                            )),
                          )
                        ),
                      ))
                  ]
                )
              ),
              NumericPad(
                onNumberSelected: (value){
                  setState(() {
                    if (value != -1) {
                      phoneNumber = phoneNumber + value.toString();
                    }else{
                      phoneNumber = phoneNumber.substring(0, phoneNumber.length - 1);
                    }
                  });
                },
              )
          ],
      ),
    ));
  }
}