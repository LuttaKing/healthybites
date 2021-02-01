import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:healthybites/common/common.dart';

class FoodDetail extends StatefulWidget {
  final name;
  final picPath;
  final Color color;

  const FoodDetail({Key key, this.name, this.picPath, this.color})
      : super(key: key);
  @override
  _FoodDetailState createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f6fa),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: bottomButton("Make Order", context),
        elevation: 10,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                overflow: Overflow.visible,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.37,
                    width: MediaQuery.of(context).size.width,
                    color: widget.color.withOpacity(0.4),
                  ),
                const  Positioned(
                    top: 10,
                    right: 10,
                    child: Card(
                      color: Colors.white,
                      shape: CircleBorder(),
                      elevation: 10,
                      child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 23,
                          child: Icon(
                            Icons.favorite_outline,
                            color: Colors.deepOrange,
                          )),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Card(
                      color: Colors.white,
                      shape: CircleBorder(),
                      elevation: 10,
                      child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 23,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.deepOrange,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          )),
                    ),
                  ),
                  Positioned(
                    top: 200,
                    width: MediaQuery.of(context).size.width,
                    child: ClipRRect(
                      borderRadius:const BorderRadius.only(
                          topLeft: Radius.circular(45),
                          topRight: Radius.circular(45)),
                      child: Container(
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.73,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 70,
                    left: 39,
                    child: Text(
                      widget.name,
                      style:const TextStyle(
                          fontFamily: "Padauk",
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1),
                    ),
                  ),
                  Positioned(
                    top: 101,
                    left: 70,
                    child: Hero(
                        tag: widget.name,
                        child: Container(
                            height: 197, child: Image.asset(widget.picPath))),
                  ),
                  Positioned(
                    top: 290,
                    left: 80,
                    child: Row(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.timer,
                              color: Colors.green,
                              size: 18,
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              "50 min",
                              style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 12,
                                  color: Colors.black),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Row(
                          children: [
                            Icon(Icons.star_border,
                                color: Colors.yellow[700], size: 18),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              "4.8",
                              style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 12,
                                  color: Colors.black),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Row(
                          children: [
                            Icon(Icons.bathtub_rounded,
                                color: Colors.red, size: 18),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              "136 kcal",
                              style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 12,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 340,
                    left: 80,
                    child: priceRow(),
                  ),
                const  Positioned(
                    top: 400,
                    left: 20,
                    child: Text("Ingredients",
                        style: TextStyle(
                            fontFamily: "Padauk",
                            fontWeight: FontWeight.bold,
                            fontSize: 21,
                            letterSpacing: 0.4)),
                  ),
                  Positioned(
                    top: 440,
                    left: 30,
                    child: ingredientRow(),
                  ),
                  Positioned(
                    top: 520,
                    left: 20,
                    child: Text("Description",
                        style: TextStyle(
                            fontFamily: "Padauk",
                            fontWeight: FontWeight.bold,
                            fontSize: 21,
                            letterSpacing: 0.4)),
                  ),
                  Positioned(
                    top: 560,
                    left: 30,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Nunito",
                            color: Colors.grey[700],
                            letterSpacing: 0.2),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget priceRow() {
    return Row(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
                color: widget.color.withOpacity(0.8),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    "Ksh 500",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Lora",
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ))),
        SizedBox(
          width: 7,
        ),
        Row(
          children: [
            orderBtn(Icons.add),
            Text("  1  "),
            orderBtn(Icons.remove)
          ],
        )
      ],
    );
  }

  Widget orderBtn(IconData icon) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(7),
      child: Container(
        color: Colors.grey[300],
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Icon(
            icon,
            color: Colors.black,
            size: 19,
          ),
        )),
      ),
    );
  }

  Widget ingredientRow() {
    return Row(children: [
      ingrd("Onions", "assets/onion.png"),
      SizedBox(
        width: 19,
      ),
      ingrd("Pepper", "assets/pepper.png"),
      SizedBox(
        width: 19,
      ),
      ingrd("Beef", "assets/beef.png"),
      SizedBox(
        width: 19,
      ),
      ingrd("Egg", "assets/egg.png"),
      SizedBox(
        width: 19,
      ),
      ingrd("tomato", "assets/tomato.png")
    ]);
  }

  Widget ingrd(String name, String image) {
    return Column(
      children: [
        Container(
          child: Image.asset(image),
          height: 45,
          width: 45,
        ),
        Text(
          name,
          style: TextStyle(
              fontSize: 15, fontFamily: "Padauk", color: Colors.black54),
        )
      ],
    );
  }
}
