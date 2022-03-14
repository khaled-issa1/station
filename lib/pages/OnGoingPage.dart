
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lahcen_station/pages/LoginPage.dart';
import 'package:lahcen_station/pages/StationPage.dart';
import 'package:lahcen_station/serv/NavServices.dart';

class OnGoingPage extends StatelessWidget {

  static String routeName='OnGoingPage';
  double w=300;
  double h=80;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          SizedBox(height: 100,),


          CarouselSlider(
              items: [

                Container(

                  height: h,
                  width: w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage('images/slider1.jpg'),
                      fit: BoxFit.fill,

                    ),
                  ),
                ) ,
                Container(
                  width: w,
                  height: h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage('images/slider2.jpg'),
                      fit: BoxFit.fill,

                    ),
                  ),
                ) ,

                Container(
                  width: w,
                  height: h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                      image: AssetImage('images/slider3.jpg'),
                      fit: BoxFit.fill,

                    ),
                  ),
                ) ,
              ]
              ,
              options: CarouselOptions(
                height: 250,
                aspectRatio: 16/9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,

                scrollDirection: Axis.horizontal,
              )
          ),




          SizedBox(height: 50,),

          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 20),

            child: Text(
              'Welcome in Lahcen Weather Station \n\nMonitor surroundig conditions, such as temperature, wind speed and rainfall',

              textAlign: TextAlign.center,
              style: TextStyle(color:Color.fromRGBO(21, 72, 84, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),

            ),),
          SizedBox(height: 30,),

          Container(

            width: double.infinity,

            margin: EdgeInsets.symmetric(vertical: 50
                ,horizontal: 30),

            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
              color: Colors.greenAccent,
            ),
            child: TextButton(
              child: Text('Next',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: (){
               NavServices.navServices.NavPush(LoginPage.routeName);
              },
            ),
          )




        ],
      ),
    );
  }
}
