import 'package:flutter/material.dart';
import 'package:lahcen_station/backend/FirebaseHelper.dart';
import 'package:lahcen_station/pages/LoginPage.dart';
import 'package:lahcen_station/serv/NavServices.dart';
import 'package:string_validator/string_validator.dart';

class RegisterPage extends StatelessWidget {
  static String routeName='RegisterPage';
  String? email1;
  String? password1;
  GlobalKey<FormState>  formkey=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 120,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text('Create account',style: TextStyle(color: Colors.greenAccent,
                    fontSize: 30,fontWeight: FontWeight.bold

                ),
                ),
              ),
              SizedBox(height: 40,),


              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  onSaved: (x){
                    email1=x;
                  },
                  validator: (value){
                    String x= value!=null? value : '';
                    if(!isEmail(x)){return 'Please enter correct email address';}

                    else{return null;}
                  },
                  decoration: InputDecoration(
                    labelText: 'Email',

                  ),
                ),
              ),
              SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  onSaved: (x){
                    password1=x;
                  },
                  validator: (value){
                    String x= value!=null? value : '';
                    if(isAlphanumeric(x)&& x.length>=6){
                      return null;
                    }
                    else{
                      return 'your password length more than 6 letters and digits ';
                    }

                  },
                  decoration: InputDecoration(
                    labelText: 'Password',


                  ),
                ),
              ),

              SizedBox(height: 40,),

              Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color:  Colors.greenAccent,

                  ),

                  child: TextButton(

                      onPressed: ()async{


                        if(formkey.currentState?.validate()==true) {
                          formkey.currentState!.save();
                          String? errorData =await FirebaseHelper.firebaseHelper.register(email1!, password1!);

                          if(errorData==null){
                            NavServices.navServices.NavRep(LoginPage.routeName);

                          }
                          else{
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('$errorData'),
                                  backgroundColor: Colors.deepOrange[400],
                                  duration: Duration(seconds: 9),
                                ));
                          }
                        }

                  },

                      child: Text('Sign up',style: TextStyle(
                          color: Colors.white
                      ),))),
              SizedBox(height: 40,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  Text('Already have account? '),
                  InkWell(
                    onTap: (){
                      NavServices.navServices.NavRep(LoginPage.routeName);
                    },
                    child: Text('Sign in',style: TextStyle(color: Colors.greenAccent,fontWeight: FontWeight.bold),

                    ),
                  ),
                ],),

            ],
          ),
        ),
      ),
    );
  }
}
