import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../include/Rows/blogcardmain.dart';

class BlogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: BlogCardDesk(),
      tablet: BlogCardTab(),
      mobile: BlogCardMob(),      
    );
  }
}