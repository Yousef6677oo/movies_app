class PopularDM {
  PopularDM(
      {this.page,
      this.results,
      this.totalPages,
      this.totalResults,
      this.statusCode,
      this.statusMessage,
      this.success});

  PopularDM.fromJson(dynamic json) {
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

  dynamic? page;
  List<Result>? results;
  dynamic? totalPages;
  dynamic? totalResults;
  dynamic? statusCode;
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
/// backdrop_path : "/27u4kBGGOQLqizEudJAOWMkvhip.jpg"
/// genre_ids : [28,80,53]
/// id : 385687
/// original_language : "en"
/// original_title : "Fast X"
/// overview : "Over many missions and against impossible odds, Dom Toretto and his family have outsmarted, out-nerved and outdriven every foe in their path. Now, they confront the most lethal opponent they've ever faced: A terrifying threat emerging from the shadows of the past who's fueled by blood revenge, and who is determined to shatter this family and destroy everything—and everyone—that Dom loves, forever."
/// popularity : 4156.935
/// poster_path : "/fiVW06jE7z9YnO4trhaMEdclSiC.jpg"
/// release_date : "2023-05-17"
/// title : "Fast X"
/// video : false
/// vote_average : 7.3
/// vote_count : 2346

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
  List<dynamic>? genreIds;
  dynamic? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  dynamic? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  dynamic? voteAverage;
  dynamic? voteCount;

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
