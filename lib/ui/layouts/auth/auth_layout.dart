// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:nutricion_app/ui/layouts/auth/widgets/background.dart';
import 'package:nutricion_app/ui/layouts/auth/widgets/custom_title.dart';
import 'package:nutricion_app/ui/layouts/auth/widgets/links_bar.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;
  const AuthLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Scrollbar(
      //isAlwaysShown: true,

      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          (size.width > 1000)
              ? _DesktopBody(child: child)
              : _MobileBody(child: child),

          //linksbar
          LinksBard()
        ],
      ),
    ));
  }
}

class _MobileBody extends StatelessWidget {
  final Widget child;

  const _MobileBody({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          CustomTitle(),
          SizedBox(
            width: double.infinity,
            height: 420,
            child: child,
          ),
          SizedBox(
            width: double.infinity,
            height: 400,
            child: Background(),
          )
        ],
      ),
    );
  }
}

class _DesktopBody extends StatelessWidget {
  final Widget child;

  const _DesktopBody({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height * 0.95,
      child: Row(
        children: [
          //background
          Expanded(child: Background()),
          //View container
          Container(
            width: 600,
            height: double.infinity,
            color: Colors.black,
            child: Column(
              children: [
                CustomTitle(),
                SizedBox(height: 50),
                Expanded(child: child),
              ],
            ),
          )
        ],
      ),
    );
  }
}
