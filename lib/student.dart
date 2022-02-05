import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'admin_page.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Doctor at disposal'),
          // backgroundColor: Colors.red,
        ),
        body: SlidingUpPanel(


          minHeight: 50,
          maxHeight: 200,
          backdropEnabled: true,
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
              ),
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
                ),
                ]

             )
          ),

          body: Column(
            children: [
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

            ],
          ),
        ) ,
      ),
    );
  }
}
