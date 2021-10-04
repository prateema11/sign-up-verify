import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sign_up_verify/numericPad.dart';

class VerifyPhone extends StatefulWidget {

  final String phoneNumber;

  VerifyPhone(this.phoneNumber);

  @override
  _VerifyPhoneState createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {
  String code = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back,
          color: Colors.black),
        ),
        title: Text('Verify Phone',
        style: TextStyle(
          color:Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 19
        ),),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

            Expanded(
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical:14),
                      child: Text('Code is sent to ' + widget.phoneNumber,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black38)),
                    ),

                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,                
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:<Widget>[
                          buildCodeNumberBox(code.length > 0 ? code.substring(0, 1) : ''),
                          buildCodeNumberBox(code.length > 1 ? code.substring(1, 2) : ''),
                          buildCodeNumberBox(code.length > 2 ? code.substring(2, 3) : ''),
                          buildCodeNumberBox(code.length > 3 ? code.substring(3, 4) : '')
                        ]
                      ))
                  ]
                )
              )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Didn't receive a code?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize:17,
                      color: Colors.black54
                      )
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text("Resend code?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize:17
                        ),),
                      )
                  )],
                ),
              ),
            Container(
              height: MediaQuery.of(context).size.height * 0.13,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25)
              ),
              child:Row(
                children:[

                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        print('verify and create you account action');
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Center(
                          child: Text('Verify and Create account',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),),
                        )
                      ),
                    ))
                ]
              )
            ),

            NumericPad(onNumberSelected: (value){
              setState(() {
                if(value != -1){
                  if(code.length<4){
                    code = code+ value.toString();
                  }
                }else{
                  code = code.substring(8, code.length - 1);
                }
              });
              print(value);
            })
          ]
        )),
    );
  }
}
Widget buildCodeNumberBox(String codeNumber){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal:8),
    child: SizedBox(
      width: 60,
      height: 60,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black26,
              blurRadius: 25.0,
              spreadRadius: 1,
              offset: Offset(0.0, 0.75)
            )
          ]
        ),
        child: Center(
          child: Text(
            codeNumber,
            style: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold
            )
          ),
        )
      )
    ),
  );
}