import 'package:flutter/material.dart';
import 'package:timelines_plus/timelines_plus.dart';

import '../../../model/companies.dart' show TimelineMessage;

class InnerTimeline extends StatelessWidget {
  const InnerTimeline({
    required this.messages,
  });

  final List<TimelineMessage> messages;

  @override
  Widget build(BuildContext context) {
    bool isEdgeIndex(int index) {
      return index == 0 || index == messages.length + 1;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Timeline.tileBuilder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        theme: TimelineTheme.of(context).copyWith(
          nodePosition: 0,
          connectorTheme: TimelineTheme.of(context).connectorTheme.copyWith(
                thickness: 1.0,
              ),
          indicatorTheme: TimelineTheme.of(context).indicatorTheme.copyWith(
                size: 10.0,
                position: 0.5,
              ),
        ),
        builder: TimelineTileBuilder(
          indicatorBuilder: (_, index) =>
              !isEdgeIndex(index) ? Indicator.outlined(borderWidth: 1.0) : null,
          startConnectorBuilder: (_, index) => Connector.solidLine(),
          endConnectorBuilder: (_, index) => Connector.solidLine(),
          contentsBuilder: (_, index) {
            if (isEdgeIndex(index)) {
              return null;
            }

            return Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 4.0, bottom: 4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    messages[index - 1].createdAt,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  Text(
                    messages[index - 1].message,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
            );
          },
          nodeItemOverlapBuilder: (_, index) =>
              isEdgeIndex(index) ? true : null,
          itemCount: messages.length + 2,
        ),
      ),
    );
  }
}