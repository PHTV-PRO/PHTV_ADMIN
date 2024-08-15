import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../apis/apis_list.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var data = {};
  String companyName = '';
  String companyLogo = '';
  String combo = '';
  String comboStart = '';
  String comboEnd = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getProfileData();
  }

  getProfileData() async {
    var rs = await AdminChartApi.getProfile.sendRequest(urlParam: '/2');
    data = rs['companyForEmployer'];
    if (data.isNotEmpty) {
      setState(() {
        companyName = data['name'];
        companyLogo = data['logo_image'];
        combo = data['subcriptionPlan']['name'];
        comboStart = data['subcriptionPlan']['start_date'];
        comboEnd = data['subcriptionPlan']['end_date'];
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
              margin: const EdgeInsets.all(14.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 55, 58, 64),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(companyLogo),
                        backgroundColor: Colors.white,
                        radius: 38,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              companyName,
                              style: const TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          Text(
                            combo,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'From: ${DateFormat("dd/MM/yyyy").format(DateTime.parse(comboStart))} - To: ${DateFormat("dd/MM/yyyy").format(DateTime.parse(comboEnd))}',
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      )),
                ],
              )),
    );
  }
}
