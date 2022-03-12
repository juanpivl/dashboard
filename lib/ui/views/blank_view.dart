import 'package:flutter/material.dart';
import 'package:nutricion_app/ui/cards/white_cards.dart';
import 'package:nutricion_app/ui/labels/custom_labels.dart';

class BlankView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text(
            'BlankView',
            style: CustomLabels.h1,
          ),
          SizedBox(height: 10),
          WhiteCard(
            title: 'black',
            child: Text('Hola mundo'),
          ),
        ],
      ),
    );
  }
}
