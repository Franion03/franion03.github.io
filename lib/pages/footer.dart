import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class FooterPage extends StatelessWidget {
  const FooterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (BuildContext context) => FooterDesk(),
      tablet: (BuildContext context) => FooterTab(),
      mobile: (BuildContext context) => FooterMob(),
    );
  }
}

class FooterDesk extends StatelessWidget {
  const FooterDesk({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Made with ❤️ by Fran Quiles',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey.shade500),
            )
          ],
        ),
      ),
    );
  }
}

class FooterTab extends StatelessWidget {
  const FooterTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Made with ❤️ by Fran Quiles',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey.shade500),
            )
          ],
        ),
      ),
    );
  }
}

class FooterMob extends StatelessWidget {
  const FooterMob({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Made with ❤️ by Fran Quiles',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey.shade500),
            )
          ],
        ),
      ),
    );
  }
}
