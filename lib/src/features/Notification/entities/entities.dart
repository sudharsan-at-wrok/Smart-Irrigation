class NotificationEntities {
  final String title;
  final String content;
  final String date;
  final bool alert;

  NotificationEntities({
    required this.title,
    required this.content,
    required this.date,
    required this.alert,
  });

  factory NotificationEntities.fromMap(Map<String, dynamic> map) {
    return NotificationEntities(
      title: map['title'] as String,
      content: map['body'] as String,
      date: map['time'] as String,
      alert: map['alert'] as bool,
    );
  }
}
