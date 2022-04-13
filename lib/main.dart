import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lahcen_station/pages/FirebaseConnectionFail.dart';
import 'package:lahcen_station/pages/LoginPage.dart';
import 'package:lahcen_station/pages/MicrocontrollerMenu.dart';
import 'package:lahcen_station/pages/OnGoingPage.dart';
import 'package:lahcen_station/pages/RegisterPage.dart';
import 'package:lahcen_station/pages/SplashPage.dart';
import 'package:lahcen_station/pages/StationPage.dart';

import 'package:lahcen_station/serv/NavServices.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(Page1()));
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

          routes: {
            OnGoingPage.routeName:(context)=>OnGoingPage(),
            LoginPage.routeName: (context)=>LoginPage(),
            RegisterPage.routeName:(context)=>RegisterPage(),
            MicrocontrollerMenu.routeName:(context)=>MicrocontrollerMenu(),


          },
      onGenerateRoute: (rr){
            String? name=rr.name;
            dynamic arg= rr.arguments;
            if(name==StationPage.routeName){
              return MaterialPageRoute(builder: (context){return
                StationPage(arg);
              }) ;
            }

      },
          navigatorKey: NavServices.navServices.navkey,
          debugShowCheckedModeBanner: false,
          title: 'weather station',
          home: FirebaseConnectionCheck(),
        )

      ;

  }
}

class FirebaseConnectionCheck extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return FirebaseConnectionFail();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return SplashPage();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return CircularProgressIndicator();
      },
    );
  }
}
