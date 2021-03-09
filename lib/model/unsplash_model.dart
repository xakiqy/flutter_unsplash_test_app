class UnsplashModel {
  late List<Result> results;

  UnsplashModel({required this.results});

  UnsplashModel.fromJson(Map<String, dynamic> json) {
    results = [];
    if (json['results'] != null) {
      json['results'].forEach((v) {
        results.add(new Result.fromJson(v));
      });
    }
  }
}

class Result {
  late String description;
  Urls? urls;
  late User user;

  Result({
    required this.description,
    this.urls,
    required this.user,
  });

  Result.fromJson(Map<String, dynamic> json) {
    description = json['description'] != null
        ? json['description']
        : json['alt_description'] != null
        ? json['alt_description'] : '';
    urls = json['urls'] != null ? new Urls.fromJson(json['urls']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : User(
        username: 'anonymous', name: 'anonymous');
  }
}

class Urls {
  late String raw;
  late String full;
  late String regular;
  late String small;
  late String thumb;

  Urls({required this.raw, required this.full, required this.regular,
    required this.small, required this.thumb});

  Urls.fromJson(Map<String, dynamic> json) {
    raw = json['raw'];
    full = json['full'];
    regular = json['regular'];
    small = json['small'];
    thumb = json['thumb'];
  }
}

class User {
  late String username;
  late String name;

  User({required this.username, required this.name});

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'] != null ? json['username'] : 'Anonymous';
    name = json['name'] != null ? json['name'] : 'Anonymous';
  }
}