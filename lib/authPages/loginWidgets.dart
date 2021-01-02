import 'package:flutter/material.dart';
import 'package:healthybites/common/colors.dart';

Widget emailTextF(){
    return Padding(
            padding: const EdgeInsets.only(left:28.0,right: 49,top: 12),
            child: TextFormField(
              
              style:TextStyle(color: Colors.black,fontFamily: 'Nunito'),
              decoration: inputDeco(Icons.email_outlined,"Email"),
            ),
          );
  }
  Widget usernameTextF(){
    return Padding(
            padding: const EdgeInsets.only(left:28.0,right: 49,top: 12),
            child: TextFormField(
              style:TextStyle(color: Colors.black,fontFamily: 'Nunito'),
              decoration: inputDeco(Icons.person_outline,"Username"),
            ),
          );
  }
   Widget passTextF(){
    return Padding(
            padding: const EdgeInsets.only(left:28.0,right: 49,top: 12),
            child: TextFormField( obscureText: true,
              style:TextStyle(color: Colors.black),
              decoration: inputDeco(Icons.vpn_key_outlined,"Password"),
            ),
          );
  }
  Widget pass2TextF(){
    return Padding(
            padding: const EdgeInsets.only(left:28.0,right: 49,top: 12),
            child: TextFormField(obscureText: true,
               style:TextStyle(color: Colors.black),
              decoration: inputDeco(Icons.vpn_key_outlined,"Repeat Password"),
            ),
          );
  }

  InputDecoration inputDeco(IconData icon,String label){
    return InputDecoration(
                labelStyle: TextStyle(fontFamily: 'Ptmono',letterSpacing: 1),
                
                labelText: label,
               icon: Icon(icon,color: Colors.black,size: 26,),
              enabledBorder: UnderlineInputBorder(      
                      borderSide: BorderSide(color: orange),   
                      ),  
              focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: orange),
                   ), 
              );
  }