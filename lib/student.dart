import 'package:flutter/material.dart';

import 'admin_page.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Doctor at disposal'),
        // backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 1250,
              ),
              OutlinedButton.icon(
                icon: const Icon(Icons.person,size:40),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context)=>Admin()),);
                }, label:const Text('') ,
              )
            ],
          ),

        ],
      ) ,
    );
  }
}
