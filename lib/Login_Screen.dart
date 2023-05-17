import 'package:flutter/material.dart';
import 'Common.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffE9E4FE),
        appBar: AppBar(
          title: Text(
            "Nasheed App",
          ),
          actions: [
            InkWell(onTap: () {}, child: Padding(
              padding: const EdgeInsets.only(top: 18.0,right: 18),
              child: InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Text("SignUp",style: TextStyle(fontSize: 18),)),
            )),
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "LogIn",
                    style: TextStyle(color: Color(0xff3E2F83), fontSize: 36.0),
                  ),
                  SizedBox(height: 100),
                  Center(
                    child: Container(
                      width: 334,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormField(
                              decoration: buildFormDecoration("Email"),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value!.isEmpty || value == null) {
                                  return 'Please enter your email';
                                }
                                if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                                    .hasMatch(value)) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 24),
                            TextFormField(
                              decoration: buildFormDecoration("Password"),
                              obscureText: true,
                              validator: (value) {
                                if (value!.isEmpty || value == null) {
                                  return 'Please enter your password';
                                } else if (value.length < 6) {
                                  return 'Password must be at least 6 characters long';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  buildButton("Login", () {
                    if (!_formKey.currentState!.validate()) {
                      // perform login action with email and password
                    }
                  })
                ],
              ),
            ),
            ));
    }
}