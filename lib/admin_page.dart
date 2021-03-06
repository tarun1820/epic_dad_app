import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/student.dart';

class Admin extends StatelessWidget {
  Admin({Key? key}) : super(key: key);
  final String id = 'admin_page';
  final messageTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _firestore = FirebaseFirestore.instance;

    String messageText = "";
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage( "images/login3.jpg"),
              fit: BoxFit.fill
          )
      ),
      child: Scaffold(
      backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Admin Console"),
          backgroundColor: Colors.deepPurple[900],
        ),
        body: Column(
          children: [
            Padding(

              padding: EdgeInsets.all(50),
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: messageTextController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.deepPurpleAccent, width: 2)),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.deepPurpleAccent, width: 2.0),
                  ),
                  hintText: "Enter Message",
                    filled: true
                ),
                onChanged: (text) {
                  messageText = text;
                },
              ),
            ),
            FloatingActionButton(
                backgroundColor: Colors.pinkAccent,
                onPressed: () {
                  if(messageText !="") {
                    messageTextController.clear();
                    final mess = Messages(
                        text: messageText, createdAt: Timestamp.now());


                    createUser(mess);
                  }
                },
                child: Text("Post")),
          ],
        ),
      ),
    );
  }

  Future createUser(Messages user) async {
    final docUser = FirebaseFirestore.instance.collection('user').doc();
    final json = user.toJson();
    await docUser.set(json);
  }
}
