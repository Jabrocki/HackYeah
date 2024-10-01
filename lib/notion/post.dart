
class Post {
  final String userName;
  final String activity;
  final int value;
  final int likes;

  const Post({
    required this.userName,
    required this.activity,
    required this.value,
    required this.likes,
  });

  factory Post.fromMap(Map<String, dynamic> map) {
    final properties = map['properties'] as Map<String, dynamic>;
    return Post(
      userName: properties['UserName']?['title']?[0]?['plain_text'] ?? '??',
      activity: properties['Activity']?['select']?['name'] ?? 'Any',
      value: properties['Value']?['number'] ?? 0,
      likes: properties['likes']?['number'] ?? 0,
    );
  }
}

class User {
  final String userName;
  final String password;

  const User({
    required this.userName,
    required this.password,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    final properties = map['properties'] as Map<String, dynamic>;
    return User(
      userName: properties['UserName']?['title']?[0]?['plain_text'] ?? '??',
      password: properties['Password']?['rich_text']?[0]?['plain_text'] ?? '??',
    );
  }
}

class ActivityVar {
  final String activityName;
  final String unit;
  final int activityIcon;
  final String desc;

  const ActivityVar(
      {required this.activityName,
      required this.unit,
      required this.activityIcon,
      required this.desc});

  factory ActivityVar.fromMap(Map<String, dynamic> map) {
    final properties = map['properties'] as Map<String, dynamic>;
    return ActivityVar(
        activityName:
            properties['Activity']?['title']?[0]?['plain_text'] ?? '??',
        unit: properties['unit']?['select']?['name'] ?? '??',
        activityIcon:
            properties['icon']?['number'] ?? 0,
        desc: properties['desc']?['rich_text']?[0]?['plain_text'] ?? '??');
  }
}
