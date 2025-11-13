# Movie App
[![Ask DeepWiki](https://devin.ai/assets/askdeepwiki.png)](https://deepwiki.com/AyaNasserEzat/movie)

A feature-rich movie browsing application built with Flutter. It leverages The Movie DB (TMDB) API to provide users with up-to-date information on popular, top-rated, and now-playing films.
## 📱 Screenshots
<p align="center">
  <img src="[assets/screenshots/home_screen.png](https://github.com/AyaNasserEzat/movie/blob/f91329133dd35466a780bf6aad2e4b721f94f3c8/WhatsApp%20Image%202025-11-12%20at%208.22.17%20PM%20(2).jpeg)" width="30%">
  <img src="[assets/screenshots/movie_details.png](https://github.com/AyaNasserEzat/movie/blob/f91329133dd35466a780bf6aad2e4b721f94f3c8/WhatsApp%20Image%202025-11-12%20at%208.22.17%20PM%20(1).jpeg)" width="30%">
  <img src="[assets/screenshots/search_screen.png](https://github.com/AyaNasserEzat/movie/blob/f91329133dd35466a780bf6aad2e4b721f94f3c8/WhatsApp%20Image%202025-11-12%20at%208.22.17%20PM%20(3).jpeg)" width="30%">
</p>

## ✨ Features
- **Home Dashboard:** Displays "Now Playing" movies in a dynamic carousel, along with horizontally scrollable lists for "Popular" and "Top Rated" categories.
- **Detailed Movie View:** Tap on any movie to see comprehensive details, including the poster, backdrop, synopsis, user rating, genres, runtime, and release date.
- **Movie Recommendations:** Discover similar movies based on the currently viewed film in the "More Like This" section.
- **Dedicated Categories:** Separate views for "Popular" and "Top Rated" movies, presented in vertically scrollable lists.
- **Real-time Search:** Instantly search for movies by title and view results in a grid layout.
- **Smooth User Experience:** Implements loading skeletons (`skeletonizer`) for a polished and professional feel while data is being fetched.

## 🏛️ Architecture
This project follows the principles of **Clean Architecture** to create a scalable, maintainable, and testable codebase. The app is divided into three core layers:
- **Data Layer:** Handles all data retrieval and management. It includes data sources (remote API calls with `dio`), models (deserializing API responses), and repository implementations.
- **Domain Layer:** Contains the core business logic. It defines entities (plain Dart objects representing the core data), use cases (specific business rules, e.g., `GetPopularMovies`), and repository contracts (abstract interfaces for the data layer).
- **Presentation Layer:** Manages the UI and state. It uses `flutter_bloc` (Cubits) to handle state changes and separates UI widgets from business logic.

## 🛠️ Tech Stack & Key Packages
- **Framework:** Flutter
- **Language:** Dart
- **State Management:** [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- **Networking:** [dio](https://pub.dev/packages/dio)
- **Routing:** [go_router](https://pub.dev/packages/go_router)
- **Dependency Injection:** [get_it](https://pub.dev/packages/get_it)
- **Image Caching:** [cached_network_image](https://pub.dev/packages/cached_network_image)
- **UI:** [carousel_slider](https://pub.dev/packages/carousel_slider), [skeletonizer](https://pub.dev/packages/skeletonizer)
- **Testing:** [bloc_test](https://pub.dev/packages/bloc_test), [mockito](https://pub.dev/packages/mockito)

## 🚀 Getting Started
To run this project locally, follow these steps:

1. **Clone the repository:**
   ```bash
   git clone https://github.com/ayanasserezat/movie.git
   cd movie
   ```

2. **Add your TMDB API Key:**
   You need an API key from [The Movie DB](https://www.themoviedb.org/signup). Once you have your key, add it to the `apiKey` constant in the following file:

   ```dart
   // lib/core/database/api/end_point.dart
   class EndPoint {
     static const String apiKey = 'YOUR_API_KEY_HERE';
     static const String baseUrl = "https://api.themoviedb.org/3/";
     // ... other endpoints
   }
   ```

3. **Install dependencies:**
   ```bash
   flutter pub get
   ```

4. **Run the app:**
   ```bash
   flutter run
   ```

## 📁 Project Structure
The project is structured using a feature-first approach within the Clean Architecture layers.

```
lib
└── core
    ├── database/api     # API consumer (Dio), endpoints
    ├── features/home
    │   ├── data         # Models, repositories, data sources
    │   ├── domain       # Entities, use cases, repository interfaces
    │   └── presentation # Cubits, views, and widgets
    ├── routs          # App routing with go_router
    └── servieces      # Dependency injection setup with get_it
main.dart            # App entry point
