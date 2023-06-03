import 'package:flutter/material.dart';
import 'package:online_classroom/models/accounts.dart';
import 'package:online_classroom/screens/student_classroom/add_class.dart';
import 'package:online_classroom/screens/student_classroom/wall_tab.dart';
import 'package:online_classroom/screens/student_classroom/classes_tab.dart';
import 'package:online_classroom/screens/student_classroom/timeline_tab.dart';
import 'package:online_classroom/services/auth.dart';
import 'package:online_classroom/models/custom_user.dart';
import 'package:provider/provider.dart';

import '../data/custompopupmenu.dart';
import '../data/my_colors.dart';
import '../data/textstyles.dart';
import '../data/user_avatar.dart';

class StudentHomePage extends StatefulWidget {
  @override
  _StudentHomePageState createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    final user = Provider.of<CustomUser?>(context);
    var account = getAccount(user!.uid);

    final tabs = [
     ClassesTab(),
      TimelineTab(),
       WallTab(),
     
    ];

    return Scaffold(
        appBar:AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        centerTitle: false,
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
       elevation: 0.0,
        //backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'My Online Classes',
                    style: textStyleH6(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Welcome, ' + (account!.firstName as String) + " " +(account.lastName as String),
                    textAlign: TextAlign.start,
                    style: (textStyleParagraph(color: MyColors.black)),
                  ),
                ]
                ),
                 Container(
                    height: 50,
                    width: 50,
                    child:Column(
                      children: [
                        Row(
                          children: [
                             CustomPopupMenu(
                             // controller: controller,
                              barrierColor: Colors.black45,
                              pressType: PressType.singleClick,
                              menuBuilder: () {
                                return Container(
                                  width: 200,
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 35,
                                        // width: 100,
                                        alignment: Alignment.center,
                                        decoration: const BoxDecoration(
                                            color: Colors.black87,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                            )),
                                        child: Text(
                                          "Student",
                                              // ? "Student".toUpperCase()
                                              // : "Teacher".toUpperCase(),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 2),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Text(
                                              ""+( account.firstName as String)+" "+( account.lastName as String),
                                              style: const TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: 12),
                                            ),
                                          ),
                                          const SizedBox(height: 5),
                                          Container(
                                            height: 1,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(1),
                                              color: Colors.black12,
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                         //swith role

                                          TextButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.red.shade300),
                                              overlayColor:
                                                  MaterialStateProperty.all(
                                                Colors.white10,
                                              ),
                                            ),
                                            onPressed: ()async {
                                             await _auth.signOut();
                                            },
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.logout_outlined,
                                                  color: Colors.white,
                                                  size: 14,
                                                ),
                                                const SizedBox(width: 10),
                                                const Text(
                                                  "Logout",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: const UserAvatar())
                          ],
                        )
                        
                      ],
                    ),
                  )
          ],
        ),

        // toolbarHeight: 12,
      ),
        body: tabs[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(//Dashboard
              icon: Icon(Icons.home_outlined),
              label: 'Classes',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_add_outlined),
              label: 'ClassWork',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.feed_outlined),//Classes
              label: "Dashboard",
            )
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.blue,
          onTap: _onItemTapped,
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddClass(),
              )).then((_) => setState(() {}));
        },
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 32,
        ),
      ),
    );
  }
}