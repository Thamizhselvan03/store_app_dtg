import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../components/common/widgets/custom_text_field.dart';

class ProductSearchInsideRack extends StatelessWidget {
  const ProductSearchInsideRack({super.key});

  @override
  Widget build(BuildContext context) {
    return    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CustomTextField(
        controller: TextEditingController(),
        keyboardType: TextInputType.emailAddress,
        filled: true,
        fillColour: const Color(0xFFF5FCF9),
        hintText: 'Search for products',

        suffixIcon: IconButton(icon: Icon(Icons.mic), onPressed: () {}),

      ),
    );
  }
}
