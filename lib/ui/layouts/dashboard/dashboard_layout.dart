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
    SideMenuProvider.menuController = new AnimationController(
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
                    Expanded(
                        child: Padding(
                      child: widget.child,
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    ))
                  ],
                ),
              )
            ],
          ),
          if (size.width < 700)
            AnimatedBuilder(
                animation: SideMenuProvider.menuController,
                builder: (context, _) => Stack(
                      children: [
                        if (SideMenuProvider.isOpen)
                          Opacity(
                            opacity: SideMenuProvider.opacity.value,
                            child: GestureDetector(
                              onTap: () => SideMenuProvider.closeMenu(),
                              child: Container(
                                width: size.width,
                                height: size.height,
                                color: Colors.black26,
                              ),
                            ),
                          ),
                        Transform.translate(
                          offset: Offset(SideMenuProvider.movement.value, 0),
                          child: Sidebar(),
                        ),
                      ],
                    )),
        ],
      ),
    );
  }
}
