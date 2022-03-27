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

    String messageText = "50";
    return Scaffold(
      appBar: AppBar(
        title: Text("admin consol"),
        backgroundColor: Colors.deepPurple[900],
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(50),
            child: TextField(
              controller: messageTextController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.deepPurpleAccent, width: 2)),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.deepPurpleAccent, width: 2.0),
                ),
                hintText: "Enter Time only",
              ),
              onChanged: (text) {
                messageText = text;
              },
            ),
          ),
          FloatingActionButton(
              backgroundColor: Colors.pinkAccent,
              onPressed: () {
                messageTextController.clear();
                final mess = Messages(
                    text: messageText, createdAt: FieldValue.serverTimestamp());

                createUser(mess);
              },
              child: Text("post")),
        ],
      ),
    );
  }

  Future createUser(Messages user) async {
    final docUser = FirebaseFirestore.instance.collection('user').doc();
    final json = user.toJson();
    await docUser.set(json);
  }
}
