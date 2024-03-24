import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../include/Rows/welcomepagemain.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => WelcomePageMob(),
       desktop: (BuildContext context) => WelcomePageDesk(),
       tablet: (BuildContext context) => WelcomePageTab(),    
    );
  }
}
