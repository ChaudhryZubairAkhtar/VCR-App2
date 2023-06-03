import 'package:flutter/material.dart';
import 'package:online_classroom/models/accounts.dart';
import 'package:online_classroom/screens/teacher_classroom/add_class.dart';
import 'package:online_classroom/screens/teacher_classroom/classes_tab.dart';
import 'package:online_classroom/services/auth.dart';
import 'package:online_classroom/models/custom_user.dart';
import 'package:provider/provider.dart';

import '../data/custompopupmenu.dart';
import '../data/my_colors.dart';
import '../data/textstyles.dart';
import '../data/user_avatar.dart';

class TeacherHomePage extends StatefulWidget {
  @override
  _TeacherHomePageState createState() => _TeacherHomePageState();
}

class _TeacherHomePageState extends State<TeacherHomePage> {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    final user = Provider.of<CustomUser?>(context);
    var account = getAccount(user!.uid);

    return Scaffold(
      appBar: AppBar(
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
                    'My Classes',
                    style: textStyleH6(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Welcome, ' +
                        (account!.firstName as String) +
                        " " +
                        (account.lastName as String),
                    textAlign: TextAlign.start,
                    style: (textStyleParagraph(color: MyColors.black)),
                  ),
                ]),
            Container(
              height: 50,
              width: 50,
              child: Column(
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                      "Teacher",
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
                                          "" +
                                              (account.firstName as String) +
                                              " " +
                                              (account.lastName as String),
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
                                      // TextButton(
                                      //   style: ButtonStyle(
                                      //     overlayColor:
                                      //         MaterialStateProperty.all(
                                      //       Colors.black12,
                                      //     ),
                                      //   ),
                                      //   onPressed: ()  {

                                      //   },
                                      //   child: Row(
                                      //     children: [
                                      //       const Icon(
                                      //         Icons.repeat,
                                      //         color: Colors.black26,
                                      //         size: 14,
                                      //       ),
                                      //       const SizedBox(width: 10),
                                      //        Text(
                                      //         "Switch role",
                                      //         style: TextStyle(
                                      //             color: Colors.black87,
                                      //             fontSize: 12),
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),
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
                                        onPressed: () async {
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

      // AppBar(
      //   elevation: 0.5,
      //   title: Text(
      //     "My Classes",
      //     style: TextStyle(
      //         color: Colors.black, fontFamily: "Roboto", fontSize: 22),
      //   ),
      //   backgroundColor: Colors.white,
      //   actions: [
      //     Padding(
      //         padding: const EdgeInsets.symmetric(vertical: 20),
      //         child: Text("Welcome, " + (account!.firstName as String),
      //           style: TextStyle(color: Colors.black, fontSize: 16),
      //         ),
      //     ),
      //     IconButton(
      //       icon: Icon(
      //         Icons.logout,
      //         color: Colors.black87,
      //         size: 30,
      //       ),
      //       onPressed: () async {
      //         await _auth.signOut();
      //       },
      //     ),
      //   ],
      // ),

      body: ClassesTab(account),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(
                builder: (context) => AddClass(),
              ))
              .then((_) => setState(() {}));
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
