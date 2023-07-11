class RecommendedDataModel {
  String posterPath;
  String title;
  String releaseDate;
  double voteAverage;

  RecommendedDataModel(
      {required this.title,
      required this.posterPath,
      required this.releaseDate,
      required this.voteAverage});
}
