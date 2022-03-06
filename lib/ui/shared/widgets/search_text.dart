import 'package:flutter/material.dart';
import 'package:nutricion_app/ui/inputs/custom_inputs.dart';

class SearchText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: buildBoxDecoration(),
      child: TextField(
        decoration: CustomInputs.searchInputDecoration(
            hint: 'Buscar', icon: Icons.search_rounded),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.grey.withOpacity(0.1));
}
