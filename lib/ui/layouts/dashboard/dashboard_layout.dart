// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nutricion_app/providers/sidemenu_provider.dart';
import 'package:nutricion_app/ui/shared/navbar.dart';
import 'package:nutricion_app/ui/shared/sidebar.dart';

class DashboardLayout extends StatefulWidget {
  final Widget child;

  const DashboardLayout({Key? key, required this.child}) : super(key: key);

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    sideMenuProvider.menuController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 300));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xffEDF1F2),
      body: Stack(
        children: [
          Row(
            children: [
              if (size.width >= 700) Sidebar(),
              Expanded(
                child: Column(
                  children: [
                    //navbar
                    NavBar(),

                    //contenedor del view
                    Expanded(child: widget.child)
                  ],
                ),
              )
            ],
          ),
          if (size.width < 700)
            AnimatedBuilder(
                animation: sideMenuProvider.menuController,
                builder: (context, _) => Stack(
                      children: [
                        if (sideMenuProvider.isOpen)
                          Opacity(
                            opacity: sideMenuProvider.opacity.value,
                            child: GestureDetector(
                              onTap: () => sideMenuProvider.closeMenu(),
                              child: Container(
                                width: size.width,
                                height: size.height,
                                color: Colors.black26,
                              ),
                            ),
                          ),
                        Transform.translate(
                          offset: Offset(sideMenuProvider.movement.value, 0),
                          child: Sidebar(),
                        ),
                      ],
                    )),
        ],
      ),
    );
  }
}
