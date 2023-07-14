class HomeDataModel {
  String posterPath;
  String backdropPath;
  String overview;
  int id;
  String title;
  String releaseDate;
  dynamic voteAverage;

  HomeDataModel(
      {required this.title,
      required this.posterPath,
      required this.releaseDate,
      required this.voteAverage,
      required this.backdropPath,
      required this.id,
      required this.overview});
}
