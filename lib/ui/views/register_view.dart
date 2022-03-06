// ignore_for_file: prefer_const_constructors

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:nutricion_app/router/router.dart';
import 'package:nutricion_app/ui/buttons/custom_outlined_button.dart';
import 'package:nutricion_app/ui/buttons/link_text.dart';
import 'package:nutricion_app/ui/inputs/custom_inputs.dart';
import 'package:provider/provider.dart';

import '../../providers/register_form_provider.dart';

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => RegisterFormProvider(),
        child: Builder(builder: (context) {
          final registerFromProvider =
              Provider.of<RegisterFormProvider>(context, listen: false);
          return Container(
            margin: EdgeInsets.only(top: 50),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 370),
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: registerFromProvider.formKey,
                  child: Column(
                    children: [
                      //nombre
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingrese su nombre';
                          }
                          return null;
                        },
                        onChanged: (value) =>
                            registerFromProvider.nombre = value,
                        style: TextStyle(color: Colors.white),
                        decoration: CustomInputs.registerInputDecoration(
                            hint: 'Ingrese su nombre',
                            label: 'Nombre',
                            icon: Icons.person),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //email
                      TextFormField(
                        validator: (value) {
                          if (!EmailValidator.validate(value ?? '')) {
                            return 'Email no valido';
                          }

                          return null;
                        },
                        onChanged: (value) =>
                            registerFromProvider.email = value,
                        style: TextStyle(color: Colors.white),
                        decoration: CustomInputs.registerInputDecoration(
                            hint: 'Ingrese su correo',
                            label: 'Email',
                            icon: Icons.email_outlined),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //password
                      TextFormField(
                        onChanged: (value) =>
                            registerFromProvider.password = value,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingrese su contraseña';
                          }
                          if (value.length < 6) {
                            return 'La contraseña debe ser de 6 caracteres';
                          }
                          return null;
                        },
                        obscureText: true,
                        style: TextStyle(color: Colors.white),
                        decoration: CustomInputs.registerInputDecoration(
                            hint: '********',
                            label: 'Contraseña',
                            icon: Icons.lock_outline),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      //Ingresar

                      CustomOutlinedButton(
                        onPressed: () {
                          registerFromProvider.validateForm();
                        },
                        text: 'Crear cuenta',
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      LinkText(
                        text: 'Ir al login',
                        onPressed: () {
                          Navigator.pushNamed(context, Flutorouter.loginRoute);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }));
  }
}
