import 'package:flutter/material.dart';

import '../../../buttons/link_text.dart';

class LinksBard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        color: Colors.black,
        height: (size.width > 1000) ? size.height * 0.07 : null,
        child: Wrap(
          alignment: WrapAlignment.center,
          children: const [
            LinkText(
              text: 'About',
            ),
            LinkText(text: 'Help Center'),
            LinkText(text: 'Terms of Service'),
            LinkText(text: 'Privacy policy'),
            LinkText(text: 'Cookie policy'),
            LinkText(text: 'Ads Info'),
            LinkText(text: 'Status'),
            LinkText(text: 'Marketing'),
            LinkText(text: '2022'),
          ],
        ));
  }
}
