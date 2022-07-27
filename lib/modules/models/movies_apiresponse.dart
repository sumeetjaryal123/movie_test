class MoviesApiresponse {
  MoviesApiresponse({
    int? statusCode,
    String? message,
    MoviesData? data,
  }) {
    _statusCode = statusCode;
    _message = message;
    _data = data;
  }

  MoviesApiresponse.fromJson(dynamic json) {
    _statusCode = json['status_code'];
    _message = json['message'];
    _data = json['data'] != null ? MoviesData.fromJson(json['data']) : null;
  }
  int? _statusCode;
  String? _message;
  MoviesData? _data;
  MoviesApiresponse copyWith({
    int? statusCode,
    String? message,
    MoviesData? data,
  }) =>
      MoviesApiresponse(
        statusCode: statusCode ?? _statusCode,
        message: message ?? _message,
        data: data ?? _data,
      );
  int? get statusCode => _statusCode;
  String? get message => _message;
  MoviesData? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status_code'] = _statusCode;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

class MoviesData {
  MoviesData({
    List<Movies>? movies,
  }) {
    _movies = movies;
  }

  MoviesData.fromJson(dynamic json) {
    if (json['movies'] != null) {
      _movies = [];
      json['movies'].forEach((v) {
        _movies?.add(Movies.fromJson(v));
      });
    }
  }
  List<Movies>? _movies;
  MoviesData copyWith({
    List<Movies>? movies,
  }) =>
      MoviesData(
        movies: movies ?? _movies,
      );
  List<Movies>? get movies => _movies;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_movies != null) {
      map['movies'] = _movies?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Movies {
  Movies({
    int? id,
    String? name,
    String? year,
    String? director,
    String? mainStar,
    String? description,
    int? favoritedByUsers,
    List<String>? genres,
    String? thumbnail,
  }) {
    _id = id;
    _name = name;
    _year = year;
    _director = director;
    _mainStar = mainStar;
    _description = description;
    _favoritedByUsers = favoritedByUsers;
    _genres = genres;
    _thumbnail = thumbnail;
  }

  Movies.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _year = json['year'];
    _director = json['director'];
    _mainStar = json['main_star'];
    _description = json['description'];
    _favoritedByUsers = json['favorited_by_users'];
    _genres = json['genres'] != null ? json['genres'].cast<String>() : [];
    _thumbnail = json['thumbnail'];
  }
  int? _id;
  String? _name;
  String? _year;
  String? _director;
  String? _mainStar;
  String? _description;
  int? _favoritedByUsers;
  List<String>? _genres;
  String? _thumbnail;
  Movies copyWith({
    int? id,
    String? name,
    String? year,
    String? director,
    String? mainStar,
    String? description,
    int? favoritedByUsers,
    List<String>? genres,
    String? thumbnail,
  }) =>
      Movies(
        id: id ?? _id,
        name: name ?? _name,
        year: year ?? _year,
        director: director ?? _director,
        mainStar: mainStar ?? _mainStar,
        description: description ?? _description,
        favoritedByUsers: favoritedByUsers ?? _favoritedByUsers,
        genres: genres ?? _genres,
        thumbnail: thumbnail ?? _thumbnail,
      );
  int? get id => _id;
  String? get name => _name;
  String? get year => _year;
  String? get director => _director;
  String? get mainStar => _mainStar;
  String? get description => _description;
  int? get favoritedByUsers => _favoritedByUsers;
  List<String>? get genres => _genres;
  String? get thumbnail => _thumbnail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['year'] = _year;
    map['director'] = _director;
    map['main_star'] = _mainStar;
    map['description'] = _description;
    map['favorited_by_users'] = _favoritedByUsers;
    map['genres'] = _genres;
    map['thumbnail'] = _thumbnail;
    return map;
  }
}
