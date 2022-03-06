import 'package:flutter/material.dart';

class CustomInputs {
  static InputDecoration registerInputDecoration(
      {required String hint, required String label, required IconData icon}) {
    return InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
          ),
        ),
        hintText: hint,
        labelText: label,
        prefixIcon: Icon(
          icon,
          color: Colors.grey,
        ),
        hintStyle: TextStyle(color: Colors.grey),
        labelStyle: TextStyle(color: Colors.green));
  }

  static InputDecoration loginInputDecoration(
      {required String hint, required String label, required IconData icon}) {
    return InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.green)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
          ),
        ),
        hintText: hint,
        labelText: label,
        prefixIcon: Icon(
          icon,
          color: Colors.grey,
        ),
        hintStyle: TextStyle(color: Colors.grey),
        labelStyle: TextStyle(color: Colors.green));
  }

  static InputDecoration searchInputDecoration(
      {required String hint, required IconData icon}) {
    return InputDecoration(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        hintText: hint,
        prefixIcon: Icon(
          icon,
          color: Colors.grey,
        ),
        labelStyle: TextStyle(color: Colors.grey),
        hintStyle: TextStyle(color: Colors.grey));
  }
}
