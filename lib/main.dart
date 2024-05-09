import 'dart:ffi' hide Size;
import 'dart:ui' ;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(MyApp());
}

const dGreen = Color(0xFF54D3C2);

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hotel app',
      home: homePage(),
    );
  }
}

class homePage extends StatelessWidget {

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            searchSection(),
            hotelSection(),
          ],
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => new Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.grey[800],
        ),
        onPressed: null,
      ),
      centerTitle: true,
      title: Text('Explore',
        style: GoogleFonts.nunito(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w800,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.favorite_border_rounded,
            color: Colors.grey[800],
          ),
          onPressed: null,
        ),IconButton(
          icon: Icon(
            Icons.place,
            color: Colors.grey[800],
          ),
          onPressed: null,
        ),
      ],
      backgroundColor: Colors.white,
    );
  }

}

class searchSection extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Container(
      height: 200,
      color: Colors.grey[200],
      padding: EdgeInsets.fromLTRB(20, 35, 20, 10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow:  [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 4,
                          offset: Offset(0,3),
                        ),
                      ]
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                          hintText: 'London',
                          contentPadding: EdgeInsets.all(10),
                          border: InputBorder.none,

                      ),
                    ),
                  ),
              ),
              const SizedBox(width: 10,),
              Container(
                height: 50,
                width: 50,
                decoration:  BoxDecoration(
                  color: Colors.green,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 4,
                      offset: Offset(0,3),
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(35)),

                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    backgroundColor: dGreen,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.all(10),
                  ),
                  child: Icon(
                    Icons.search,
                    size: 26,
                  ),
                ),
              )
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hello you',
                    style: GoogleFonts.nunito(
                      color: Colors.grey,
                      fontSize: 15,)),
                    SizedBox(height: 5,),
                    Text('12 dec - 22 dec',
                      style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontSize: 17,))

                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Number of rooms',
                        style: GoogleFonts.nunito(
                          color: Colors.grey,
                          fontSize: 15,)
                    ),
                    SizedBox(height: 5,),
                    Text('1 room - 2 adult',
                        style: GoogleFonts.nunito(
                          color: Colors.black,
                          fontSize: 17,))
                ],
              ),
              )
            ],
          )
        ],
      ),
    );
  }
}


class hotelSection extends StatelessWidget {
  final List hotelList = [
    {
      'title': 'Grand Royl Hotel',
      'place': 'wembley, London',
      'distance': 2,
      'review': 36,
      'picture': 'images/hotel_1.png',
      'price': '180',
    },
    {
      'title': 'Queen Hotel',
      'place': 'wembley, London',
      'distance': 3,
      'review': 13,
      'picture': 'images/hotel_2.png',
      'price': '220',
    },
    {
      'title': 'Grand Mal Hotel',
      'place': 'wembley, London',
      'distance': 6,
      'review': 88,
      'picture': 'images/hotel_3.png',
      'price': '400',
    },
    {
      'title': 'Hilton',
      'place': 'wembley, London',
      'distance': 11,
      'review': 34,
      'picture': 'images/hotel_4.png',
      'price': '910',
    },
  ];

  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 15, right: 15),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('550 hotels founds',
                    style: GoogleFonts.nunito(
                      color: Colors.grey,
                      fontSize: 15,)
                ),
                Row(
                  children: [
                    Text('Filters',
                      style: GoogleFonts.nunito(
                        color: Colors.black,
                        fontSize: 15,),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.filter_list_outlined, color: Colors.green,)
                    ),
                  ],
                )
              ],
            ),
          ),
          Column(children:
            hotelList.map((hotel) {
              return HotelCard(hotel);
            }).toList()
          ,)
        ],
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  late final Map hotelData;
  HotelCard(this.hotelData);
  
  @override
  Widget build (BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(25)),
        boxShadow: [
          BoxShadow(
              blurRadius: 6 ,
              spreadRadius: 4,
              offset: Offset(0, 3),
              color: Colors.grey.shade300
          )
        ]
      ),
      child: Column(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15)),
              color: Colors.red,
              image: DecorationImage(
                image: AssetImage(hotelData['picture']),
                fit: BoxFit.cover,
              )
            ),
            child: Stack(
              children: [
                Positioned(
                    child: MaterialButton(
                      color: Colors.white,
                      shape: CircleBorder(),
                      onPressed: () {},
                      child: Icon(
                          Icons.favorite_border_rounded,
                        color: dGreen,
                      ),
                    ),
                  top: 5,
                  right: -15,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: Row(
              mainAxisAlignment:  MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  hotelData['title'],
                  style: GoogleFonts.nunito(
                    fontSize: 18,
                    fontWeight: FontWeight.w800
                  ),
                ),
                Text(
                  '\$' + hotelData['price'],
                  style: GoogleFonts.nunito(
                      fontSize: 18,
                      fontWeight: FontWeight.w800
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  hotelData['place'],
                  style: GoogleFonts.nunito(
                      fontSize: 14,
                      color: Colors.grey[500],
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.place,
                      color: dGreen,
                      size: 15,
                    ),
                    Text(
                      hotelData['distance'].toString() + ' km to the city',
                      style: GoogleFonts.nunito(
                        fontSize: 14,
                        color: Colors.grey[500],
                      ),
                    )
                  ],
                ),
                Text(
                  '/per night',
                  style: GoogleFonts.nunito(
                    fontSize: 14,
                    color: Colors.grey[800],
                    fontWeight : FontWeight.bold
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Row(
              children: [
                Row(
                  children: [
                    Icon(Icons.star, color: dGreen, size: 15,),
                    Icon(Icons.star, color: dGreen, size: 15,),
                    Icon(Icons.star, color: dGreen, size: 15,),
                    Icon(Icons.star, color: dGreen, size: 15,),
                    Icon(Icons.star_border, color: dGreen, size: 15,),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  hotelData['review'].toString() + ' review',
                  style: GoogleFonts.nunito(
                      fontSize: 14,
                      color: Colors.grey[800],
                      fontWeight : FontWeight.bold
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
