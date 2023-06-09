import 'package:flutter/material.dart';
import 'package:online_classroom/data/img.dart';
import 'package:online_classroom/models/announcements.dart';
import 'package:online_classroom/models/custom_user.dart';
import 'package:online_classroom/services/classes_db.dart';
import 'package:online_classroom/services/submissions_db.dart';
import 'package:online_classroom/services/updatealldata.dart';
import 'package:provider/provider.dart';

class AddClass extends StatefulWidget {

  @override
  _AddClassState createState() => _AddClassState();
}

class _AddClassState extends State<AddClass> {

  String className = "";

  // for form validation
  final _formKey = GlobalKey<FormState>();


  // build func
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<CustomUser?>(context);

    return Scaffold(
      // appbar part
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0.5,
          title: Text(
            "Join Class",
            style: TextStyle(
                color: Colors.white, fontFamily: "Roboto", fontSize: 22),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
                size: 26,
              ),
              onPressed: () {},
            )
          ],
        ),

        // body part
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 20.0),

                  TextFormField(
                    decoration: InputDecoration(labelText: "Class Name", border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
                    validator: (val) => val!.isEmpty ? 'Enter a class name' : null,
                    onChanged: (val) {
                      setState(() {
                        className = val;
                      });
                    },
                  ),

                  SizedBox(height: 20.0),

                  myButton(
                    buttonText: "Join",
                    child: Text("Join",
                    
                        style: TextStyle(
                            color: Colors.white, fontFamily: "Roboto",
                            fontSize: 22)
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate())  {
                        await ClassesDB(user: user).updateStudentClasses(className);

                        for(int i=0; i<announcementList.length; i++) {
                          if(announcementList[i].classroom.className == className && announcementList[i].type == "Assignment") {
                            await SubmissionDB().addSubmissions(user!.uid, className, announcementList[i].title);
                          }
                        }

                        await updateAllData();

                        Navigator.of(context).pop();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: Size(150, 50),
                    ),
                  )
                ],
              )),
        ));
  }
}