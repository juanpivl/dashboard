import 'package:flutter/material.dart';
import 'package:nutricion_app/ui/cards/white_cards.dart';
import 'package:nutricion_app/ui/labels/custom_labels.dart';

class IconsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text(
            'Icons',
            style: CustomLabels.h1,
          ),
          SizedBox(height: 10),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              WhiteCard(
                title: 'ac_unit_outlined',
                child: Center(
                  child: Icon(Icons.ac_unit_outlined),
                ),
                width: 170,
              ),
              WhiteCard(
                title: 'people',
                child: Center(
                  child: Icon(Icons.people),
                ),
                width: 170,
              ),
              WhiteCard(
                title: 'access_alarm_outlined',
                child: Center(
                  child: Icon(Icons.access_alarm_outlined),
                ),
                width: 170,
              ),
              WhiteCard(
                title: 'safety_divider',
                child: Center(
                  child: Icon(Icons.safety_divider),
                ),
                width: 170,
              ),
              WhiteCard(
                title: 'safety_divider',
                child: Center(
                  child: Icon(Icons.safety_divider),
                ),
                width: 170,
              ),
              WhiteCard(
                title: 'safety_divider',
                child: Center(
                  child: Icon(Icons.safety_divider),
                ),
                width: 170,
              ),
              WhiteCard(
                title: 'safety_divider',
                child: Center(
                  child: Icon(Icons.safety_divider),
                ),
                width: 170,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
