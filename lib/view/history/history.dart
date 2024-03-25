import 'package:flutter/material.dart';
import 'package:franciscoCV/view%20model/responsive.dart';

import '../../res/constants.dart';
import '../projects/components/title_text.dart';
import 'components/history_grid.dart';

class History extends StatelessWidget {
   History({super.key});
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
          const TitleText(prefix: 'Professional ', title: 'Experience'),
          const SizedBox(
            height: defaultPadding,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Responsive(
                desktop: HistoryGrid(crossAxisCount: 3,ratio: 1.5,),
                extraLargeScreen: HistoryGrid(crossAxisCount: 4,ratio: 1.6),
                largeMobile: HistoryGrid(crossAxisCount: 1,ratio: 1.8),
                mobile: HistoryGrid(crossAxisCount: 1,ratio: 1.4),
                tablet: HistoryGrid(ratio: 1.7,crossAxisCount: 2,)),
          )
        ],
      ),
    );
  }
}