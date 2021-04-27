import Foundation

class MovieViewModel {
    
    var movie:Movie!
    var similarMovies : [Movie] = []
    private var service = ServiceConnection()
    var idMovie = 66
    
    func fetchPopularMoviesData(completion: @escaping () -> ()) {
        let url = ServiceConnection.urlMovie(idMovie)
        service.makeHTTPGetRequest(url, Movie.self) { (movie, error) in
            self.movie = movie
             completion()
        }
    }
    
    func fetchPopularSimilarMoviesData(completion: @escaping () -> ()) {
        let url = ServiceConnection.urlSimilarMovies(idMovie)
        service.makeHTTPGetRequest(url, MovieList.self) { (similarMovies, error) in
            self.similarMovies = similarMovies?.list ?? []
            completion()
        }
    }
    
    func numberOfRowsInSection(section: Int) -> Int {
        if similarMovies.count != 0 {
            return similarMovies.count
        }
        return 0
    }
    
    func cellForRowAt (indexPath: IndexPath) -> Movie {
        return similarMovies[indexPath.row]
    }
    
}
