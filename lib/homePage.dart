import 'package:flutter/material.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 177, 8, 8),
        title: Center(child: Text('HOME PAGE',style: TextStyle(fontSize: 50, color: Color.fromARGB(255, 251, 249, 244)),)),
      ),
      body: Center(child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
          Text("Welcome to the home page",style: TextStyle(fontSize: 80, color: Color.fromARGB(255, 59, 8, 176)),),
         
        ],
      ),),
      );
  }
}

