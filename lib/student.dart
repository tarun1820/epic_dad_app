import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:intl/intl.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:untitled1/admin_login.dart';

import 'admin_page.dart';

class FirstScreen extends StatelessWidget {
  String id = 'student';
  @override
  Widget build(BuildContext context) {
    final _firestore = FirebaseFirestore.instance;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Doctor at disposal'),
          backgroundColor: Colors.deepPurple[900],
        ),
        body: SlidingUpPanel(
          //sliding up panel

          minHeight: 50,
          maxHeight: 175,
          backdropEnabled:
              true, //during swipe up background changes to black theme
          panel: (Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 0,
                ),
                dragHandler(),

                // Row(children: [
                //   SizedBox(
                //     width: 50,
                //   ),
                //   const Text(
                //     "Hospital",
                //     style: TextStyle(
                //       decorationThickness: 2.85,
                //       decorationStyle: TextDecorationStyle.solid,
                //     ),
                //   ),
                //   new Spacer(),
                //   /*ElevatedButton(
                //       child: Text('call'),
                //       style: ElevatedButton.styleFrom(primary: Colors.green),
                //       onPressed: () async {
                //         const number = '9959648235';
                //         await FlutterPhoneDirectCaller.callNumber(number);
                //       }
                //       //launch('tel://7893977464')}, label:const Text('') ,
                //       )*/
                //   ElevatedButton.icon(
                //     onPressed: () async {
                //       const number = '9959648235';
                //       await FlutterPhoneDirectCaller.callNumber(number);
                //     },
                //     icon: Icon(
                //       Icons.phone,
                //     ),
                //     label: Text("Call"),
                //     //icon data for elevated button
                //     style: ElevatedButton.styleFrom(
                //         primary: Colors.green //elevated button background color
                //         ),
                //   ),
                //   SizedBox(
                //     width: 50,
                //   )
                // ]
                //
                //     //launch('tel://7893977464')}, label:const Text('') ,
                //     ), //hospital mobile number
                Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.health_and_safety_outlined,
                        color: Colors.red,
                        size: 40,
                      ),
                      SizedBox(
                        width: 18,
                      ),
                      Text(
                        "Hospital",
                        style: TextStyle(fontSize: 20),
                      ),
                      new Spacer(),
                      ElevatedButton.icon(
                        onPressed: () async {
                          const number = '9959648235';
                          await FlutterPhoneDirectCaller.callNumber(number);
                        },
                        icon: Icon(
                          Icons.phone,
                        ),
                        label: Text("Call"),
                        //icon data for elevated button
                        style: ElevatedButton.styleFrom(
                            primary:
                                Colors.green //elevated button background color
                            ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                    ],
                  ),
                ),
                
                Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.local_hospital,
                        color: Colors.red,
                        size: 40,
                      ),
                      SizedBox(
                        width: 18,
                      ),
                      Text(
                        "Ambulance",
                        style: TextStyle(fontSize: 20),
                      ),
                      new Spacer(),
                      ElevatedButton.icon(
                        onPressed: () async {
                          const number = '7893977464';
                          await FlutterPhoneDirectCaller.callNumber(number);
                        },
                        icon: Icon(
                          Icons.phone,
                        ),
                        label: Text("Call"),
                        //icon data for elevated button
                        style: ElevatedButton.styleFrom(
                            primary:
                                Colors.red //elevated button background color
                            ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                    ],
                  ),
                ),
              ])),
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  new Spacer(),
                  OutlinedButton.icon(
                    // style: ButtonStyle(
                    //     backgroundColor:
                    //         MaterialStateProperty.all(Colors.pink[100])),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Admin()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blueAccent, //background color of button
                        side: BorderSide(
                            width: 1,
                            color: Colors.blueAccent), //border width and color
                        elevation: 3, //elevation of button
                        shape: RoundedRectangleBorder(
                            //to set border radius to button
                            borderRadius: BorderRadius.circular(50)),
                        padding:
                            EdgeInsets.all(10) //content padding inside button
                        ),
                    label: const Text(
                      'add timings',
                      style: TextStyle(color: Colors.yellow),
                    ),
                    icon: Icon(Icons.av_timer_outlined,
                        size: 35, color: Colors.yellow),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Timings',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              SizedBox(
                width: 150,
                child: Divider(
                  color: Colors.teal[900],
                ),
              ),
              StreamBuilder<List<Messages>>(
                  stream: readUsers(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final messages = snapshot.data!;

                      return Expanded(
                        child: Center(
                          child: ListWheelScrollView(
                            //  scrollDirection: Axis.vertical,
                            // shrinkWrap: true,
                            //offAxisFraction: 1.3,
                            itemExtent: 250,
                            children: messages.map(buildUser).toList(),
                          ),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text('some thing went wrong ! ${snapshot.error}');
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  })
            ],
          ), //admin button
        ),
      ),
    );
  }

  Widget buildUser(Messages message) => Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Colors.blueAccent,
                Colors.redAccent,
              ])),
            //new DateFormat.jm().format(DateTime.now()

          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children:[new Spacer(),
               Container(
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                      children:[ Text(
                        message.text,
                        style: TextStyle(fontSize: 20),
                      )]),),new Spacer(),
                Row(children:[new Spacer(),Text(new DateFormat.jm().format(DateTime.parse(message.createdAt.
                toDate().toString()))),SizedBox(width: 10,)] )],

               ),
          ),
              )


          );


  Stream<List<Messages>> readUsers() => FirebaseFirestore.instance
      .collection('user')
      .orderBy('createdAt', descending: false)
      .snapshots()
      .map((snapshot) => snapshot.docs.reversed
          .map((doc) => Messages.fromJson(doc.data()))
          .toList());

  static Messages fromJson(Map<String, dynamic> json) =>
      Messages(text: json['text'], createdAt: json['createdAt']);

  Widget dragHandler() => Center(
        child: Align(
          alignment: Alignment.center,
          child: Container(
            width: 150,
            height: 7.5,
            decoration: BoxDecoration(
                color: Colors.grey[500],
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: const BorderRadius.all(Radius.circular(25))),
          ),
        ),
      );
}

class Messages {
  late final String text;
  late final Timestamp createdAt;

  Messages({
    required this.text,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() => {
        'text': text,
        'createdAt': createdAt,
      };
  static Messages fromJson(Map<String, dynamic> json) =>
      Messages(text: json['text'], createdAt: json['createdAt']);
}
