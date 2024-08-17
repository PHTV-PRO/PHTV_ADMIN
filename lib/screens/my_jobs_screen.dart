import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../apis/apis_list.dart';

var storage = const FlutterSecureStorage();

class MyJobsScreen extends StatefulWidget{
  const MyJobsScreen({super.key});

  @override
  State<MyJobsScreen> createState() => _MyJobsScreenState();
}

class _MyJobsScreenState extends State<MyJobsScreen> {
  var data = {};
  List jobData = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getJobsData();
  }

  getJobsData() async {
    var token = await storage.read(key: 'token');
    var rs = await AdminEmployerApi.getJobs.sendRequest(token: token);

    data = rs;
    if (data.isNotEmpty) {
      setState(() {
        jobData = data['companyForEmployer']['jobsOpening'];
        isLoading = false;
      });
    }
    print(jobData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 39, 41, 45),
      body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 14.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    child: isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : (jobData.isEmpty
                        ? Container(
                        height: 110,
                        alignment: Alignment.center,
                        child: const Text('You still not create any Job'))
                        : ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: jobData.length,
                      itemBuilder: (BuildContext context, int index) =>
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black38,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    spreadRadius: 2,
                                    blurRadius: 6,
                                  ),
                                ]
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(jobData[index]['title'] != '' ? jobData[index]['title'].toString().toUpperCase() : 'NO-NAME', style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red
                                      ),),
                                      Text('Created date: ${jobData[index]['start_date'].toString().substring(0,10)}', style: const TextStyle(fontSize: 12),),

                                    ],
                                  ),
                                ),
                                IconButton(onPressed: (){
                                  showDialog(
                                      context: context,
                                      useRootNavigator: false,
                                      builder: (BuildContext dialogContext) => AlertDialog(
                                        elevation: 0,
                                        backgroundColor: Colors.white,
                                        title: const Text('Confirm Delete', textAlign: TextAlign.center),
                                        content: Text('Are you sure to delete CV ${jobData[index]['title'].toString().toUpperCase()}', textAlign: TextAlign.center),
                                        actions: [
                                          TextButton(onPressed: (){
                                            Navigator.of(context).pop();
                                          }, child: const Text('Cancel')),
                                          ElevatedButton(
                                              onPressed: (){

                                              },
                                              style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
                                              child: const Text('Confirm'))
                                        ],
                                      ));
                                }, icon: const Icon(EneftyIcons.trash_outline, size: 18, color: Colors.red))
                              ],
                            ),
                          ),
                    ))),
              ],
            ),
          )
    ),
    );
  }
}