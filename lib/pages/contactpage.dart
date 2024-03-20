import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../include/Rows/contactpagemain.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: ContactPageDesk(),
      tablet: ContactPageTab(),
      mobile: ContactPageMob(),      
    );
  }
}