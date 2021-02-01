
import 'package:flutter/material.dart';
import 'package:healthybites/FoodColumn.dart';
import 'package:healthybites/common/colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f6fa),
      body: Padding(
        padding: const EdgeInsets.only(left:8.0),
        child: SafeArea(
                child: SingleChildScrollView(child: 
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               IconButton(icon: Icon(Icons.search,color: Colors.black,size: 35,),onPressed: (){
                  Navigator.pop(context);
                },),
                

                Row(children: [
                  Icon(Icons.location_on,color: Colors.deepPurple,),
                  RichText(
          text: TextSpan(
              text: 'Nairobi,',
              style: TextStyle(
                  color: Colors.grey[800], fontSize: 16,fontFamily: "Overpass"),
              children: <TextSpan>[
                TextSpan(text: ' KE',
                    style: TextStyle(
                        color: Colors.grey[800], fontSize: 16,fontWeight: FontWeight.bold,fontFamily: "Lora"),
                   
                )
              ]
          ),
        ),
                ],),

              const  CircleAvatar(radius: 21.5,backgroundImage: AssetImage("assets/prof.jpg",),),

              ],),
            ),

           const SizedBox(height: 16,),
             Padding(
              padding: const EdgeInsets.only(left:5.0,bottom: 3),
              child: RichText(
            text:const TextSpan(
                text: 'Healthy',
                style: TextStyle(fontFamily: 'Castoro',
                color: Colors.black, fontSize: 29,letterSpacing: 1),
                children: <TextSpan>[
              TextSpan(text: ' Bites,',
                  style: TextStyle(
                      color: Colors.deepOrange, fontSize: 29,fontWeight: FontWeight.bold,
                      fontFamily: 'Castoro',letterSpacing: 2.7),
                 
              )
                ]
            ),
          ),
            ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Text('Pick one or more cuisines',style:TextStyle(fontFamily: 'Garamond',
              letterSpacing: 0.4,
                    fontSize: 19,
                    color: Colors.grey[800]
                    ),),
            ),
          foodColumn(context),
        const  SizedBox(height: 40,),
          Center(
            child: SizedBox(
                  height: 50,
                  width: 326,
                  child: RaisedButton(
                    color: orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Text(
                      'Load More',
                      style:TextStyle(color: Colors.white, fontFamily: "Nunito"),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
          ),
            const  SizedBox(height: 40,),
          ],),),
        ),
      ),
      
    );
  }

}