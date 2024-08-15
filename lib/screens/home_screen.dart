import 'package:flutter/material.dart';
import 'package:phtv_admin/widgets/job_chart.dart';
import 'package:phtv_admin/widgets/perform_chart.dart';

import '../apis/apis_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var data = {};
  List jobChartData = [];
  int postedJob = 0;
  int noOfCV = 0;
  double overalPayment = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getJobsChartData();
  }

  getJobsChartData() async {
    var rs = await AdminChartApi.getChartData.sendRequest(urlParam: '/2');
    data = rs;
    if (data.isNotEmpty) {
      setState(() {
        jobChartData = data['jobs'];
        postedJob = data['jobs_has_been_created'];
        noOfCV = data['total_applicated_by_month'];
        overalPayment = data['overall_payment'];
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 39, 41, 45),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Container(
              margin: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      homedata('Posted Job', postedJob, Colors.deepPurple),
                      homedata('No. of CV', noOfCV, Colors.green)
                    ],
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Your Posted Job Per Month',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  JobChart(
                    chartData: jobChartData,
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'CV Received Per Month',
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 17,
                        fontWeight: FontWeight.bold),
                  ),
                  PerformChart()
                ],
              )),
    );
  }

  Expanded homedata(String title, int num, Color color) {
    return Expanded(
      flex: 5,
      child: Container(
        height: 75,
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: color),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title),
              Text(
                num.toString(),
                style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
