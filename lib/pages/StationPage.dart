import 'package:flutter/material.dart';
import 'package:lahcen_station/backend/FirebaseHelper.dart';

class StationPage extends StatelessWidget {
  static String routeName='StationPage';

  List<String> textList=['Temperature','humidity','Wind Speed','Rain','Dew point','UX'];


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: StreamBuilder<List<num>> (
        initialData: [],
        stream: FirebaseHelper.firebaseHelper.getAllVar(),
        builder: (context, snapshot ) {
          return (snapshot.data?.length == 0||snapshot.data?.first==null) ?Center(child: CircularProgressIndicator(),)

              :SafeArea(
            child: Column(
                children: [


                  Container(
                    height: 300,
                    width: 500,
                    child: Image(image: AssetImage('images/logo.png'),fit: BoxFit.fill,),),
                  SizedBox(height: 10,),


                  Container(

                    height: 350,
                    width: double.infinity,
                    child: GridView.builder(
                      scrollDirection: Axis.vertical,


                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                      itemCount: 6,
                      itemBuilder: (context , t ){
                        return  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(

                            child: Card(
                              shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                              color: Colors.greenAccent,
                              child: Column(children: [
                                SizedBox(height: 25,),
                                Container(child: Text('${textList[t]}'),),
                                SizedBox(height: 10,),
                                Container(child: Text('${snapshot.data?.elementAt(t)}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),)
                              ],),
                            ),
                          ),
                        );
                      },
                    ),
                  ),]
            ),
          );


        }
      )
    );
  }
}
