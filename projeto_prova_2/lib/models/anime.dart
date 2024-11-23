class Anime {
  String name;
  bool watched;
  String liked;

  Anime({
    required this.name,
    required this.watched,
    this.liked = "",
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'watched': watched,
      'liked': liked,
    };
  }

  static Anime fromMap(Map<String, dynamic> map) {
    return Anime(
      name: map['name'],
      watched: map['watched'],
      liked: map['liked'],
    );
  }
}
