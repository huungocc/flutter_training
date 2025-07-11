class MovieModel {
  String? backdropPath;
  List<Genres>? genres;
  int? id;
  String? overview;
  String? posterPath;
  String? releaseDate;
  int? revenue;
  int? runtime;
  String? title;
  double? voteAverage;

  MovieModel(
      {this.backdropPath,
        this.genres,
        this.id,
        this.overview,
        this.posterPath,
        this.releaseDate,
        this.revenue,
        this.runtime,
        this.title,
        this.voteAverage});

  MovieModel.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    if (json['genres'] != null) {
      genres = <Genres>[];
      json['genres'].forEach((v) {
        genres!.add(new Genres.fromJson(v));
      });
    }
    id = json['id'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    revenue = json['revenue'];
    runtime = json['runtime'];
    title = json['title'];
    voteAverage = json['vote_average'];
  }
}

class Genres {
  int? id;
  String? name;

  Genres({this.id, this.name});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
