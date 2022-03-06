import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String nombre = '';
  String email = '';
  String password = '';

  validateForm() {
    if (formKey.currentState!.validate()) {
      print('Form valid ... Login');
      print('$email === $password === $nombre');
    } else {
      print('Form not valid');
    }
  }
}
