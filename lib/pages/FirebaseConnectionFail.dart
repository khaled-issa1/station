import 'package:flutter/material.dart';
import 'package:lahcen_station/pages/SplashPage.dart';
import 'package:lahcen_station/serv/NavServices.dart';


class FirebaseConnectionFail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color:Colors.red,
        child: Center(
          child: TextButton(child: Text('Ignore server connection error'),
            onPressed:(){
              NavServices.navServices.NavRep(SplashPage.routeName);

            }
            ,),
        ),
      ),
    );
  }
}
