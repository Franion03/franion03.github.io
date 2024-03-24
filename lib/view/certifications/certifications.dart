import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:franciscoCV/view%20model/responsive.dart';
import '../../../res/constants.dart';
import '../projects/components/title_text.dart';
import 'components/certification_grid.dart';

class Certifications extends StatelessWidget {
   Certifications({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(Responsive.isLargeMobile(context))const SizedBox(
            height: defaultPadding,
          ),
          const TitleText(prefix: 'Certifications & ', title: 'License'),
          const SizedBox(
            height: defaultPadding,
          ),
          Responsive(
              desktop: CertificateGrid(crossAxisCount: 3,ratio: 1.5,),
              extraLargeScreen: CertificateGrid(crossAxisCount: 4,ratio: 1.6),
              largeMobile: CertificateGrid(crossAxisCount: 1,ratio: 1.8),
              mobile: CertificateGrid(crossAxisCount: 1,ratio: 1.4),
              tablet: CertificateGrid(ratio: 1.7,crossAxisCount: 2,))
        ],
      ),
    );
  }
}










