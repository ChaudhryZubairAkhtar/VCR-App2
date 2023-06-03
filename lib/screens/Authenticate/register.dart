// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:online_classroom/data/img.dart';
import 'package:online_classroom/screens/Authenticate/userform.dart';
import 'package:online_classroom/screens/loading.dart';
import 'package:online_classroom/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:online_classroom/services/updatealldata.dart';


import '../../data/my_colors.dart';
import '../../data/textstyles.dart';

class Register extends StatefulWidget {
  final Function toggle_reg_log;
  Register({required this.toggle_reg_log});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Authservice object for accessing all auth related functions
  // More details inside "services/auth.dart" file
  final AuthService _auth = AuthService();

  // email and password strings
  String email = '';
  String password = '';
  String error = '';

  // for form validation
  final _formKey = GlobalKey<FormState>();

  // for loading screen
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
        // appbar part
        appBar:AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        centerTitle: false,
        backgroundColor: Colors.transparent,
        bottomOpacity: 0.0,
       elevation: 0.0,
        //backgroundColor: Colors.white,
        title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sign with Email',
                style: textStyleH6(color: Colors.black),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Input your Account!',
                textAlign: TextAlign.start,
                style: (textStyleSmallText(color: MyColors.black)),
              ),
            ]),

        // toolbarHeight: 12,
      ),











        //  AppBar(
        //   title: Text("Register",
        //     style: TextStyle(color: Colors.black),),
        //   backgroundColor: Colors.white,
        //   actions: [
        //     // login button on the top right corner of appbar
        //     TextButton.icon(
        //       onPressed: () {
        //         widget.toggle_reg_log();
        //       },
        //       icon: Icon(Icons.person),
        //       label: Text('Login'),
        //       style: TextButton.styleFrom(foregroundColor: Colors.black),
        //     )
        //   ],
        // ),

        // body part
        body: Padding(
          padding: const EdgeInsets.all(16.0),
         
            // form widget
            child: Form(
                // form key for validation( check above)
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 30.0),

                    // textbox for email
                    TextFormField(
                      decoration: InputDecoration(labelText: "Email", border: OutlineInputBorder( borderRadius: BorderRadius.circular(10.0),)),
                      validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      },
                    ),

                    SizedBox(height: 30.0),

                    // textbox for password
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Password", border: OutlineInputBorder( borderRadius: BorderRadius.circular(10.0),)),
                      obscureText: true,
                      validator: (val) => val!.length < 6
                          ? 'Enter a password 6+ chars long'
                          : null,
                      onChanged: (val) {
                        setState(() {
                          password = val;
                        });
                      },
                    ),

                    SizedBox(height: 30.0),
                    

                    // register button
                    myButton(
                      buttonText: "Register",
                      child: Text("Register",
                          style: TextStyle(
                              color: Colors.white, fontFamily: "Roboto",
                              fontSize: 22)
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {

                          setState(() => loading = true);

                          // Registering new student
                          var result = await _auth.registerStudent(email, password);
                          if (result == null) {
                            setState(() {
                              loading = false;
                              error = 'Some error in Registering! Please check again';
                            });
                          }

                          else {
                            await updateAllData();

                            setState(() => loading = false);
                            Navigator.pushReplacement(context, MaterialPageRoute( builder: (context) => Userform()));
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        minimumSize: Size(150, 50),
                      ),
                    ),

                    SizedBox(height: 12.0),

                    // Prints error if any while registering
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    ),
                    const Spacer(
                      flex: 4,
                    ),
                    Center(
              child:
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                'Old user? ',
                style: textStyleSmallText(),
                ),
                InkWell(
                onTap: () {
                   widget.toggle_reg_log();
                },
                child: Text(
                  'Login  here',
                  style: textStyleSemiBold(
                    color: MyColors.blue,
                  ),
                ),
                ),

              ]),
            ),
           
           const Spacer(
            flex: 1,
           ),
            Center(
              child:
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                'By using our services you are agreeing to our',
                style: textStyleRegular(),
                ),
              ]),
            ),
            const SizedBox(
              height: 5,
            ),
            Center(
              child:
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                'Terms ',
                style: textStyleSemiBold(color: MyColors.blue, fontSize: 12),
                ),
                const SizedBox(
                width: 2,
                ),
                Text(
                'and',
                style: textStyleRegular(),
                ),
                const SizedBox(
                width: 3,
                ),
                Text(
                'Privacy Policy',
                style: textStyleSemiBold(color: MyColors.blue, fontSize: 12),
                ),
              ]),
            ),
                     
                    
                  ],
                ),
                )
                ),
        );
  }
}
