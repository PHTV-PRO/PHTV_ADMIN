import 'package:flutter/material.dart';
import 'package:phtv_admin/widgets/job_chart.dart';
import 'package:phtv_admin/widgets/perform_chart.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 39, 41, 45),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text('Home Screen', style: TextStyle(color: Colors.white),),
            Container(
              child: JobChart(),
            ),
            PerformChart()
          ],
        )
      ),
    );
  }
}