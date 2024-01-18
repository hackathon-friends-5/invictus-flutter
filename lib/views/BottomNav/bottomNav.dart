import 'dart:io';

import 'package:development2/models/utils/constants.dart';
import 'package:flutter/material.dart';

import 'Home/home.dart';
import 'One/one.dart';
import 'Profile/profile.dart';
import 'Three/three.dart';
import 'Two/two.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List<Widget> pages = [
    Home(),
    One(),
    Two(),
    Three(),
    Profile(),
  ];

  int _currentIndex = 0;

  void tappp(int index) async {
    (index) {
      setState(() {
        _currentIndex = index;
      });
    };
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen width
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 800) {
      return WillPopScope(
        onWillPop: () => showExitPopup(context),
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: pages[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 5,
            backgroundColor: Colors.white,
            // currentIndex: widget.selectedIndex,
            // selectedItemColor: Colors.amber[800],
            // onTap: _onItemTapped,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.explore),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'Notifications',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'Notifications',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
          body: Center(
        child: Text("Please use a mobile device"),
      ));
    }
  }
}

Future<bool> showExitPopup(context) async {
  Size size = MediaQuery.of(context).size;
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          backgroundColor: Colors.white,
          alignment: Alignment.center,
          title: const Text(
            'Are you sure you want to exit?',
          ),
          titleTextStyle: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black),
          actionsAlignment: MainAxisAlignment.center,
          actionsPadding:
              const EdgeInsets.only(left: 10, right: 10, bottom: 20),
          actions: [
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: (size.height / 50.52) * 2,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          )),
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "No",
                          style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        )),
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: SizedBox(
                    height: (size.height / 50.52) * 2,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                    side: BorderSide(
                                        color: MyColors.greyShadow, width: 1))),
                      ),
                      onPressed: () async {
                        exit(0);
                      },
                      child: Text(
                        "Yes",
                        style: TextStyle(
                            fontSize: 17,
                            color: MyColors.greyShadow,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        );
      });
}
