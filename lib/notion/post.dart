class Post {
  final String userName;
  final String activity;
  final int value;
  final int likes;

  const Post({
    required this.userName,
    required this.activity,
    required this.value,
    required this.likes
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