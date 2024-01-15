// ignore_for_file: public_member_api_docs, sort_constructors_first
class Movie {
  // int? id;
  // int? voteCount;
  String? title;
  String? backdropPath;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;
  double? voteAverage;
  // double? popularity;
  // String? originalLanguage;
  // bool? video;
  Movie({
    // this.id,
    // this.voteCount,
    this.title,
    this.backdropPath,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.voteAverage,
    // this.popularity,
    // this.originalLanguage,
    // this.video,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {

    return Movie(
      title: json['title'],
      backdropPath: json['backdrop_path'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average'],
      // id: json['id'],
      // voteCount: json['voteCount'],
      // popularity: json['popularity'],
      // originalLanguage: json['originalLanguage'],
      // video: json['video'],
    );
  }
}
