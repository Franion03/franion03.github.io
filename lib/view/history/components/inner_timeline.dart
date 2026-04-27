import 'package:flutter/material.dart';

import '../../../model/companies.dart' show TimelineMessage;

class InnerTimeline extends StatelessWidget {
  const InnerTimeline({
    required this.messages,
  });

  final List<TimelineMessage> messages;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        children: [
          for (int i = 0; i < messages.length; i++)
            _buildTimelineItem(context, messages[i], i == messages.length - 1),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(BuildContext context, TimelineMessage message, bool isLast) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Theme.of(context).colorScheme.primary, width: 1),
              ),
            ),
            if (!isLast)
              Container(
                width: 1,
                height: 40, // Approximate height for the connector
                color: Theme.of(context).colorScheme.primary,
              ),
          ],
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                message.createdAt,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                message.message,
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 16), // Spacing between items
            ],
          ),
        ),
      ],
    );
  }
}