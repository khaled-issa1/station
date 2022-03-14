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



  getvar1Value() async {
    DataSnapshot r = await database.child('var/var1').get();
    return r.value;
  }



  getvar2Value() async {
    DataSnapshot r = await database.child('var/var2').get();
    return r.value;
  }



  getvar3Value() async {
    DataSnapshot r = await database.child('var/var3').get();
    return r.value;
  }



  getvar4Value() async {
    DataSnapshot r = await database.child('var/var4').get();
    return r.value;
  }



  getvar5Value() async {
    DataSnapshot r = await database.child('var/var5').get();
    return r.value;
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
       v3=   await getvar3Value();
       v4=   await getvar4Value();
       v5=   await getvar5Value();
       v6=   await getvar6Value();
       v= await [v1,v2,v3,v4,v5,v6];

    }

    yield* Stream.periodic(Duration(seconds: 4), (int a) {
      methd();
      return v;
    });



  }







}



