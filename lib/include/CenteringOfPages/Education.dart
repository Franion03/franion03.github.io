import '../Rows/educationmain.dart';
import 'package:flutter/material.dart';

class EducationDesk extends StatelessWidget {
  const EducationDesk({super.key});
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Row(
        children: <Widget>[
          Expanded(child: EduDesk()),
        ],
      ),
    );
  }
}

class EducationMob extends StatelessWidget {
  const EducationMob({super.key});
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          EduMob(),
        ],
      ),
    );
  }
}

class EducationTab extends StatelessWidget {
  const EducationTab({super.key});
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          EduTab(),
        ],
      ),
    );
  }
}
