import 'dart:ui';
import 'package:healthybites/Home.dart';
import 'package:healthybites/authPages/loginWidgets.dart';
import 'package:healthybites/common/colors.dart';
//import 'package:fridayrents/homeScreen/HomePage.dart';
import 'package:widget_circular_animator/widget_circular_animator.dart';
import 'package:flutter/material.dart';

void openBottomSheet(BuildContext context,bool signIn) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext bc) {
        return AuthBottomSheet(signIn: signIn,);
      });
}

class AuthBottomSheet extends StatefulWidget {
  final signIn;

  const AuthBottomSheet({Key key, this.signIn}) : super(key: key);

  @override
  _AuthBottomSheetState createState() => _AuthBottomSheetState();
}

class _AuthBottomSheetState extends State<AuthBottomSheet> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Container(
            padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
     //   height: MediaQuery.of(context).size.height * 0.70,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(40)),
        ),
        child: Wrap(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                  widget.signIn ? "Welcome\nBack ." : 'Create\nAccount' ,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        letterSpacing: 1),
                  ),
                  Container(
                    height: 73,width: 73,
                    child: WidgetCircularAnimator(
                      size: 70,
                      outerColor: Colors.deepPurple,
            child: Container(  decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.grey[200]),
              child: Icon(
                Icons.person,
                color: Colors.deepPurple[700],
                size: 27,
              ),
            ),
        ),
                  )
                ],
              ),
            ),
       widget.signIn ?  Container(): usernameTextF(),
          emailTextF(),
           passTextF(),
        widget.signIn ?  Container():   pass2TextF(),
           SizedBox(height: 110,),
            Center(
              child: SizedBox(
                height: 60,
                width: 250,
                child: RaisedButton(
                  color: orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(35.0),
                  ),
                  child: Text(
               widget.signIn ? "Sign In" :     'Sign Up',
                    style: TextStyle(color: Colors.white, fontFamily: "Nunito"),
                  ),
                  onPressed: () {
                    Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => HomePage(),
                                  ));
                  },
                ),
              ),
            ),
             SizedBox(height: 100,),
          ],
        ),
      ),
    );
  }

  
}
