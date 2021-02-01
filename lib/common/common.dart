import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
Widget bottomButton(String text,BuildContext context){
    return Padding(
      padding:const  EdgeInsets.all(18.0),
      child: SizedBox(
                  height:MediaQuery.of(context).size.height*0.07,
                width: MediaQuery.of(context).size.width*0.6,
                child: FlatButton(
                  color: Colors.deepOrange,child: Text(text,
                  style: TextStyle(color: Colors.white,fontFamily: 'Nunito',letterSpacing: 2),),
                  onPressed: (){
                    Navigator.pop(context);
                },),),
    );
  }

  void tost(String message,[Color color]){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor:color==null ? Colors.green :Colors.red,
        textColor: Colors.white,
        fontSize: 17.0
    );
  }