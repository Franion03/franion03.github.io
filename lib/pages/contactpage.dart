import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../include/Rows/contactpagemain.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (BuildContext context) => const ContactPageDesk(),
      tablet: (BuildContext context) => const ContactPageTab(),
      mobile: (BuildContext context) => const ContactPageMob(),
    );
  }
}
