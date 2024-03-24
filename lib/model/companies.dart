class Timeline {
  const Timeline(
    this.name, {
    this.messages = const [],
    this.date = '',
  });

  Timeline.complete()
      : this.name = 'Done',
        this.messages = const [],
        this.date = DateTime.now().year.toString();

  final String name;
  final String date;
  final List<TimelineMessage> messages;

  bool get isCompleted => name == 'Done';
}

class TimelineMessage {
  const TimelineMessage(this.createdAt, this.message);

  final String createdAt; // final DateTime createdAt;
  final String message;

  @override
  String toString() {
    return '$createdAt $message';
  }
}

List<Timeline> companies = [
  Timeline(
    'Odyssey Robotics',
    messages: [
      TimelineMessage('2021-08-01', 'Order placed'),
    ],
    date: '2020'
  ),
  Timeline(
    'Swisscom',
    messages: [
      TimelineMessage('2021-08-01', 'Order confirmed'),
    ],
    date: '2023'
  ),
  Timeline.complete(),
];
