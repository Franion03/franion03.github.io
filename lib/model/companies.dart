class Timeline {
  const Timeline(
    this.name, {
    this.messages = const [],
    this.date = '',
  });

  Timeline.complete()
      : this.name = '',
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
      TimelineMessage('Flutter', 'Developer, use of git and rest api '),
      TimelineMessage('Flutter', 'Frontend Scrum Master'),
      TimelineMessage('Python', 'Ml Pipeline'),
      TimelineMessage('Python', 'CNN  for video classification'),
    ],
    date: '2020'
  ),
  Timeline(
    'Swisscom',
    messages: [
      TimelineMessage('Typescript', 'Full Stack developer'),
      TimelineMessage('Golang', 'Full Stack developer'),
      TimelineMessage('Gitlab', 'Use of gitlab ci/cd for deployment and testing'),
      TimelineMessage('Aws', 'working on application for help other apps to migrate to aws'),
    ],
    date: '2023'
  ),
  Timeline.complete(),
];
