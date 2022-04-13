import 'package:flutter/material.dart';
import 'package:lahcen_station/pages/StationPage.dart';

class MicrocontrollerMenu extends StatelessWidget {

  static String routeName='MicrocontrollerMenu';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          SizedBox(height: 180,),

          InkWell(
            onTap: (){Navigator.of(context).pushNamed(StationPage.routeName,arguments:  'device1' );},
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: double.infinity,
                height: 120,
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: Colors.greenAccent,
                  child: Row(children: [
                    SizedBox(width: 10,),
                    Image(image: AssetImage('images/logo.png'),),
                    SizedBox(width: 50,),

                    Text('Device 1',style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w500),),

                  ],),

                ),
              ),
            ),
          ),

           SizedBox(height: 40,),
          InkWell(
            onTap: (){Navigator.of(context).pushNamed(StationPage.routeName,arguments:  'device2' );},
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: double.infinity,
                height: 120,
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: Colors.greenAccent,
                  child: Row(children: [
                    SizedBox(width: 10,),
                    Image(image: AssetImage('images/logo.png'),),
                    SizedBox(width: 50,),

                    Text('Device 2',style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w500),),

                  ],),

                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
