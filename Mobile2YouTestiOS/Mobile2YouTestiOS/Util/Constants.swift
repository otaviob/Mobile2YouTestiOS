import Foundation

struct TheMovieDBAPI {
    static let urlImages = "https://image.tmdb.org/t/p/"
    static let urlMovie = "https://api.themoviedb.org/3/movie"
    static let apiKey = "e364d9e10867afe7d1b670c045e4b71b"
}

enum ImageSize: String {
    case poster_big = "w780"
    case poster = "w300"
}

struct Language {
    static let english = "en-US"
    static let portugues = "pt-BR"
}
