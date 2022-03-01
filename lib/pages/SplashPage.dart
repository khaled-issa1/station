import 'package:flutter/material.dart';
import 'package:lahcen_station/pages/OnGoingPage.dart';
import 'package:lahcen_station/serv/NavServices.dart';


class SplashPage extends StatelessWidget {
  static String routeName='SplashPage';


  transferToNextPage()async{
    await Future.delayed(Duration(seconds: 3));
    NavServices.navServices.NavRep(OnGoingPage.routeName);

  }



  @override
  Widget build(BuildContext context) {
    transferToNextPage();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/splash.png'),
              fit: BoxFit.fill,
            )
        ),

        child: Center(child: Container(
          height: 250,
          width: double.infinity,
          child: Image(image: AssetImage('images/logo.png'),fit: BoxFit.fill,),),),
      ) ,


    );
  }
}





