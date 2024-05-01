class Task {
  final String taskTitle;
  final String taskActivity;
  final String date;
  final String startTime;
  final String endTime;
  final bool remaindMe;
  final String description;

  Task({
    required this.taskTitle,
    required this.taskActivity,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.remaindMe,
    required this.description,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      taskTitle: json['taskTitle'] ?? '',
      taskActivity: json['taskActivity'] ?? '',
      date: json['date'] ?? '',
      startTime: json['startTime'] ?? '',
      endTime: json['endTime'] ?? '',
      remaindMe: json['remaindMe'] ?? false,
      description: json['description'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'taskTitle': taskTitle,
      'taskActivity': taskActivity,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      'remaindMe': remaindMe,
      'description': description,
    };
  }
}
