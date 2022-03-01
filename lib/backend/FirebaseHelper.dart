import 'package:firebase_database/firebase_database.dart';

class FirebaseHelper {

  DatabaseReference database = FirebaseDatabase.instance.ref();

  FirebaseHelper._(){}

  static FirebaseHelper firebaseHelper = FirebaseHelper._();


  initvarRef() async {
    if (await database.child('var') == null) {
      await database.child('var');
    }
    else {

    }
  }

  var1Control(double a) async {
    initvarRef();
    await database.child('var').update({"var1": a});
  }

  getvar1Value() async {
    DataSnapshot r = await database.child('var/var1').get();
    return r.value;
  }

  var2Control(double a) async {
    initvarRef();
    await database.child('var').update({"var2": a});
  }

  getvar2Value() async {
    DataSnapshot r = await database.child('var/var2').get();
    return r.value;
  }

  var3Control(double a) async {
    initvarRef();
    await database.child('var').update({"var3": a});
  }

  getvar3Value() async {
    DataSnapshot r = await database.child('var/var3').get();
    return r.value;
  }

  var4Control(double a) async {
    initvarRef();
    await database.child('var').update({"var4": a});
  }

  getvar4Value() async {
    DataSnapshot r = await database.child('var/var4').get();
    return r.value;
  }

  var5Control(double a) async {
    initvarRef();
    await database.child('var').update({"var5": a});
  }

  getvar5Value() async {
    DataSnapshot r = await database.child('var/var5').get();
    return r.value;
  }

  var6Control(double a) async {
    initvarRef();
    await database.child('var').update({"var6": a});
  }

  getvar6Value() async {
    DataSnapshot r = await database.child('var/var6').get();
    return r.value;
  }



  Stream<List<num>> getAllVar()async*{
    List<num> v=[];
    late num v1;late num v2;late num v3;late num v4;late num v5;late num v6;
    methd()async{
       v1=   await getvar1Value();
       v2=   await getvar2Value();
     v3= await getvar3Value();
     v4=   await getvar4Value();
      v5=   await getvar5Value();
     v6= await getvar6Value();
       v=[v1,v2,v3,v4,v5,v6];

    }

    yield* Stream.periodic(Duration(seconds: 3), (int a) {
      methd();
      return v;
    });



  }







}



