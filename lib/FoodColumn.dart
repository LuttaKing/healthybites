import 'package:flutter/material.dart';
import 'package:healthybites/foodDetail.dart';

Widget foodColumn(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
        width: 175,
        child: Column(
          children: [
            foodItem('Fattoush Salad', "assets/Fattoush_Salad.png", 145.0,
                Colors.green, 220.0, '4.3', '17',context),
            foodItem('Chocolate Cake', "assets/cake.png", 135.0, Colors.indigo,
                180.0, '4.5', '8',context),
            foodItem('Burger King', "assets/burger.png", 145.0, Colors.orange,
                220.0, '4.5', '2',context),
          ],
        ),
      ),
      Container(
        width: 175,
        // color: Colors.green,
        child: Column(
          children: [
            foodItem('Fried Chicken', "assets/chicken.png", 145.0, Colors.blue,
                180.0, '4.1', '21',context),
            foodItem('Tuco Tuesday', "assets/tucos.png", 100.0, Colors.red,
                180.0, '4.7', '28',context),
            foodItem('Guacamole', "assets/guacamole.png", 116.0, Colors.cyan,
                220.0, '4.9', '35',context),
          ],
        ),
      ),
    ],
  );
}

Widget foodItem(String name, String picPath, double picheight, Color color,
    double containerht, String rating, String discount,BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left:3.0,right: 3,top: 20),
    child: GestureDetector(
          child: Stack(overflow: Overflow.visible,
        children: [
          Positioned(
            child: Center(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Container(
                    height: containerht,
                    width: 150,
                    color: color.withOpacity(0.4),
                  )),
            ),
          ),
          Positioned(
              bottom: 0,
              left:
                  name == "Fried Chicken" || name == "Tuco Tuesday" ? 10.9 : 0.1,
              child: Hero(tag:name,child: Container(height: picheight, child: Image.asset(picPath)))),
          Positioned(
            top: 7,
            left: 19,
            child: Text(
              name,
              style: TextStyle(
                  fontFamily: "Padauk",
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1),
            ),
          ),
          Positioned(
            top: 29,
            left: 19,
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                Text(
                  rating,
                  style: TextStyle(
                      fontFamily: "Lora",
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        color: Colors.deepOrange.withOpacity(0.3),
                        child: Padding(
                          padding: const EdgeInsets.all(0.8),
                          child: Text(
                            "  -$discount%  ",
                            style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 10,
                              fontFamily: 'Nunito',
                            ),
                          ),
                        ),
                      )),
                )
              ],
            ),
          ),
          Positioned(
            bottom: -25,
            right: 15,
            child: Text(
              '...',
              style: TextStyle(
                  fontFamily: "Padauk",
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3),
            ),
          ),
        ],
      ),
      onTap: (){
        Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => FoodDetail(color: color,name: name,picPath: picPath,),
                                  ));
      },
    ),
  );
}
