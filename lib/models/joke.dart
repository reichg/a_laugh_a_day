class JokeObject {
  JokeObject({
    required this.id,
    required this.joke,
    required this.status,
  });
  final String id;
  final String joke;
  final int status;

  factory JokeObject.fromJson(Map<String, dynamic> data) {
    return JokeObject(
        id: data['id'] as String,
        joke: data['joke'] as String,
        status: data['status'] as int);
  }
}
