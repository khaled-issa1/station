import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';



class DelPage extends StatelessWidget {
  static String routeName='DelPage';

  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        elevation: 0,

        backgroundColor: Colors.teal[400],

        actions: [

          IconButton(

              icon: Icon(Icons.arrow_forward_ios),

              onPressed: () {

                Navigator.pop(context);

              })

        ],

        leading: Icon(

          Icons.ac_unit,

          color: Colors.transparent,

        ),

        title: Text(

          'بوابة مناسك',

          style: TextStyle(

            fontFamily: 'cairo',

            fontSize: 16,

          ),

        ),

        centerTitle: true,

      ),

      body: FutureBuilder(

        future: Future.delayed(

          Duration(milliseconds: 1500),

        ),

        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting ||

              snapshot.connectionState == ConnectionState.none) {

            return Column(
              children: [
                Image.asset(

                  "images/slider2.jpg",



                ),
                SizedBox(height: 100,),
                Padding(

                padding: const EdgeInsets.all(22.0),

                child: CircularProgressIndicator(

                  color: Colors.teal[400],

                ),

              ),]
            );

          }

          if (snapshot.connectionState == ConnectionState.done) {

            return myBody();

          }

          return Container();

        },

      ),

    );

  }



  Container myBody() {

    return Container(

      width: double.infinity,

      height: double.infinity,

      child: Stack(

        children: [

      ListView(

      children: [

      Image.asset(

        "images/slider2.jpg",

        width: 20,

      ),

      SizedBox(

        height: 10,

      ),


      CarouselSlider(
      options: CarouselOptions(
          viewportFraction: 0.4,
          height:200,autoPlay: false),
      items: [
      Container(
        height: 200,
          width:130,
          child: Image.asset("images/slider2.jpg")),
        Container(
            height: 200,
            width:120,
            child: Image.asset("images/slider2.jpg")),
        Container(
            height: 200,
            width:120,child: Image.asset("images/slider2.jpg")),
        Container(
            height: 200,
            width:120,child: Image.asset("images/slider2.jpg")),
        Container(
            height: 200,
            width:120,child: Image.asset("images/slider2.jpg")),
        Container(
            height: 200,
            width:120,child: Image.asset("images/slider2.jpg")),
      ]
      ),


   // Container(
   //  margin: EdgeInsets.symmetric(horizontal: 5),
   //  child: FittedBox(
   //  fit: BoxFit.fill,
   //  child: Image.asset("images/slider2.jpg"'',),
   //  )
   //  ),

      Image.asset(

        "images/slider2.jpg",

      width: 20,

    ),

    SizedBox(

    height: 70,

    ),

    ],

    ),



    ],

    ),

    );

  }

}

