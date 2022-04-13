import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseHelper {

  DatabaseReference database = FirebaseDatabase.instance.ref();
  FirebaseAuth auth=FirebaseAuth.instance;



  FirebaseHelper._(){}

  static FirebaseHelper firebaseHelper = FirebaseHelper._();

  Future<String?> register(String em, String pas)async{
    try{
      UserCredential a=await auth.createUserWithEmailAndPassword(email: em, password: pas);
      return null;
    }
    catch(e){
      return e.toString();
    }
  }

  Future<String?> login(String em, String pas)async{
    try{
      await auth.signInWithEmailAndPassword(email: em, password: pas);
      return null;
    }
    catch(e){
      return e.toString();
    }
  }

  logout()async{
    await auth.signOut();
  }


  initvarRef() async {
    if (await database.child('var') == null) {
      await database.child('var');
    }
    else {

    }
  }



  getvar1Value(String deviceName) async {
    DataSnapshot r = await database.child('${deviceName}/var1').get();
    return r.value;
  }



  getvar2Value(String deviceName) async {
    DataSnapshot r = await database.child('${deviceName}/var2').get();
    return r.value;
  }



  getvar3Value(String deviceName) async {
    DataSnapshot r = await database.child('${deviceName}/var3').get();
    return r.value;
  }



  getvar4Value(String deviceName) async {
    DataSnapshot r = await database.child('${deviceName}/var4').get();
    return r.value;
  }



  getvar5Value(String deviceName) async {
    DataSnapshot r = await database.child('${deviceName}/var5').get();
    return r.value;
  }



  getvar6Value(String deviceName) async {
    DataSnapshot r = await database.child('${deviceName}/var6').get();
    return r.value;
  }





  Stream<List<num>> getAllVar(String NameDevice)async*{
    List<num> v=[];
    late num v1;late num v2;late num v3;late num v4;late num v5;late num v6;
    methd()async{
       v1=   await getvar1Value(NameDevice);
       v2=   await getvar2Value(NameDevice);
       v3=   await getvar3Value(NameDevice);
       v4=   await getvar4Value(NameDevice);
       v5=   await getvar5Value(NameDevice);
       v6=   await getvar6Value(NameDevice);
       v= await [v1,v2,v3,v4,v5,v6];

    }

    yield* Stream.periodic(Duration(seconds: 4), (int a) {
      methd();
      return v;
    });



  }







}



