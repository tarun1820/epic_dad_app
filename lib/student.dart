import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:untitled1/admin_login.dart';

import 'admin_page.dart';

class FirstScreen extends StatelessWidget {
  String id='student';
  @override
  Widget build(BuildContext context) {
    final _firestore=FirebaseFirestore.instance;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Doctor at disposal'),
          // backgroundColor: Colors.red,
        ),
        body: SlidingUpPanel(//sliding up panel


          minHeight: 50,
          maxHeight: 200,
          backdropEnabled: true,//during swipe up background changes to black theam
          panel: (
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children :[
                const SizedBox(
                  height: 15,
                ),
                Text("swipe up"),
                new Spacer(),
                Row(
                  children:[SizedBox(
                    width: 50,
                  ),
                    const Text("hospital",
                    style: TextStyle(
                      decorationThickness: 2.85,
                      decorationStyle: TextDecorationStyle.solid,
                    ),)
                    ,new Spacer(),
                    ElevatedButton(
                       child: Text('call'),
                        onPressed: () async{
                         const number = '9959648235';
                           await FlutterPhoneDirectCaller.callNumber(number);
        }
          //launch('tel://7893977464')}, label:const Text('') ,
        ),
                  SizedBox(
                    width: 50,
                  )]

                  //launch('tel://7893977464')}, label:const Text('') ,
              ),//hospital mobile number
                Row(
                    children:[SizedBox(
                      width: 50,
                    ),
                      const Text("ambulance",
                        style: TextStyle(
                          decorationThickness: 2.85,
                          decorationStyle: TextDecorationStyle.solid,
                        ),)
                      ,new Spacer(),
                      ElevatedButton(
                          child: Text('call'),
                          onPressed: () async{
                            const number = '7893977464';
                            await FlutterPhoneDirectCaller.callNumber(number);
                          }
                        //launch('tel://7893977464')}, label:const Text('') ,
                      ),
                      SizedBox(
                        width: 50,
                      )]

                  //launch('tel://7893977464')}, label:const Text('') ,
                ),//ambulance mobile number
                ]

             )
          ),

          body: Column(
            mainAxisSize: MainAxisSize.min,
            children:<Widget>[
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [new Spacer(),
                  OutlinedButton.icon(
                    icon: const Icon(Icons.person,size:50),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context)=>Admin()),);
                    }, label:const Text('') ,
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                ],
              ),
              SizedBox(
                height: 50,

              ),
              Text('timings',style: TextStyle(fontSize: 30),),
              SizedBox(
                 width: 150,
                child: Divider(
                  color: Colors.teal[900],

                ),
              ),

              StreamBuilder<List<Messages>>(
                  stream: readUsers(),
                  builder: (context, snapshot)
              {
                if(snapshot.hasData)
              {
                      final messages=snapshot.data!;

                      return Expanded(
                        child: Center(
                          child: ListWheelScrollView(
                           //  scrollDirection: Axis.vertical,
                           // shrinkWrap: true,

                          itemExtent: 250,
                          children: messages.map(buildUser).toList(),

                          ),
                        ),
                      );
              }
                else if(snapshot.hasError)
                  {
                    return Text('some thing went wrong ! ${snapshot.error}');
                  }
                else{
                  return Center(child: CircularProgressIndicator());
                }

              })
            ],
          ),//admin button
        ) ,
      ),
    );
    }

    Widget buildUser(Messages message)=>Card(
      child: Center(child: Text(message.text,style: TextStyle(fontSize: 20),)),
      color: Colors.blue,

    );


  Stream<List<Messages>> readUsers() => FirebaseFirestore.instance
      .collection('user')
      .orderBy('createdAt',descending: true)
      .snapshots()
      .map((snapshot) =>
      snapshot.docs.reversed.map((doc)=>Messages.fromJson(doc.data())).toList());

  static Messages fromJson(Map<String,dynamic> json) => Messages (
     text :json['text'],
     createdAt: json['createdAt']
  );

}

class Messages {
  late final String text;
  late final Object? createdAt;

  Messages({
    required this.text,
  required this.createdAt,
});

  Map<String,dynamic> toJson() => {
    'text': text,
    'createdAt':createdAt,
  };
  static Messages fromJson(Map<String,dynamic> json) =>
      Messages(text: json['text'],createdAt: json['createdAt']);

}
