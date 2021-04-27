import Foundation
import Alamofire

public class ServiceConnection {
    
    let jsonDecoder = JSONDecoder()
    static let language = Language.english
    
    struct General {
        static let appName = "Mobile2YouTestiOS"
        static let none = ""
        static let dash = "-"
        static let dashCharacter: Character = "-"
        static let space = " "
        static let noWifiImage = "no-wifi"
        static let reloadImage = "reload"
        static let errorCellImage = "errorCell"
        static let dateRegex = "^[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]$"
        static let dateUserDefaultRegex = "^[0-9][0-9]-[0-9][0-9]-[0-9][0-9][0-9][0-9] [0-9][0-9]:[0-9][0-9]$"
        static let dateUserDefaultFormat = "dd-MM-yyyy HH:mm"
        static let genresText = "Genres: "
        static let movieText = "Movie"
        static let queueName = "com.josimax"
        static let refreshTime = 5000
    }
    
    enum RequestErrors: String {
        case noInternet
        case unexpectedError
        
        var message: String {
            switch self {
            case .noInternet:
                return "Check your Internet connection\nPull to refresh"
            case .unexpectedError:
                return "No data available\nPull to refresh"
            }
        }
    }
    
    static func urlMovie(_ id: Int) -> String {
        let url = TheMovieDBAPI.urlMovie +
            "/\(id)" +
            "?api_key=\(TheMovieDBAPI.apiKey)"
        return url
    }
    static func urlSimilarMovies(_ id: Int) -> String {
        let url = TheMovieDBAPI.urlMovie +
            "/\(id)" +
            "/similar" +
            "?api_key=\(TheMovieDBAPI.apiKey)" +
            "&language=\(language)"  +
            "&page=1"
        return url
    }

    
        // MARK: - Custom Requests (Get - Post - Authentication)
    func makeHTTPGetRequest<T:Codable>(_ url: String,_ type: T.Type, onCompletion: @escaping (T?, RequestErrors?) -> Void) {
        let queue = DispatchQueue(label: General.queueName, qos: .utility, attributes: [.concurrent])
        Alamofire.request(url)
            .response(queue: queue) { (response) in
                if let data = response.data {
                    do {
                        let object = try self.jsonDecoder.decode(type, from: data)
                        DispatchQueue.main.async {
                            onCompletion(object, nil)
                        }
                        return
                    } catch {
                        DispatchQueue.main.async {
                            onCompletion(nil, .unexpectedError)
                        }
                    }
                }
        }
    }
    
}

