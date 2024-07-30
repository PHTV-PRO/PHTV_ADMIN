import 'package:flutter/material.dart';

class ManageScreen extends StatelessWidget{
  const ManageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 39, 41, 45),
      body: Container(
          margin: const EdgeInsets.all(10.0),
          child: const Column(
            children: [
              Text('Manage Screen', style: TextStyle(color: Colors.white),),
            ],
          )
      ),
    );
  }
}