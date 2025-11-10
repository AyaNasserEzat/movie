import 'package:flutter_test/flutter_test.dart';
import 'package:movies/core/features/home/data/models/movie_detail_model/movie_detail_model.dart';
import 'package:movies/core/features/home/data/models/movie_detail_model/belongs_to_collection.dart';
import 'package:movies/core/features/home/data/models/movie_detail_model/genre.dart';
import 'package:movies/core/features/home/data/models/movie_detail_model/production_company.dart';
import 'package:movies/core/features/home/data/models/movie_detail_model/production_country.dart';
import 'package:movies/core/features/home/data/models/movie_detail_model/spoken_language.dart';

void main() {
  group('MovieDetailModel', () {
    final tJson = {
      "adult": true,
      "backdrop_path": "/backdrop.jpg",
      "belongs_to_collection": {
        "id": 1,
        "name": "Collection",
        "poster_path": "/poster.jpg",
        "backdrop_path": "/backdrop.jpg"
      },
      "budget": 100000,
      "genres": [
        {"id": 1, "name": "Action"}
      ],
      "homepage": "https://example.com",
      "id": 123,
      "imdb_id": "tt1234567",
      "origin_country": ["US"],
      "original_language": "en",
      "original_title": "Original Title",
      "overview": "Some overview",
      "popularity": 10.5,
      "poster_path": "/poster.jpg",
      "production_companies": [
        {"id": 1, "logo_path": "/logo.png", "name": "Company", "origin_country": "US"}
      ],
      "production_countries": [
        {"iso_3166_1": "US", "name": "United States of America"}
      ],
      "release_date": "2025-11-10",
      "revenue": 200000,
      "runtime": 120,
      "spoken_languages": [
        {"iso_639_1": "en", "name": "English"}
      ],
      "status": "Released",
      "tagline": "Tagline",
      "title": "Movie Title",
      "video": false,
      "vote_average": 7.5,
      "vote_count": 1000
    };

    test('fromJson should return valid MovieDetailModel', () {
      final result = MovieDetailModel.fromJson(tJson);

      expect(result.adult, true);
      expect(result.backdropPath, "/backdrop.jpg");
      expect(result.belongsToCollection, isA<BelongsToCollection>());
      expect(result.budget, 100000);
      expect(result.genres, isA<List<Genre>>());
      expect(result.homepage, "https://example.com");
      expect(result.id, 123);
      expect(result.imdbId, "tt1234567");
      expect(result.originCountry, ["US"]);
      expect(result.originalLanguage, "en");
      expect(result.originalTitle, "Original Title");
      expect(result.overview, "Some overview");
      expect(result.popularity, 10.5);
      expect(result.posterPath, "/poster.jpg");
      expect(result.productionCompanies, isA<List<ProductionCompany>>());
      expect(result.productionCountries, isA<List<ProductionCountry>>());
      expect(result.releaseDate, "2025-11-10");
      expect(result.revenue, 200000);
      expect(result.runtime, 120);
      expect(result.spokenLanguages, isA<List<SpokenLanguage>>());
      expect(result.status, "Released");
      expect(result.tagline, "Tagline");
      expect(result.title, "Movie Title");
      expect(result.video, false);
      expect(result.voteAverage, 7.5);
      expect(result.voteCount, 1000);
    });

    test('toJson should return valid JSON map', () {
      final model = MovieDetailModel.fromJson(tJson);
      final json = model.toJson();

      expect(json['adult'], true);
      expect(json['backdrop_path'], "/backdrop.jpg");
      expect(json['belongs_to_collection'], isA<Map<String, dynamic>>());
      expect(json['budget'], 100000);
      expect(json['genres'], isA<List<dynamic>>());
      expect(json['homepage'], "https://example.com");
      expect(json['id'], 123);
      expect(json['imdb_id'], "tt1234567");
      expect(json['origin_country'], ["US"]);
      expect(json['original_language'], "en");
      expect(json['original_title'], "Original Title");
      expect(json['overview'], "Some overview");
      expect(json['popularity'], 10.5);
      expect(json['poster_path'], "/poster.jpg");
      expect(json['production_companies'], isA<List<dynamic>>());
      expect(json['production_countries'], isA<List<dynamic>>());
      expect(json['release_date'], "2025-11-10");
      expect(json['revenue'], 200000);
      expect(json['runtime'], 120);
      expect(json['spoken_languages'], isA<List<dynamic>>());
      expect(json['status'], "Released");
      expect(json['tagline'], "Tagline");
      expect(json['title'], "Movie Title");
      expect(json['video'], false);
      expect(json['vote_average'], 7.5);
      expect(json['vote_count'], 1000);
    });
  });
}
