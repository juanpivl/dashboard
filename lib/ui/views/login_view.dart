// ignore_for_file: prefer_const_constructors
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:nutricion_app/providers/auth_provider.dart';
import 'package:nutricion_app/providers/login_form_provider.dart';
import 'package:nutricion_app/router/router.dart';
import 'package:nutricion_app/ui/buttons/custom_outlined_button.dart';
import 'package:nutricion_app/ui/buttons/link_text.dart';
import 'package:nutricion_app/ui/inputs/custom_inputs.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return ChangeNotifierProvider(
        create: (_) => LoginFormProvider(),
        child: Builder(builder: (context) {
          final loginFromProvider = Provider.of<LoginFormProvider>(context,
              listen: false); //whit this
          return Container(
            margin: EdgeInsets.only(top: 100),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 370),
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: loginFromProvider
                      .formKey, //provider da acceso al formulario
                  child: Column(
                    children: [
                      //email
                      TextFormField(
                        validator: (value) {
                          if (!EmailValidator.validate(value ?? '')) {
                            return 'Email no valido';
                          }

                          return null;
                        },
                        onChanged: (value) => loginFromProvider.email = value,
                        style: TextStyle(color: Colors.white),
                        decoration: CustomInputs.loginInputDecoration(
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
                            loginFromProvider.password = value,
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
                        decoration: CustomInputs.loginInputDecoration(
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
                          final isvalid = loginFromProvider.validateForm();
                          if (isvalid) {
                            authProvider.login(loginFromProvider.email,
                                loginFromProvider.password);
                          }
                        },
                        text: 'Ingresar',
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      LinkText(
                        text: 'Nueva Cuenta',
                        onPressed: () {
                          Navigator.pushNamed(
                              context, Flutorouter.registerRoute);
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
