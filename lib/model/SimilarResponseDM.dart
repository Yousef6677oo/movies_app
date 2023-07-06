class SimilarDM {
  SimilarDM(
      {this.page,
      this.results,
      this.totalPages,
      this.totalResults,
      this.statusCode,
      this.statusMessage,
      this.success});

  SimilarDM.fromJson(dynamic json) {
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(Result.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
    statusCode = json['status_code'];
    statusMessage = json['status_message'];
    success = json['success'];
  }

  int? page;
  List<Result>? results;
  int? totalPages;
  int? totalResults;
  int? statusCode;
  String? statusMessage;
  bool? success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    if (results != null) {
      map['results'] = results?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    map['status_code'] = statusCode;
    map['status_message'] = statusMessage;
    map['success'] = success;
    return map;
  }
}

/// adult : false
/// backdrop_path : "/moTOuNKnM2phZCYPF49Y1Hb7WJj.jpg"
/// genre_ids : [18]
/// id : 655
/// original_language : "en"
/// original_title : "Paris, Texas"
/// overview : "A man wanders out of the desert not knowing who he is. His brother finds him, and helps to pull his memory back of the life he led before he walked out on his family and disappeared four years earlier."
/// popularity : 20.908
/// poster_path : "/7G6ea5djDvCxfqfoMAX8479T4UB.jpg"
/// release_date : "1984-08-23"
/// title : "Paris, Texas"
/// video : false
/// vote_average : 8.097
/// vote_count : 1491

class Result {
  Result({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  Result.fromJson(dynamic json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<int>() : [];
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['genre_ids'] = genreIds;
    map['id'] = id;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    map['release_date'] = releaseDate;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }
}
