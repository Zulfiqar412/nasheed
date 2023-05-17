import 'package:flutter/material.dart';

import 'Common.dart';
import 'Login_Screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffE9E4FE),
        appBar: AppBar(
          title: Text(
            "Nasheed App",
          ),
          actions: [
            InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LogInScreen(),));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 18.0, right: 20),
                  child: Text(
                    "LogIn",
                    style: TextStyle(fontSize: 18),
                  ),
                )),
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "SignUp",
                    style: TextStyle(color: Color(0xff3E2F83), fontSize: 36.0),
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Container(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextFormField(
                                decoration: buildFormDecoration("Name"),
                                validator: (value) {
                                  if (value!.isEmpty || value == null) {
                                    return 'Please enter your Name';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                decoration: buildFormDecoration("Phone No"),
                                validator: (value) {
                                  if (value!.isEmpty || value == null) {
                                    return 'Please enter your phone No';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
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
                              SizedBox(height: 24),
                              TextFormField(
                                decoration: buildFormDecoration("confirm Password"),
                                obscureText: true,
                                validator: (value) {
                                  if (value!.isEmpty || value == null) {
                                    return 'Please enter your confirm password';
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
                  ),
                  SizedBox(height: 20,),
                  buildButton("SignUp", () {
                    if (!_formKey.currentState!.validate()) {
                    }
                  })
                ],
              ),
            ),
            ));
    }
}