import 'package:healthybites/authPages/FbAuth.dart';
import 'package:healthybites/authPages/googleAuth.dart';
import 'package:healthybites/authPages/loginFuncs.dart';
import 'package:healthybites/common/colors.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 4),
            ),
            items:backImages.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Image(
                    image: AssetImage(i),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,
                  );
                },
              );
            }).toList(),
          ),
          actionButton("Sign Up"),
          actionButton("Sign In"),
          Positioned(
              bottom: 140,
              left: 33,
              child: Row(children: [
                ClipRRect(borderRadius: BorderRadius.circular(16),
                child: Container(color: Colors.white,height: 3,width: 130,)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(child: Text("OR",style: const TextStyle(color: Colors.white,fontFamily: "Ptmono"),),color: Colors.grey.withOpacity(0.2),),
                ),
                ClipRRect(borderRadius: BorderRadius.circular(16),child: Container(color: Colors.white,height: 3,width: 130,)),
              ],)),

              Positioned(bottom: 60,left: 60,child: Row(children: [
socialAuthButton(LineAwesomeIcons.google_plus),SizedBox(width:40,),
socialAuthButton(LineAwesomeIcons.facebook_square),SizedBox(width:40,),
socialAuthButton(LineAwesomeIcons.apple),
              ],),),
          Positioned(
              top: 45,
              left: 50,
              child: Container(
                  height: 65,
                  width: 79,
                  child: SvgPicture.asset("assets/logo.svg",
                      semanticsLabel: 'Logo'))),
        const  Positioned(
              top: 120,
              left: 50,
              child: Text('A new type of\nexperience.',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontFamily: "Castoro",
                      letterSpacing: 1)))
        ],
      ),
    );
  }

Widget socialAuthButton(IconData icon){
  return CircleAvatar(radius: 26,backgroundColor: Colors.deepPurple[700],
  child: IconButton(icon: Icon(icon,color: Colors.white,size: 32,),
  onPressed: (){
if (icon==LineAwesomeIcons.google_plus) {
  signInWithGoogle(context);
} else {
  loginWithFacebook(context);
}
  },));
}
  Widget actionButton(String label){
    return Positioned(
              bottom: label=="Sign Up" ?280:190,
              child: SizedBox(
                height: 60,
                width: 250,
                child: RaisedButton(
                  color: label=="Sign Up" ?orange:Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(35.0),
                  ),
                  child: Text(
                    label,
                    style:
                        TextStyle(color:label=="Sign Up" ? Colors.white:orange, fontFamily: "Nunito"),
                  ),
                  onPressed: () {
                    if (label=="Sign Up") {
                      openBottomSheet(context,false);
                    } else {
                      openBottomSheet(context,true);
                    }
                    
                  },
                ),
              ));
  }
}
