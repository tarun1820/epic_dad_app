import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/admin_page.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  get id => 'admin_login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  late String email;
  late String password;
  final _auth=FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("doctor login"),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(50,50,50,10),
            child: TextField(
              decoration: InputDecoration(
                hintText: "enter emailid"
              ),
              maxLength: 50,
                onChanged: (text){
                 email=text;
                }
            ),
          ),
          //emailid
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50,vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "enter password"
              ),
              maxLength: 50,
              onChanged: (text){
                password=text;
              }
            ),
          ),
          //password
          FloatingActionButton(
              child:Text("log in"),onPressed:() async{
            try{
              print(email);
              print(password);

            final user=await _auth.signInWithEmailAndPassword(email: email, password: password);
            if(user!=null)
              {
                Navigator.pushNamed(context,Admin().id);
              }
          }
          catch(e)
          {
            print(e);
          }
          }
          )
        ],

      ),
    );
  }
}
