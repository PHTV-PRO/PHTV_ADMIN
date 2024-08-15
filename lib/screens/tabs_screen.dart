import 'package:enefty_icons/enefty_icons.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:phtv_admin/screens/home_screen.dart';
import 'package:phtv_admin/screens/manage_screen.dart';
import 'package:phtv_admin/screens/profile_screen.dart';

var storage = const FlutterSecureStorage();

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedIndex = 0;
  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  double groupAlignment = -1.0;
  Color bgColor = const Color.fromARGB(255, 39, 41, 45);

  void selectPage(int index) async {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const HomeScreen();

    switch (_selectedIndex) {
      case 0:
        activePage = const ProfileScreen();
        break;
      case 1:
        activePage = const HomeScreen();
        break;
      case 2:
        activePage = const ManageScreen();
        break;
    }

    return Row(
      children: <Widget>[
        NavigationRail(
          selectedIndex: _selectedIndex,
          groupAlignment: groupAlignment,
          backgroundColor: const Color.fromARGB(255, 45, 48, 54),
          onDestinationSelected: selectPage,
          labelType: labelType,
          indicatorColor: Colors.transparent,
          selectedIconTheme: const IconThemeData(color: Colors.indigoAccent),
          unselectedIconTheme: const IconThemeData(color: Colors.white),
          minWidth: 30,
          destinations: const [
            NavigationRailDestination(
              icon: CircleAvatar(
                backgroundImage: NetworkImage('https://i.pravatar.cc/20'),
                radius: 18,
              ),
              selectedIcon: CircleAvatar(
                backgroundColor: Colors.blue,
                radius: 18,
                child: CircleAvatar(
                  backgroundImage: NetworkImage('https://i.pravatar.cc/20'),
                  radius: 16,
                ),
              ),
              label: Text('Home', style: TextStyle(color: Colors.white)),
            ),
            NavigationRailDestination(
              icon: Icon(EneftyIcons.chart_2_outline),
              selectedIcon: Icon(EneftyIcons.chart_2_bold),
              label: Text('Home', style: TextStyle(color: Colors.white)),
            ),
            NavigationRailDestination(
              icon: Icon(EneftyIcons.star_outline),
              selectedIcon: Icon(EneftyIcons.star_bold),
              label: Text('My Jobs', style: TextStyle(color: Colors.white)),
            ),
            NavigationRailDestination(
              icon: Icon(EneftyIcons.document_text_outline),
              selectedIcon: Icon(EneftyIcons.document_text_bold),
              label: Text('My CV', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
        // This is the main content.
        Expanded(
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: bgColor,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    EneftyIcons.search_normal_2_outline,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            body: Center(
              child: Container(
                width: double.infinity,
                color: bgColor,
                child: activePage
              ),
            ),
          ),
        ),
      ],
    );
  }
}
