import 'package:flutter_test/flutter_test.dart';
import 'package:movies/core/features/home/data/models/movie_model.dart';

void main() {
  group('MovieModel', () {
    // JSON وهمي زي اللي بيجي من الـ API
    final Map<String, dynamic> tJson = {
      "id": 1,
      "adult": false,
      "backdrop_path": "/path.jpg",
      "genre_ids": [12, 18],
      "original_language": "en",
      "original_title": "Inception",
      "overview": "A mind-bending thriller",
      "popularity": 88.9,
      "poster_path": "/poster.jpg",
      "release_date": "2010-07-16",
      "title": "Inception",
      "video": false,
      "vote_average": 8.8,
      "vote_count": 10000
    };

    final tMovieModel = MovieModel(
      id: 1,
      adult: false,
      backdropPath: "/path.jpg",
      genreIds: [12, 18],
      originalLanguage: "en",
      originalTitle: "Inception",
      overview: "A mind-bending thriller",
      popularity: 88.9,
      posterPath: "/poster.jpg",
      releaseDate: "2010-07-16",
      title: "Inception",
      video: false,
      voteAverage: 8.8,
      voteCount: 10000,
    );
    

    // ✅ 1. اختبار fromJson()
    test('should return valid model from JSON', () {
      final result = MovieModel.fromJson(tJson);
      expect(result.toJson(), tMovieModel.toJson());
    });

    // ✅ 2. اختبار toJson()
    test('should return correct JSON map', () {
      final result = tMovieModel.toJson();
      expect(result, tJson);
    });

    // ✅ 3. اختبار لما بعض القيم تكون null أو فاضية
    test('should handle null and empty values gracefully', () {
      final jsonWithNulls = {
        "id": 2,
        "adult": null,
        "backdrop_path": null,
        "genre_ids": null,
        "original_language": null,
        "original_title": null,
        "overview": null,
        "popularity": null,
        "poster_path": null,
        "release_date": null,
        "title": null,
        "video": null,
        "vote_average": null,
        "vote_count": 0
      };

      final result = MovieModel.fromJson(jsonWithNulls);

      // هنا بنتأكد إن القيم الافتراضية اتطبقت صح
      expect(result.id, 2);
      expect(result.adult, false);
      expect(result.backdropPath, '');
      expect(result.genreIds, []);
      expect(result.originalLanguage, '');
      expect(result.originalTitle, '');
      expect(result.overview, '');
      expect(result.popularity, 0.0);
      expect(result.posterPath, '');
      expect(result.releaseDate, '');
      expect(result.title, '');
      expect(result.video, false);
      expect(result.voteAverage, 0.0);
      expect(result.voteCount, 0);
    });
  });
}
