import 'package:movies/core/features/home/data/models/movie_detail_model/belongs_to_collection.dart';
import 'package:movies/core/features/home/data/models/movie_detail_model/genre.dart';
import 'package:movies/core/features/home/data/models/movie_detail_model/production_company.dart';
import 'package:movies/core/features/home/data/models/movie_detail_model/production_country.dart';
import 'package:movies/core/features/home/data/models/movie_detail_model/spoken_language.dart';
import 'package:movies/core/features/home/domain/entitiy/movie_details_entity.dart';

class MovieDetailModel extends MovieDetailsEntity{
  final bool adult;
  final BelongsToCollection? belongsToCollection;
  final int budget;
  final String? homepage;
  final String? imdbId;
  final List<String> originCountry;
  final String originalLanguage;
  final String originalTitle;
  final List<ProductionCompany> productionCompanies;
  final List<ProductionCountry> productionCountries;
  final int revenue;
  final List<SpokenLanguage> spokenLanguages;
  final String status;
  final String tagline;
  final bool video;
  final int voteCount;

  MovieDetailModel({
    required this.adult,
    required super.backdropPath,
    required this.belongsToCollection,
    required this.budget,
    required super.genres,
    required this.homepage,
    required super.id,
    required this.imdbId,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalTitle,
    required super.overview,
    required super.popularity,
    required super.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required super.releaseDate,
    required this.revenue,
    required super.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required super.title,
    required this.video,
    required super.voteAverage,
    required this.voteCount,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      adult: json['adult'] ?? false,
      backdropPath: json['backdrop_path'],
 belongsToCollection: (json['belongs_to_collection'] is Map<String, dynamic>)
    ? BelongsToCollection.fromJson(json['belongs_to_collection'])
    : null,

      budget: json['budget'] ?? 0,
      genres: (json['genres'] as List<dynamic>?)
              ?.map((e) => Genre.fromJson(e))
              .toList() ??
          [],
      homepage: json['homepage'],
      id: json['id'] ?? 0,
      imdbId: json['imdb_id'],
      originCountry: List<String>.from(json['origin_country'] ?? []),
      originalLanguage: json['original_language'] ?? '',
      originalTitle: json['original_title'] ?? '',
      overview: json['overview'] ?? '',
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0,
      posterPath: json['poster_path'],
      productionCompanies: (json['production_companies'] as List<dynamic>?)
              ?.map((e) => ProductionCompany.fromJson(e))
              .toList() ??
          [],
      productionCountries: (json['production_countries'] as List<dynamic>?)
              ?.map((e) => ProductionCountry.fromJson(e))
              .toList() ??
          [],
      releaseDate: json['release_date'] ?? '',
      revenue: json['revenue'] ?? 0,
      runtime: json['runtime'] ?? 0,
      spokenLanguages: (json['spoken_languages'] as List<dynamic>?)
              ?.map((e) => SpokenLanguage.fromJson(e))
              .toList() ??
          [],
      status: json['status'] ?? '',
      tagline: json['tagline'] ?? '',
      title: json['title'] ?? '',
      video: json['video'] ?? false,
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      voteCount: json['vote_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'adult': adult,
      'backdrop_path': backdropPath,
      'belongs_to_collection': belongsToCollection?.toJson(),
      'budget': budget,
      'genres': genres.map((e) => e.toJson()).toList(),
      'homepage': homepage,
      'id': id,
      'imdb_id': imdbId,
      'origin_country': originCountry,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'production_companies':
          productionCompanies.map((e) => e.toJson()).toList(),
      'production_countries':
          productionCountries.map((e) => e.toJson()).toList(),
      'release_date': releaseDate,
      'revenue': revenue,
      'runtime': runtime,
      'spoken_languages': spokenLanguages.map((e) => e.toJson()).toList(),
      'status': status,
      'tagline': tagline,
      'title': title,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }
}
