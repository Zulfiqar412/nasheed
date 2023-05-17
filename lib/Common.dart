import 'package:flutter/material.dart';


/// function for forms decoration

InputDecoration buildFormDecoration(String hintText){
  return InputDecoration(
    hintText: hintText,
    hintStyle: TextStyle(color: Color(0xff3E2F81)),
    contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(47.0),
      borderSide: BorderSide.none, // change to white
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(47.0),
      borderSide: BorderSide(
        color: Colors.blue,
        width: 2.0,
      ),
    ),
  );
}



/// fuction for button

Widget buildButton(String text, VoidCallback onPressed) {
  return MaterialButton(
      color: Colors.blue,
      elevation: 4,
      height: 63,
      minWidth: 227,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(47))),
      onPressed: onPressed,
      child: Text(
          text,
          style: TextStyle(fontSize: 20, color: Colors.white),
          ),
      );
}