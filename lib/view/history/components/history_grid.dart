
import 'package:flutter/material.dart';
import 'package:franciscoCV/view/history/components/inner_timeline.dart';
import 'package:timelines/timelines.dart';

import '../../../model/companies.dart';
import '../../../model/linkedin_data.dart';

class HistoryGrid extends StatelessWidget {
  final int crossAxisCount;
  final double ratio;
  HistoryGrid({super.key, this.crossAxisCount = 3,  this.ratio=1.3});
  // final controller = Get.put(CertificationController());

  @override
  Widget build(BuildContext context) {
    // Merge LinkedIn data with static data
    final List<Timeline> allHistory = [...linkedinCompanies, ...companies];

    return FixedTimeline.tileBuilder(
          theme: TimelineThemeData(
            nodePosition: 0,
            color: Color(0xff989898),
            indicatorTheme: IndicatorThemeData(
              position: 0,
              size: 20.0,
            ),
            connectorTheme: ConnectorThemeData(
              thickness: 2.5,
            ),
          ),
          builder: TimelineTileBuilder.connected(
            connectionDirection: ConnectionDirection.before,
            itemCount: allHistory.length,
            contentsBuilder: (_, index) {

              return Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      allHistory[index].name,
                      style: DefaultTextStyle.of(context).style.copyWith(
                            fontSize: 18.0,
                          ),
                    ),
                    InnerTimeline(messages: allHistory[index].messages),
                  ],
                ),
              );
            },
            indicatorBuilder: (_, index) {
                return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(colors: [
                  Colors.pinkAccent,
                  Colors.blue,
                ]),
                boxShadow:  [
                  BoxShadow(
                    color: Colors.pink,
                    offset: const Offset(-2, 0),
                    blurRadius: 10 ,
                  ),
                  BoxShadow(
                    color: Colors.blue,
                    offset: const Offset(2, 0),
                    blurRadius:  10 ,
                  )
                ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                        allHistory[index].date,
                        style: DefaultTextStyle.of(context).style.copyWith(
                              fontSize: 18.0,
                              color: Colors.white,
                  
                            ),
                      ),
                ),
                  ); 
                         
            },
            connectorBuilder: (_, index, ___) => SolidLineConnector(
              color:  Theme.of(context).colorScheme.primary,
            ),
          ),
        );
  }
}






